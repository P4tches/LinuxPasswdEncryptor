#!/bin/bash
read gPWD
rm password.csv
while read i; do
PWD=$(echo $i | openssl enc -d -aes-256-cbc -a -salt -pass pass:$gPWD)
usr=$(echo $PWD | cut -d ' ' -f 1)
pass=$(echo $PWD | cut -d ' ' -f 5)
echo $pass
#echo 'ssh,$($PWD | cut -d ' ' -f }1),$($PWD | cut -d ' ' -f 5)'
echo 'ssh,'$usr','$pass >> password.csv
done < password.txt
