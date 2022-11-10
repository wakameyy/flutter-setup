#!/bin/sh



echo 'Please execute "sudo softwareupdate --install-rosetta --agree-to-license" .'

# install folfer.
INSTALL_DIR="${HOME}/work"

# create install folder.
if [ ! -e ${INSTALL_DIR} ]; then
  mkdir ${INSTALL_DIR}
fi

if [ ! -e ${INSTALL_DIR}/flutter ]; then
	# unzip.
	cd ${INSTALL_DIR}
	unzip $2
else
	echo "\n* flutter is already installed."
fi

# add PATH
if [ $1 = 1 ]; then
	PATH_TEXT='export PATH=${PATH}:'${INSTALL_DIR}'/flutter/bin'

	if [ ! -e "~/.bash_profile" ]; then
		echo "\nadd PATH to '.bash_profile'.\n"
		echo "${PATH_TEXT}" >> ~/.bash_profile
		source ~/.bash_profile
	fi

	if [ ! -e "~/.zshrc" ]; then
		echo "\nadd PATH to '.zshrc'."
		echo ${PATH_TEXT} >> ~/.zshrc
		source ~/.zshrc
	fi
else
	echo "\n* skip add PATH.\n"
fi

# flutter doctor
flutter doctor
