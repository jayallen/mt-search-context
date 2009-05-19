# SearchContext plugin for Movable Type v4.x #

This plugin allows you to specify a default blog to use in multi-blog searches to provide context in locating and publishing the search results template.

## VERSION ##

1.0 (released Octobed 23rd, 2008)

## REQUIREMENTS ##

This plugin is compatible with Movable Type v4.1 or higher.

## LICENSE ##

This program is distributed under the terms of the GNU General Public License, version 2.

## INSTALLATION ##

Unpack the archive and copy the plugins/SearchContext directory from the archive into your plugins directory so that you have:

    MT_DIR/plugins/SearchContext

## CONFIGURATION ##

To enable the plugin, set the DefaultSearchContextBlog directive in your mt-config.cgi specifying the blog ID to use for the default search context, like so:

    DefaultSearchContextBlog 4

In a multiblog search (i.e. no blog_id parameter with a single value is provided) this blog will be used as the blog in context for the purposes of search results template publishing.

## VERSION HISTORY ##

*   **10/23/2008** - Initial public release of v1.0 

## AUTHOR ##

This plugin was brought to you by [Jay Allen](http://jayallen.org), Principal and Chief Architect of [Endevver Consulting](http://endevver.com).
