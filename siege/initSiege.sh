#!/bin/bash

if ! [ -x "$(command -v siege)" ]; then
	echo "Selenium is not installed."
	read -p "Do you wish to install Siege? (y/n)" yn
	case $yn in
		[Yy]* ) wget http://download.joedog.org/siege/siege-latest.tar.gz;
		        sudo tar -zxvf siege-4.0.4;
				cd siege-4.0.4;
                ./configure;
                make;
                sudo make install;
                siege --version;;            	        
		[Nn]* ) exit;;
		* ) echo "Please answer y/n.";;
	esac
fi