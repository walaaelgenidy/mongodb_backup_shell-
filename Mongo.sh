#!/bin/bash
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")
 
DB_BACKUP_PATH='/backup/mongo'
MONGO_HOST='localhost'
MONGO_PORT='27017'

MONGO_USER=''
MONGO_PASSWD=''

## Number of days to keep local backup copy
BACKUP_RETAIN_DAYS=30   
 
mkdir -p ${DB_BACKUP_PATH}/${TODAY}


for DB_NAME in ${DATABASE_NAMES}
	do
		mongodump --host ${MONGO_HOST} --username ${MONGO_USER} --password ${MONGO_PASSWD} --port ${MONGO_PORT} --db ${DB_NAME}  --out ${DB_BACKUP_PATH}/${TODAY}/
	done

######## Remove backups older than {BACKUP_RETAIN_DAYS} days  ########
 
DBDELDATE=$(date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago")
 
if [ ! -z ${DB_BACKUP_PATH} ]; then
      cd ${DB_BACKUP_PATH}
      if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
            rm -rf ${DBDELDATE}
      fi
fi
