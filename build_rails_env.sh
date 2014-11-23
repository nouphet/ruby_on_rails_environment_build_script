#!/bin/bash

cd /usr/local/src/

# Set time zome
mv /etc/localtime /etc/localtime.orig; ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install basic packages
yum -y install ntp vim wget curl git

# run script
wget --no-check-certificate https://raw.github.com/nouphet/setting_server_env/master/setting_server_env_light.sh
bash setting_server_env_light.sh

# install ruby 2.1.3
wget ftp://core.ring.gr.jp/pub/lang/ruby/2.1/ruby-2.1.3.tar.gz
tar xzf ruby-2.1.3.tar.gz
cd ruby-2.1.3
./configure --with-opt-dir=/usr/local --enable-shared --enable-option-checking
make
make test
make install

# install MySQL Server 5.6
yum remove mysql*
yum install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum install mysql mysql-devel mysql-server mysql-utilities
# アンインストールされたものを入れなおす
yum install cronie cronie-anacron crontabs postfix sysstat etckeeper

# install rails
gem install --no-ri --no-rdoc rails mysql2

ruby -v; rails -v

