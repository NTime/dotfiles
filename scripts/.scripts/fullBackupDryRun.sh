#!/bin/bash

sudo rsync --dry-run -aAXHSv --delete --exclude={"/hard_drive/","/home/luis/Downloads/torrents/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /hard_drive/backup/
