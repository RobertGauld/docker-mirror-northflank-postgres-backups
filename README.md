# mirror-northflank-postgres-backups

A simple script to maintain a mirror copy of postgres backups held in northflank.
If a backup is deleted from heroku it will be deleted from the mirror.

## To use

1. Mount the following files/folders/volumes:
  * /media/destination - a directory to mirror the backups in, anything not in heroku will be deleted!
2. Set the following environment variables:
  * NORTHFLANK_AUTH_TOKEN - an authorisation token from northflank to allow you to access your details, it requires the following permissions:
    * Projects: Read
    * Addons: Read
3. Optionally also set the following environment variables:
  * LOG_LEVEL - how much logging, default 2 (Info)
  * THREADS - how many threads to use for downloading and gathering data, default 4
  * EXCLUDE_PROJECTS - a comma seperated list of project IDs to exclude

## Destination

The folder used as the destination will end up being populated similarly to:

```
destination
├── project-name
│   ├── addon-name_BACKUP-DATE_BACKUP-TIME.dump
│   ├── addon-name_BACKUP-DATE2_BACKUP-TIME2.dump
│   └── addon2-name_BACKUP-DATE_BACKUP-TIME.dump
└── project-name
    └── addon-name_BACKUP-DATE_BACKUP-TIME.dump
```
