require 'nokogiri'
require 'time'
require 'uri'

module Jekyll
  class DisqusImporter < Generator
    safe true
    priority :low

    def generate(site)
      disqus_file = File.join(site.source, site.config['disqus_export_path'])
      return unless File.exist?(disqus_file)

      puts "Importing Disqus comments from XML..."
      doc = Nokogiri::XML(File.open(disqus_file))
      ns = { 'xmlns' => 'http://disqus.com', 'dsq' => 'http://disqus.com/disqus-internals' }

      comments_by_thread = {}
      doc.xpath('//xmlns:post', ns).each do |post_node|
        thread_id = post_node.at_xpath('xmlns:thread', ns)['dsq:id']
        comments_by_thread[thread_id] ||= []
        
        # Don't need to worry about the deleted posts or spam, I've excluded those from the export.
        comments_by_thread[thread_id] << {
          'author' => post_node.at_xpath('xmlns:author/xmlns:name', ns).content,
          'date' => Time.parse(post_node.at_xpath('xmlns:createdAt', ns).content),
          'message' => post_node.at_xpath('xmlns:message', ns).content.strip
        }
      end

      comments_by_thread.each_value { |comments| comments.sort_by! { |c| c['date'] } }

      # Map thread IDs to post URL paths for more robust matching
      threads_by_path = {}
      doc.xpath('//xmlns:thread', ns).each do |thread_node|
        link_node = thread_node.at_xpath('xmlns:link', ns)
        next unless link_node && !link_node.content.empty?
    
        thread_id = thread_node['dsq:id']
        # Normalize the link to only use its path component
        threads_by_path[normalize_path(link_node.content)] = thread_id
      end

      puts "  -> Loaded #{threads_by_path.keys.size} threads from XML. Matching by URL path..."

      # Find the corresponding post for each thread and attach the comments
      site.posts.docs.each do |post|
        # post.url is already the path, so we just need to normalize it
        post_path = normalize_path(post.url)
    
        thread_id = threads_by_path[post_path]
    
        if thread_id && comments_by_thread[thread_id]
          post.data['comments'] = comments_by_thread[thread_id]
          puts "  -> Found #{comments_by_thread[thread_id].size} comments for #{post.url}"
        end
      end
    end

    private

    # Helper method to normalize URLs to just their path component (e.g., "/blog/my-post/")
    def normalize_path(url)
      # Use URI.parse to handle full URLs and relative paths gracefully
      path = URI.parse(url).path
      # Ensure path starts with a slash
      path = "/#{path}" unless path.start_with?('/')
      # Remove trailing slash for consistency
      path.chomp('/')
    end
  end
end
