#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

TARGET_UID=$(stat -c "%u" /var/lib/mysql)
echo '-- Setting mysql user to use uid '$TARGET_UID
usermod -o -u $TARGET_UID mysql || true

TARGET_GID=$(stat -c "%g" /var/lib/mysql)
echo '-- Setting mysql group to use gid '$TARGET_GID
groupmod -o -g $TARGET_GID mysql || true

chown -R mysql:root /var/run/mysqld/

sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sed -i "s/user.*/user = mysql/" /etc/mysql/my.cnf

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /create_mysql_users.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec supervisord -n
