#!/usr/bin/env bash

# enable remote access: http://www.cyberciti.biz/tips/postgres-allow-remote-access-tcp-connection.html
# backing up db: https://www.digitalocean.com/community/tutorials/how-to-backup-postgresql-databases-on-an-ubuntu-vps

pg_dump -h joe.azandria.com -U rincewind -p 5432 --no-owner --no-privileges blaugh > production_backup.dbdump

dropdb azandria_blaugh_latest --if-exists
createdb azandria_blaugh_latest

psql azandria_blaugh_latest < production_backup.dbdump

createdb -T azandria_blaugh_latest azandria_blaugh_development

rm production_backup.dbdump
