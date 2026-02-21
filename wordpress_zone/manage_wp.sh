#!/bin/bash

BASE_DIR="/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone"
PHP_BIN="$BASE_DIR/php_local/usr/bin/php8.3"
MYSQLD_BIN="$BASE_DIR/mariadb_local/usr/sbin/mysqld"
PHP_INI="$BASE_DIR/php.ini"
MY_CNF="$BASE_DIR/my.cnf"
LIB_PATH="$BASE_DIR/php_local/usr/lib/x86_64-linux-gnu:$BASE_DIR/mariadb_local/usr/lib/x86_64-linux-gnu"

start() {
    echo "Starting MariaDB..."
    LD_LIBRARY_PATH=$LIB_PATH nohup $MYSQLD_BIN --defaults-file=$MY_CNF --user=$USER > "$BASE_DIR/mariadb.log" 2>&1 &
    
    echo "Starting PHP Server on http://localhost:8080 ..."
    LD_LIBRARY_PATH=$LIB_PATH nohup $PHP_BIN -c $PHP_INI -S localhost:8080 -t $BASE_DIR/wordpress > "$BASE_DIR/php.log" 2>&1 &
    
    echo "Starting WordPress Area Agent..."
    nohup python3 -u $BASE_DIR/area_agent_wp.py > "$BASE_DIR/agent.log" 2>&1 &
    
    echo "Starting System Observer Blogger..."
    nohup python3 -u $BASE_DIR/system_observer_blogger.py > "$BASE_DIR/blogger.log" 2>&1 &
    
    echo "WordPress Zone is active."
}

stop() {
    echo "Stopping WordPress Zone..."
    pkill -f "$MYSQLD_BIN"
    pkill -f "$PHP_BIN -c $PHP_INI"
    pkill -f "$BASE_DIR/area_agent_wp.py"
    pkill -f "$BASE_DIR/system_observer_blogger.py"
}

status() {
    ps -ef | grep -E "mysqld|php8.3|area_agent_wp.py|system_observer_blogger.py" | grep -v grep
}

case "$1" in
    start) start ;;
    stop) stop ;;
    status) status ;;
    *) echo "Usage: $0 {start|stop|status}" ;;
esac
