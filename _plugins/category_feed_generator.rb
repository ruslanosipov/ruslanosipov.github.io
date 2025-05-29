module Jekyll
  class CategoryFeedPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = "#{Jekyll::Utils.slugify(category)}.xml"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_feed.xml')
      self.data['category'] = category
    end
  end

  class CategoryFeedGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_feed'
        dir = site.config['category_path'] || 'blog/categories'
        site.categories.each_key do |category|
          site.pages << CategoryFeedPage.new(site, site.source, dir, category)
        end
      end
    end
  end
end
