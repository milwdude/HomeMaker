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


thinggy=$(cat $tpwD/resources/text/select-text)

yad --center --list --checklist --width=600 --height=500 --no-headers \
	--separator="" --multiple --title="Select Functions" \
	--image="$tpwD/resources/icons/ide-menu.png" --print-column=3 --hide-column=3 \
	--text="$thinggy" --column="do" --column="action" --column="number":NUM \
	TRUE "Setup auto-mount of shared partition in /etc/fstab?" 1 \
	TRUE "Add audio plugin paths to user's environment?" 2 \
	TRUE "Add useful aliases to .bashrc?" 3 \
	TRUE "Setup configuration of kde 4?" 4 \
	TRUE "Setup configuration of plasma 5?" 5 \
	TRUE "Setup configuration of kde xfce?" 6 \
	TRUE "Install gtk themes?" 7 \
	TRUE "Install icon themes?" 8 \
	TRUE "Install and configure audio software?" 9 \
	TRUE "Create homedir simlinks?" 10 \
	> $tpwD/resources/actions-tmp
