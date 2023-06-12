#!/bin/sh -e

#################################
## Script rewriten by Dr Small ##
#################################
# ref https://ubuntuforums.org/showthread.php?t=869080

PGVER='14'
BINPATH="/usr/lib/postgresql/$PGVER/bin/"
# PGUSER='postgres'
PGLOG='/tmp/pgsql.log'
# make sure this folder exist and postgres have read/write permission
# see [1]
PGDIR='/usr/local/pgsql/data'

start() {
  cd $BINPATH
  ./pg_ctl -D $PGDIR -l $PGLOG start
  #su $PGUSER -c "./pg_ctl -D $PGDIR -l $PGLOG start" #run from user diff postgres
}

stop() {
  cd $BINPATH
  ./pg_ctl -D $PGDIR -l $PGLOG stop
  #su $PGUSER -c "./pg_ctl -D $PGDIR -l $PGLOG stop" #run from user diff postgres
}

case "$1" in
start)
  start
  ;;
stop)
  stop
  ;;
restart)
  stop
  start
  ;;
*)
  echo "Usage: $0 {start|stop|restart}"
  exit 1
  ;;
esac

exit 0

# [1]
# sudo mkdir -p /usr/local/pgsql/data
# sudo chown -R postgres:postgres /usr/local/pgsql/
