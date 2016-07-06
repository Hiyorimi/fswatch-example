server_file="file.ext"
start_node_cmd="nohup interpreter $server_file > server.out &"
echo $start_server_cmd
 
echo 'There is a change in file, restarting node'
ps | grep "[i]nterpreter $server_file$" | awk '
{
    if($1!="") {
        print $1;
        system("kill " $1)
    }
}' 
 
echo "starting server"
eval "$start_server_cmd"
