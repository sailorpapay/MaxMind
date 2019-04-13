#!/bin/bash
sudo add-apt-repository ppa:maxmind/ppa
sudo apt update
sudo apt install git libmaxminddb0 libmaxminddb-dev mmdb-bin geoipupdate unzip geoipupdate libssl-dev libpcre3 libpcre3-dev build-essential libcurl4-openssl-dev zlib1g-dev -y
cd /tmp/
wget https://fex.net/load/221582928971/1317892183
mv 1317892183 /tmp/1317892183.zip
unzip 1317892183.zip


cd /tmp/geo/MaxMind-DB-Reader/
cd ext
phpize
./configure
make
make install

cd /tmp/geo/libmaxminddb
./configure
make
make install
ldconfig

dpkg -i /tmp/geo/geoipupdate_4.0.2_linux_amd64.deb
cp /tmp/geo/GeoLite2-City.mmdb /usr/share/GeoIP/GeoLite2-City.mmdb
echo "extension=maxminddb.so" > /etc/php/7.1/fpm/conf.d/geoip2.ini
service php7.1-fpm restart
