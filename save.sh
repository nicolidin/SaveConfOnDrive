#!/bin/bash

# todo: function to remove dot for dot tar

# todo save gnom conf
function removeDotIfDot() {
		name=$1
		firstChar=${name:0:1}

		if [ "$firstChar" = "." ]
		    then echo ${name:1}
		else
		    echo $name
		fi
}

while read -r line;
		do
		# find $line -type f -name *.tar.gz -exec rm -rf {} \;
		# find $line -type f -name *.tgz -exec rm -rf {} \;
		# find $line -type d -name android -exec rm -rf {} \;
		# find $line -type d -name ios -exec rm -rf {} \;
		# find $line -type d -name target -exec rm -rf {} \;
		# find $line -type d -name node_modules -exec rm -rf {} \;
		# find $line -type d -name build -exec rm -rf {} \;
		tarName=${line##*/};
		tarName=$(removeDotIfDot $tarName)
		echo $tarName;
		tar cvzf "${tarName}.tar.gz" $line;
		done < config_file_folder_files.txt;

gio copy *.tar.gz "$(printenv google_drive_path)/linux-script-save"
gio list -d "$(printenv google_drive_path)/linux-script-save"
