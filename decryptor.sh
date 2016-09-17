#!/bin/bash
read gPWD
while read i; do
echo $i | openssl enc -d -aes-256-cbc -a -salt -pass pass:$gPWD
done < password.txt
