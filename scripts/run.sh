#!/bin/bash

service samba start
touch /var/log/samba/log.smbd
touch /var/log/samba/log.nmbd
tail -f /var/log/samba/log.smbd /var/log/samba/log.nmbd
