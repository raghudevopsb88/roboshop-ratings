#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

export MYSQL_HOST="${MYSQL_HOST:-mysql}"
export MYSQL_USER="${MYSQL_USER:-ratings}"
export MYSQL_PASSWORD="${MYSQL_PASSWORD:-RoboShop@1}"
export MYSQL_DATABASE="${MYSQL_DATABASE:-ratings}"
export PORT="${PORT:-8080}"

exec gunicorn -b "0.0.0.0:${PORT}" -w 2 app:app
