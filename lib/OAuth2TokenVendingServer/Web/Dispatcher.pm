package OAuth2TokenVendingServer::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use OAuth::Lite2::Client::WebServer;
use Time::HiRes qw/gettimeofday/;
use OAuth2TokenVendingServer;

my $config = OAuth2TokenVendingServer->load_config;

my $scope        = join ',', @{$config->{scope}},
my $app_name     = $config->{app_name};
my $description  = $config->{description};
my $redirect_uri = $config->{redirect_uri};

my $client = OAuth::Lite2::Client::WebServer->new(
    id               => $config->{client_id},
    secret           => $config->{client_secret},
    authorize_uri    => $config->{authorize_uri},
    access_token_uri => $config->{access_token_uri},
);

get '/' => sub {
    my ($c) = @_;

    return $c->render('index.tx', {
        app_name    => $app_name,
        description => $description,
    });
};

get '/auth' => sub {
    my ($c) = @_;

    $c->redirect($client->uri_to_redirect(
        scope        => $scope,
        state        => join('', gettimeofday),
        redirect_uri => $redirect_uri,
    ));
};

get '/token' => sub {
    my ($c) = @_;

    my $code = $c->req->param('code');

    my $access_token = $client->get_access_token(
        code         => $code,
        redirect_uri => '',
    );
    unless ($access_token) {
        return $client->errstr;
    }

    return $c->render('token.tx', {
        app_name     => $app_name,
        access_token => $access_token->access_token,
    });
};

1;

