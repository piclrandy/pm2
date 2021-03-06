#!/usr/bin/env bash

SRC=$(cd $(dirname "$0"); pwd)
source "${SRC}/include.sh"
cd $file_path

echo -e "\033[1mRunning tests for json files :\033[0m"

$pm2 start all.json
should 'should start processes' 'online' 8

$pm2 stop all.json
should 'should stop processes' 'stopped' 8

$pm2 delete all.json
should 'should start processes' 'online' 0

$pm2 start all.json
should 'should start processes' 'online' 8

$pm2 restart all.json
should 'should stop processes' 'online' 8
should 'should all script been restarted one time' 'restart_time: 1' 8
