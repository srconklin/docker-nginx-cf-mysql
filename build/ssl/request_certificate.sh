#!/bin/bash

#
# certonly
#  This certbot subcommand tells certbot to obtain the certificate but not not
# install it. We don't need to install it because we will be linking directly to the
# generated certificate files from within our subsequent nginx configuration.
#
# -d
# WHAT: Defines one of the domains to be used in the certificate. We can have up to 100
# domains in a single certificate.
#
# --staging
# For staging, we're not specifying an email address
#
# --authenticator webroot
# WHAT: We are going to use the webroot plug-in for the LetsEncrypt authentication
# challenge. This means that we're going to satisfy the ownership requirement by placing
# files in a public folder on our web-server.
#
# --webroot-path 
# WHAT: This is the folder that we're going to use as the web-root in our "webroot"
# plug-in authentication challenge. Notice that we are mapping this folder to the
# "/tmp/letsencrypt/www" folder on the host machine (which will subsequently be included
# in our nginx configuration).
#
# --agree-tos
# We agree to terms of service
#
#--register-unsafely-without-email
# For staging, we're not specifying an email address
#
# --renew-by-default
# WHAT: Re-issue the certificate even if it already exists and is not expiring.
#
# --server https://acme-v01.api.letsencrypt.org/directory
# WHAT: ??? The resource that provides the actual certificate ???
#
# map 4 volumes 
# 1) The Let's Encrypt Folder where the certificates will be saved
# 2) Lib folder
# 3) Map our html and other pages in our site folder to the data folder that let's encrypt will use for challenges.
# 4)  Map a logging path for possible troubleshooting if needed

sudo docker run -it --rm \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v /docker-nginx-cf-mysql/build/ssl/www:/data/letsencrypt \
-v "/docker-volumes/var/log/letsencrypt:/var/log/letsencrypt" \
certbot/certbot certonly --webroot --register-unsafely-without-email --agree-tos --webroot-path=/data/letsencrypt --staging -d drierite-sandbox.cf -d www.drierite-sandbox.cf 


## production
sudo docker run -it --rm \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v /docker-nginx-cf-mysql/build/ssl/www:/data/letsencrypt \
-v "/docker-volumes/var/log/letsencrypt:/var/log/letsencrypt" \
certbot/certbot certonly --webroot --email sconklin@dynaprice.com --agree-tos --no-eff-email --webroot-path=/data/letsencrypt -d drierite-sandbox.cf -d www.drierite-sandbox.cf

# list certificates 
sudo docker run --rm -it --name certbot \
-v /docker-volumes/etc/letsencrypt:/etc/letsencrypt \
-v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v //docker-nginx-cf-mysql/build/ssl/www:/data/letsencrypt \
certbot/certbot --staging certificates