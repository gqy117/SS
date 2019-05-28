## Install gcc & git#
sudo apt-get update
sudo apt-get -y install build-essential git gcc g++ make

## Download nginx
wget "http://nginx.org/download/nginx-1.7.8.tar.gz"

## Download pcre
wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz"

## Download openssl
wget "https://www.openssl.org/source/openssl-1.0.1j.tar.gz"

## Download zlib
wget "http://zlib.net/zlib-1.2.8.tar.gz"

## Download the latest verison
git clone https://github.com/cuber/ngx_http_google_filter_module

## Download substitutions 
git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module


## Unzip#
tar xzvf nginx-1.7.8.tar.gz
tar xzvf pcre-8.38.tar.gz
tar xzvf openssl-1.0.1j.tar.gz
tar xzvf zlib-1.2.8.tar.gz

## Entering nginx Directory#
cd nginx-1.7.8

## Configure compilation#
sudo ./configure \
  --prefix=/opt/nginx-1.7.8 \
  --with-pcre=../pcre-8.38 \
  --with-openssl=../openssl-1.0.1j \
  --with-zlib=../zlib-1.2.8 \
  --with-http_ssl_module \
  --add-module=../ngx_http_google_filter_module \
  --add-module=../ngx_http_substitutions_filter_module

## Compile and Install
make
sudo make install

# Start
sudo /opt/nginx-1.7.8/sbin/nginx

# Download nginx.conf from Github
sudo wget -q https://raw.githubusercontent.com/gqy117/SS/master/GoogleReverseProxy/nginx.conf -O /opt/nginx-1.7.8/conf/nginx.conf

# Reload
sudo /opt/nginx-1.7.8/sbin/nginx -s reload
