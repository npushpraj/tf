#!/bin/bash
cat >/etc/yum.repos.d/mongodb-org-3.0.repo <<EOL
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOL
/usr/bin/yum install -y mongodb-org
/sbin/service mongod start
/sbin/chkconfig mongod on
