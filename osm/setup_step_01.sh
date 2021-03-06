#!/bin/bash

set -e
uname -a

export DEBIAN_FRONTEND=noninteractive
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
update-locale LANG=en_US.UTF-8

sudo mkdir -p /osm
sudo mkdir -p /osm/planet
sudo mkdir -p /osm/planet/var/
sudo mkdir -p /osm/data
sudo mkdir -p /osm/taginfo_build 
sudo mkdir -p /osm/download

chmod 757 -R  /osm/download
sudo apt-get update
sudo apt-get -y install apt-utils build-essential
sudo apt-get -y install git nano mc wget sudo

locale 

sudo apt-get install -y  python-software-properties software-properties-common
sudo apt-get install -y  dialog

sudo apt-get -y install sqlite3 libsqlite3-dev  curl m4
sudo apt-get -y install zlib1g-dev libosmpbf-dev libprotobuf-dev libboost-dev libgeos-dev libexpat1-dev libsparsehash-dev libgd2-xpm-dev

# ------------ install clang 3.5
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -
echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main"     >> /etc/apt/llvm.list
echo "deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main" >> /etc/apt/llvm.list
apt-get update
apt-get -y install clang-3.5 llvm-3.5 python-clang-3.5 
sudo ln -s /usr/bin/clang-3.5   /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.5 /usr/bin/clang++

# Install Osmium  - http://wiki.openstreetmap.org/wiki/Osmium/Quick_Start 
sudo apt-get -y install libboost-dev zlib1g-dev libshp-dev libgd2-xpm-dev libgdal1-dev libexpat1-dev libgeos++-dev libsparsehash-dev  libv8-dev libicu-dev libprotobuf-dev protobuf-compiler  libosmpbf-dev  make doxygen graphviz

#-------------- libosmpbf
sudo apt-get -y install devscripts debhelper libprotobuf-java ant default-jdk maven-repo-helper
sudo mkdir  /osm/libosmpbf
cd /osm/libosmpbf
sudo git clone https://github.com/scrosby/OSM-binary.git
cd OSM-binary
sudo debuild -I -us -uc
cd ..
sudo dpkg --install libosmpbf-dev_*.deb


#-------------- osmium
cd /osm
sudo git clone https://github.com/joto/osmium.git
cd /osm/osmium
sudo make install


# --- taginfo ----
sudo apt-get -y install libgeos++-dev  sqlite3 libsqlite3-dev curl libdbi-perl libdbd-sqlite3-perl  zlib1g-dev libosmpbf-dev libprotobuf-dev libboost-dev libgeos-dev libexpat1-dev libsparsehash-dev libgd2-xpm-dev
 

cd /osm
sudo mkdir -p /osm/taginfo
sudo rm -r taginfo
sudo git clone https://github.com/joto/taginfo.git
cd  /osm/taginfo/

sudo mkdir -p  /osm/taginfo/var
sudo mkdir -p  /osm/taginfo/var/log
chmod  757 -R  /osm/taginfo/var/log/

# ------  tagstats  ----
cd /osm/taginfo/tagstats
sudo make clean
sudo make

#  osm-history-splitter ------------------
cd /osm 
sudo apt-get -y install zlib1g-dev  libexpat1-dev libxml2-dev   libgeos-dev libgeos++-dev 
sudo apt-get -y install libsparsehash-dev libprotobuf-dev protobuf-compiler libosmpbf-dev 
sudo git clone https://github.com/MaZderMind/osm-history-splitter.git
cd osm-history-splitter
sudo make   && sudo make install


# --------  install phusionpassenger
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main' > /etc/apt/sources.list.d/passenger.list 
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get install -y libapache2-mod-passenger
sudo a2enmod passenger
echo "
<VirtualHost *:80>
    # ServerName taginfo.openstreetmap.xx
    DocumentRoot /osm/taginfo/web/public
    <Directory /osm/taginfo/web/public>
        Allow from all
        Options -MultiViews
        # Uncomment this if you're on Apache >= 2.4:
        Require all granted
    </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/taginfo.conf

sudo a2dissite 000-default
sudo a2ensite taginfo

#   background map and logo  - installto public web folder
sudo cp /osm/nepalbg2.png                  /osm/taginfo/web/public/img/mapbg/nepalbg2.png
sudo cp /osm/nepalflag.png                 /osm/taginfo/web/public/img/logo/nepalflag.png
sudo cp /osm/taginfo_nepal.png             /osm/taginfo/web/public/img/logo/taginfo.png
sudo cp /osm/taginfo_nepal_with_bar.png    /osm/taginfo/web/public/img/logo/taginfo_with_bar.png

# --  restart webserver ----
sudo service apache2 restart





