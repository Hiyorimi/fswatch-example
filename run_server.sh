#!/bin/bash
bash restart_server.sh
fswatch -o file.ext | xargs -n1 './restart_server.sh'
