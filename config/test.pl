use strict;
use warnings;
use utf8;
+{
    app_name    => '__YOUR_APP_NAME__',
    description => '__YOUR_APP_DESCRIPTION__',

    client_id     => '__YOUR_APP_CLIENT_ID__',
    client_secret => '__YOUR_APP_CLIENT_SECRET__',

    authorize_uri    => 'http://example.com/authorize',
    access_token_uri => 'http://example.com/access_token',
    redirect_uri     => 'http://yourapp.com/token',

    scope => [qw/read write/],
};
