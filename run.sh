#!/bin/bash
# brew install hudochenkov/sshpass/sshpass
# ./run.sh 60111111111 sample.log
# ./run.sh 192.168.1.1 root p@ssw0rd 60111111111 sample.log

if [ $# -eq 2 ]; then
	# Do something for exactly 2 arguments
  	phoneNo=$1 	# "keyword to search"
  	filePath=$2	# "path to file"

  	output=$(grep "$phoneNo.*SMSTAC" $filePath | tail -1 | grep -o -E "[0-9]{6}\.")
  	
	if [ ! -z $output ]; then
  		echo "true, $output"
	else
		echo "false, not found"
	fi
	exit
elif [ $# -ne 5 ]; then
	# Print an error message for any other number of arguments
  	echo "Error: Illegal parameters. Expected arguments:"
	echo "|-[2] 'phoneNo' 'filePath'"
	echo "|-[5] 'host' 'user' 'password' 'phoneNo' 'fileName'"
    exit
fi

# Do something for exactly 5 arguments
host=$1 	# "hostname"
user=$2 	# "server user"
password=$3 # "server password"
phoneNo=$4 	# "text to extract"
fileName=$5	# "path to file"

remoteLogsPath="/home/ec2-user/sample-logs" # change to relevant logs folder

sshpass -p $password ssh $user@$host << EOF
	cd $remoteLogsPath
	output=\$(grep "$phoneNo.*SMSTAC" $fileName | tail -1 | grep -o -E "[0-9]{6}\.")
	if [ ! -z "\$output" ]
	then
		echo "true, \$output"
	else
		echo "false, not found"
	fi
EOF

echo '...'
