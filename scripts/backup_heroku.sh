
echo "Kicking off a backup to https://postgres.heroku.com/databases/azandria-blaugh-database#snapshots."
heroku pg:backups capture --app azandria-blaugh
echo "Done."

echo "Pulling down backup to local machine."
pg_dump -F c -v -h 127.0.0.1 -d azandria_blaugh_development -f ../db/backups/$(date +"%Y%m%d%H%M").dump
echo "Done."
