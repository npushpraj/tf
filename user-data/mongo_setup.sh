#!/bin/bash
cat >/etc/yum.repos.d/mongodb-org-3.0.repo <<EOL
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOL
/usr/bin/yum install -y mongodb-org
mkfs.ext4 /dev/xvdh
echo "/dev/xvdh   /mongo-db   ext4    defaults        1   1" >> /etc/fstab
mkdir -p /mongo-db
mount -a
mkdir -p /mongo-db/db
chown -R mongod.mongod /mongo-db/db
sed -i 's/dbPath.*/dbPath:\ \/mongo-db\/db/g' /etc/mongod.conf
/sbin/service mongod start
/sbin/chkconfig mongod on
