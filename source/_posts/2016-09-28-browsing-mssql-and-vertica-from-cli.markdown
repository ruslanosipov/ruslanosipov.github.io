---
title: "Browsing MSSQL and Vertica from CLI"
date: 2016-09-28 11:51:31 -0700
categories: [CLI]
---

Notes to make sure I don't forget how to do this in the future. First, install
`mssql` and `vcli` tools:

    npm install -g sql-cli
    pip install vcli

Encrypt desired database account passwords:

    mkdir -p ~/.passwd
    echo '$PASSWORD' | gpg --use-agent -e > ~/.passwd/$DB_ACCOUNT.gpg

Set up a set of aliases with the desired level of flexibility in `~/.bashrc` to
avoid typing too much:

    function _sql-helper-command {
      host=$1
      user=$2
      password=$3
      db=$4
      opt_query_file=$5

      if [ -z $opt_query_file ]; then
        mssql -s $host -u $user -p $password -d $db
      else
        mssql -s $host -u $user -p $password -d $db -q "`cat $opt_query_file`"
      fi
    }

    function _vsql-helper-command {
      host=$1
      user=$2
      password=$3

      vcli -h $host -U $user -w $password
    }

    # Usage: `sql` for interactive mode, `sql filename.sql` to execute a file.
    function sql {
      opt_query_file=$1

      host='$SOME_HOST'
      user='$SOME_USER'
      password=`gpg --use-agent --quiet --batch -d ~/.passwd/$SOME_FILENAME.gpg`
      db='$SOME_DB'

      _sql-helper-command $host $user $password $db $opt_query_file
    }

    # Usage: `vsql $VERTICA_HOST`
    function vsql {
      host=$1
      user=`whoami`
      password=`gpg --use-agent --quiet --batch -d ~/.passwd/$SOME_FILENAME.gpg`

      _vsql-helper-command $host $user $password
    }

Replace `$SOME_USER`, `$SOME_HOST`, `$SOME_DB`, `$SOME_FILENAME` above with
specific user, host, DB, and filenames respectively. I usually make a bunch of
aliases for different environments/machines I use: `sql-prod`, `sql-dev`,
`sql-local` or `vsql-host1`, `vsql-host2`.
