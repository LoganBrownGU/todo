#!/usr/bin/env bash

config_file="$HOME/.config/todo/config"
todo_file="$HOME/.todo"

get_config () {
	config_name=$1
	grep $config_name $config_file | cut -d "=" -f 2
}

editor="$(get_config "editor")"

if [[ $1 == "edit" ]] ; then 
	eval "$editor $todo_file"
elif [[ $1 == "config" ]] ; then
	eval "$editor $config_file"	
else
	echo -ne "To do list: \n"
	todos=$(cat $todo_file)
	IFS=$'\n'
	for line in $todos ; do 
		echo -e "\t$line"
	done
fi
