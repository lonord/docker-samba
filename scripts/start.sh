#!/bin/bash

touch /var/log/samba/log.smbd
touch /var/log/samba/log.nmbd
service samba start
tail -f /var/log/samba/log.smbd /var/log/samba/log.nmbd
