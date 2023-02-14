Bash scripts for extracting the latest SMS Tac Number from log files, filtered by phone number.

## Instruction:
**For Server Logs:**
```
1. Install sshpass - brew install hudochenkov/sshpass/sshpass
2. Configure the `remoteLogsPath` in the script to as per server logs path
3. Execute command with 5 arguments in sequence: ./run.sh 192.168.1.1 root password 60123456789 file-name.log
```

**For Local Logs:**
```
1. Execute command with 2 arguments in sequence: ./run.sh 60123456788 file-path/file-name.log
```
