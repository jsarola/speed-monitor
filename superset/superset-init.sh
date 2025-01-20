#!/bin/bash

# create Admin user, you can read these values from env or anywhere else possible
superset fab create-admin --username "$ADMIN_USERNAME" --firstname Superset --lastname Admin --email "$ADMIN_EMAIL" --password "$ADMIN_PASSWORD"

# Upgrading Superset metastore
superset db upgrade

# setup roles and permissions
superset superset init 

# create uri to connect
superset set-database-uri -d speed_test -u "$DB_STRING"

# create import dashboard
superset superset import-dashboards -u admin -p /app/dashboard.json

# Starting server
/bin/sh -c /usr/bin/run-server.sh

