#!/bin/bash

VERSION=0.1

CWD="$( cd "$( dirname "$0"  )" && pwd  )"
cd $CWD

docker build -t lonord/samba:$VERSION -t lonord/samba:latest .
