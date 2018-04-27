#!/bin/bash

VERSION=1.0

CWD="$( cd "$( dirname "$0"  )" && pwd  )"
cd $CWD

docker build -t lonord/samba:$VERSION -t lonord/samba:latest .
