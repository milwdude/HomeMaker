#! /bin/bash

#	the following have been (hopefully) exported for use in this script
#
# 	$tpwD 		-base directory of files in HomeMaker
# 	$jDialog		-included kdialog alias
# 	$jGksudo		-included gksudo alias
# 	$thisSys		-the system we're running on ('arch' or 'ubuntu')
# 	$scriptDir		-the directory where HomeMaker's sub-scripts are located
#
#	happy HomeMaking!

mkdir /media/$SUDO_USER/shared-storage

cat $tpwD/resources/fstab-entry >> /etc/fstab

chown $SUDO_USER: /media/$SUDO_USER/shared-storage
