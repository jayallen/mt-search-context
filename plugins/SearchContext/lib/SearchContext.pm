package SearchContext;

use vars qw($logger $orig_method);

sub init_app {
    my $plugin = shift;
    my $app    = shift;
    # get_logger();
    # $logger->trace();

    require MT::App::Search;
    $orig_method = MT::App::Search->can('first_blog_id');
    if ($orig_method) {
        no warnings 'redefine';        
        *MT::App::Search::first_blog_id = \&first_blog_id;
    }
}

sub first_blog_id {
    my $app = shift;
    my $q   = $app->param;
    # get_logger();
    # $logger->trace();

    my $default = $app->config->DefaultSearchContextBlog
        or return $orig_method->($app ,@_);

    my $blog_id;
    # If the IncludeBlogs parameter is specified and the default blog is
    # included in the value, return it as the first blog ID.
    # Otherwise, return the first blog in the list.
    if ( $q->param('IncludeBlogs') ) {
        # $logger->debug('Have IncludeBlogs param: ',
        #     $q->param('IncludeBlogs'));
        my @ids = split ',', $q->param('IncludeBlogs');
	    my $has_default = grep { $_ == $default } @ids;
        # $logger->debug('$has_default: ',$has_default);
	    $blog_id        = $has_default ? $default : $ids[0];
    }
    # If the IncludeBlogs parameter is NOT specified indicating a multiblog
    # search, return the default search context blog.
    else {
    	$blog_id = $default;
    }
    # $logger->debug('Returning as first_blog_id: ', $blog_id);    
    $blog_id;
}

# sub search_post_render {
#     my $plugin = shift;
#     my $app = shift;
#     get_logger();
#     $logger->trace();
# 
# }

# sub init_request {
#     my $plugin = shift;
#     my $app = shift;
#     get_logger();
#     $logger->trace();
#     $logger->debug(l4mtdump($app->{searchparam}));
#     require Data::Dumper;
#     print STDERR Data::Dumper::Dumper($app->{searchparam});
# }


sub get_logger {
    return if $logger;
    require MT::Log::Log4perl;
    import MT::Log::Log4perl qw(l4mtdump);
    $logger = MT::Log::Log4perl->new();
}

1;
