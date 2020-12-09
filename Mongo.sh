#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")

DB_BACKUP_PATH='/backup/mongo'
MONGO_HOST='localhost'
MONGO_PORT='27017'
DB_NAME='admin'
MONGO_USER='root'
MONGO_PASSWD='123456'

sudo mkdir  ${DB_BACKUP_PATH}/${TODAY}

for DB_NAME
        do
        mongodump --host="${MONGO_HOST}" --username="${MONGO_USER}" --password="${MONGO_PASSWD}" --port "${MONGO_PORT}" --db="${DB_NAME}"  --out="${DB_BACKUP_PATH}/${TODAY}/${DB_NAME}.bson"
        done




