#!/usr/bin/env bash

if [[ $1 == "edit" ]] ; then 
	editor ~/.todo
else 
	echo -ne "To do list: \n"
	todos=$(cat ~/.todo)
	IFS=$'\n'
	for line in $todos ; do 
		echo -e "\t$line"
	done
fi
