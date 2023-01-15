#!/usr/bash
for f in * 
do
	if [[ "$f" != 'install.sh' ]]
	then
		ln -s "$PWD/$f"	"/home/$USER/.config/"
	fi
done
