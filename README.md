# mirror-heroku-postgres-backups
A simple script to maintain a mirror copy of postgres backups held in heroku.
If a backup is deleted from heroku it will be deleted from the mirror.

## To use:
1. Mount the following files/folders/volumes:
  * /media/destination - a directory to mirror the backups in, anything not in heroku will be deleted!
2. Set the following environment variables:
  * HEROKU_AUTH_TOKEN - an authorisation token from heroku to allow you to access your details.
    get this by running heroku authorizations:create -d 'Postgres Backup Mirror'
    and using the value for the Token key in the returned data
3. Optionally also set the following environment variables:
  * LOG_LEVEL - how much logging, default 2 (Info)
  * THREADS - how many threads to use for downloading and gathering data, default 4

## Destination
The folder used as the destination will end up being populated similarly to:
```
destination
├── app-1
│   ├── database-name_BACKUP-DATE_BACKUP-TIME.dump
│   ├── database-name_BACKUP-DATE2_BACKUP-TIME2.dump
│   └── database2-name_BACKUP-DATE_BACKUP-TIME.dump
└── app-2
    └── database-name_BACKUP-DATE_BACKUP-TIME.dump
```
