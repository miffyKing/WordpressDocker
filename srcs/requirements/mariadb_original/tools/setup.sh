#!/bin/sh

GREEN='\033[1;32m'
RESET='\033[0m'

if [ ! -d "/var/lib/mysql/$MYSQL_DB" ]; then
  mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal >/dev/null
  mysqld --bootstrap << EOF
use mysql;

flush privileges;

create database $MYSQL_DB;
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DB.* to '$MYSQL_USER'@'%';

alter user '$MYSQL_ROOT'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';

flush privileges;
EOF
fi

cat <<EOM
${GREEN}--------------------
MariaDB configuration has been completed.
Port: 3306
--------------------${RESET}
EOM

exec mysqld --datadir=/var/lib/mysql