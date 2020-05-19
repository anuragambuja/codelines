#!/bin/bash -l

#A housekeeping script which can be used for files deletion (eg. implementation of GDPR ) older than specified day.
# $ delete-old-file.sh /path/to/files retention_days

ARCHIVE_DIR=$(echo "$1" | sed 's#/*$##')
OLDER_THAN=$(echo "$2" | tr -d '[:alpha:]')
LOG=./retention.log
DATE=$(date +"%Y-%m-%d %H:%M")

if [ -z "$OLDER_THAN" ]; then
        OLDER_THAN=30
fi

if [ -z "$ARCHIVE_DIR" ]; then
        echo "[$DATE] [ERROR] The first parameter must be the archive directory." >> $LOG
        exit 1
fi

if [ ! -d "$ARCHIVE_DIR" ]; then
        echo "[$DATE] [ERROR] The directory $ARCHIVE_DIR does not exist." >> $LOG
        exit 1
fi

NUM_OF_FILES=$(find "$ARCHIVE_DIR/" -depth -mtime +$OLDER_THAN -type f -print | wc -l)

if [ "$NUM_OF_FILES" -gt 0 ]; then
        echo "[$DATE] [INFO] Files older then $OLDER_THAN days will be deleted." >> $LOG
        echo "[$DATE] [INFO] The following files ($NUM_OF_FILES) will be deleted:" >> $LOG
        find "$ARCHIVE_DIR/" -depth -mtime +$OLDER_THAN -type f -print >> $LOG
        find "$ARCHIVE_DIR/" -depth -mtime +$OLDER_THAN -type f -delete 1>/dev/null 2>/dev/null
        DELETE_SUCCESS=$(find "$ARCHIVE_DIR/" -depth -mtime +$OLDER_THAN -type f -print | wc -l)
        if [ "$DELETE_SUCCESS" -gt 0 ]; then
                echo "[$DATE] [ERROR] All files were not removed older than $OLDER_THAN days in $ARCHIVE_DIR." >> $LOG
                echo "[$DATE] [ERROR] The following files were not removed:" >> $LOG
                find "$ARCHIVE_DIR/" -depth -mtime +$OLDER_THAN -type f -print >> $LOG
                exit 1
        else
                echo "[$DATE] [INFO] All files older then $OLDER_THAN days in $ARCHIVE_DIR have been deleted." >> $LOG
        fi
else
        echo "[$DATE] [INFO] There were no files older than $OLDER_THAN days in $ARCHIVE_DIR"
fi

# run: delete-old-file /path/to/archive  retention_days
