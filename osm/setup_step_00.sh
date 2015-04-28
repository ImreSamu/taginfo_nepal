#!/bin/bash

#  Ubuntu 14.01.1

set -e
uname -a
export DEBIAN_FRONTEND=noninteractive
ln -sf /usr/share/zoneinfo/GMT /etc/localtime

apt-get -y update 
apt-get -y upgrade

## Common packages for linux build environment
apt-get install -y pkg-config  git curl bzip2 unzip make nano mc wget sudo 

# Set the locale
sudo locale-gen en_US.UTF-8  
export LANG=en_US.UTF-8  
export LANGUAGE=en_US:en  
export LC_ALL=en_US.UTF-8  

#-------------Application Specific Stuff ----------------------------------------------------
sudo  apt-get -y install sqlite3 libsqlite3-dev ruby-dev ruby curl m4
sudo  apt-get -y install zlib1g-dev libosmpbf-dev libprotobuf-dev libboost-dev libgeos-dev libexpat1-dev libsparsehash-dev libgd2-xpm-dev


#  https://github.com/ai/r18n/issues/122
sudo gem install rack         -v 1.4.5
sudo gem install r18n-core    -v 1.1.11
sudo gem install sinatra-r18n -v 1.1.11
sudo gem install rack-contrib json sqlite3 sinatra

# ---- gem list -----
# json (1.8.2)
# r18n-core (1.1.11)
# rack (1.4.5)
# rack-contrib (1.2.0)
# rack-protection (1.5.3)
# sinatra (1.4.6)
# sinatra-r18n (1.1.11)
# sqlite3 (1.3.10)
# tilt (2.0.1)


# sudo  gem install rack -v 1.4.5
sudo  apt-get -y install libgeos++-dev
 
#--- for  Osmium libs  - http://wiki.openstreetmap.org/wiki/Osmium/Quick_Start 
sudo apt-get -y install libboost-dev zlib1g-dev libshp-dev libgd2-xpm-dev libgdal1-dev libexpat1-dev libgeos++-dev libsparsehash-dev  libv8-dev libicu-dev libprotobuf-dev protobuf-compiler  libosmpbf-dev  make doxygen graphviz

#----  for libosmpbf
sudo apt-get -y install devscripts debhelper libprotobuf-java ant default-jdk maven-repo-helper

#----  for taginfo
sudo apt-get -y install libgeos++-dev  sqlite3 libsqlite3-dev  curl libdbi-perl libdbd-sqlite3-perl  zlib1g-dev libosmpbf-dev libprotobuf-dev libboost-dev libgeos-dev libexpat1-dev libsparsehash-dev libgd2-xpm-dev


# osm history splitter
sudo apt-get -y install zlib1g-dev  libexpat1-dev libxml2-dev   libgeos-dev libgeos++-dev 
sudo apt-get -y install libsparsehash-dev libprotobuf-dev protobuf-compiler libosmpbf-dev 

