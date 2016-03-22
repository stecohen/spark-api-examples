#!/usr/local/bin/perl

$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;


use strict;
use MIME::Base64;
use REST::Client;
use Data::Dumper;
use JSON;

my $api_key = 'stcohen@cisco.com';
my $api_pass = "xxxxxx";    
my $client = REST::Client->new();

open(my $SPARKB, '<', $ENV{"HOME"} . "/.spark/AUTH_BEARER") or die "Unable to open $!. Make sure you copy paste your spark auth bearer from https://developer.ciscospark.com  \n";
	
my $AUTH_BEARER = do { local $/; <$SPARKB> };

print "Auth Bearer = $AUTH_BEARER" ;

print "Listing all rooms ... \n";
$client->setHost("https://api.ciscospark.com"); 
# $client->addHeader("Authorization", "Basic " . encode_base64("$api_key:$api_pass", "")); 
$client->addHeader("Authorization", "Bearer " . $AUTH_BEARER, ""); 
$client->addHeader("content-type", "application/json"); 

$client->GET("/v1/rooms");

my $response = decode_json ($client->responseContent());

print "Response code:" . $client->responseCode() . "\n";
# print $client->responseContent();
my @items=@{$response->{'items'} };
foreach my $i ( @items ) 
{
	print $i->{"title"} ." ". $i->{"id"} ."\n";
}
