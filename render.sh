#!/bin/bash

clear

git add *.md
git add *.sh
git add *.txt
git commit -m "profiles"
git push origin master

clear

echo -n "PROFILES UPLOADED!"

read -s -n1

clear
