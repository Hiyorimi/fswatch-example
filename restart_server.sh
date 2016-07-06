#!/usr/bin/env bash

server_file="file.ext"
start_node_cmd="nohup interpreter $server_file > server.out &"  # shellcheck disable=2034
echo "$start_server_cmd"  # shellcheck disable=2154
 
echo 'There is a change in file, restarting node'
pgrep "[i]nterpreter $server_file$" | awk '
{
    if($1!="") {
        print $1;
        system("kill " $1)
    }
}'

echo "starting server"
eval "$start_server_cmd"
