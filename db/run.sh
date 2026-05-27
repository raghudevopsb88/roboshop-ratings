#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

MYSQL_HOST="${MYSQL_HOST:-mysql}"
MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-RoboShop@1}"

echo "Waiting for MySQL at ${MYSQL_HOST}..."
until mysqladmin ping -h "$MYSQL_HOST" -uroot -p"$MYSQL_ROOT_PASSWORD" --silent; do
    sleep 2
done

echo "Running ratings database setup..."
mysql -h "$MYSQL_HOST" -uroot -p"$MYSQL_ROOT_PASSWORD" < /db/schema.sql
mysql -h "$MYSQL_HOST" -uroot -p"$MYSQL_ROOT_PASSWORD" < /db/app-user.sql
echo "Ratings database setup complete"
