#!/bin/bash
cd "$(dirname "$0")"
echo "Enter a password you would like to encrypt with:"
read gPWD
rm password.txt
for i in $(getent passwd | grep /home/ | cut -d  ':' -f 1); do
PWD=$(cat /dev/urandom | tr -dc 'a-zA-Z1-9' | fold -w 8 | head -n 1)
chpasswd <<<"$i:$PWD"
echo $i"    "$PWD | openssl enc -e -aes-256-cbc -a -salt -pass pass:$gPWD >> password.txt #change to /tmp
done
