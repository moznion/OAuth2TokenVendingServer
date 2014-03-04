# OAuth2TokenVendingServer

Access token vending server for OAuth2

## Over View

1. Access & Authenticate

    ![https://dl.dropboxusercontent.com/u/14832699/OAuth2TokenVendingServer/top.png](https://dl.dropboxusercontent.com/u/14832699/OAuth2TokenVendingServer/top.png)

2. You've got an access token

    ![https://dl.dropboxusercontent.com/u/14832699/OAuth2TokenVendingServer/token.png](https://dl.dropboxusercontent.com/u/14832699/OAuth2TokenVendingServer/token.png)

## Getting Started

<ol>
<li>carton install</li>

<pre>
$ carton install
</pre>

<li>Edit `config/production.pl`</li>

<pre>
+{
    app_name    => '__YOUR_APP_NAME__',
    description => '__YOUR_APP_DESCRIPTION__',

    client_id     => '__YOUR_APP_CLIENT_ID__',
    client_secret => '__YOUR_APP_CLIENT_SECRET__',

    authorize_uri    => 'http://example.com/authorize',
    access_token_uri => 'http://example.com/access_token',
    redirect_uri     => 'http://URL_TO_THIS_SERVER.com/token',

    scope => [qw/read write/],
};
</pre>

<li>Start server</li>

<pre>
$ carton exec -- plackup script/oauth2tokenvendingserver-server
</pre>
</ol>

## LICENSE

Copyright (C) moznion.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
