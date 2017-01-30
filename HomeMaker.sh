#! /bin/bash

#   this is the main HomeMaker script - it sets up variables, runs tests
#   and provides the execution logic and control of all other scripts
#   it is heavily commented, and encludes code-folding tags for kate

### define some variables
### record the absolute path of the folder we're in
tpwD=$(pwd)
export tpwD

### set the path of the scripts folder based on the path above
scriptDir="$tpwD/scripts"
export scriptDir

### set the path of the included kdialog executable based on the path above
jDialog="$tpwD/bin/kdialog"
export jDialog

### set the path of the included gksudo executable based on the path above
jGksudo="$tpwD/bin/gksudo"
export jGksudo

### set the path of the included yad executable based on the path above
jYad="$tpwD/bin/yad"
export jYad

### make sure we're up to date
### warning text to display
txtWarning1=$(cat $tpwD/text/message-update-before-continue)

### the dialog box to display it
$jDialog --title "Before we proceed..." --continue-label "We're good. Let's go!"\
	--cancel-label "Stop right there! I need to update!"\
	--warningcontinuecancel  "$txtWarning1";

if [ "$?" = 1 ]; then
	$jDialog --sorry "Exiting! Restart HomeMaker after system is updated...";
	exit 1
fi

### are we on arch or ubuntu?
archlinuxsystem="/usr/bin/pacman"
debianlinuxsystem="/usr/bin/dpkg"

if [ -e "$archlinuxsystem" ] ; then
    thisSys="arch"
elif [ -e "$debianlinuxsystem" ] ; then
	thisSys="ubuntu"
else
	$jDialog --title "A Slight Problem"  --error  "We are not running under Arch, nor Ubuntu!"
	exit 1
fi
export thisSys


### is wget installed? if not, make it so
installedWget="/usr/bin/wget"

if [ ! -e "$installedWget" ] ; then
	if [ thisSys="arch" ] ; then
        $jDialog --passivepopup "Installing wget... one moment" 3 &
		$jGksudo pacman -S wget ;
		$jDialog --passivepopup "wget has been installed!" 2 ;
	elif [ thisSys="ubuntu" ] ; then
        $jDialog --passivepopup "Installing wget... one moment" 3 &
		$jGksudo apt install --yes wget ;
		$jDialog --passivepopup "wget has been installed!" 2 ;
	fi
fi

### run $scriptDir/main-menu-selector.sh which generates a tmp file at
### $tpwD/resources/actions-tmp which holds a list of intergers
### the value of which correspond to:
#
#  1   "Setup auto-mount of shared partition in /etc/fstab?"
#  2   "Add audio plugin paths to user's environment?"
#  3   "Add useful aliases to .bashrc?"
#  4   "Setup configuration of kde 4?"
#  5   "Setup configuration of plasma 5?"
#  6   "Setup configuration of kde xfce?"
#  7   "Install gtk themes?"
#  8   "Install icon themes?"
#  9   "Install and configure audio software?"
#  10  "Create homedir simlinks?"
#
#  now we can run a for loop on $tpwD/resources/actions-tmp using the
#  numbers to trigger the actual scripts:
#
#  1   $scriptDir/main-menu-actions/su_edit-etcfstab.sh
#  2   $scriptDir/main-menu-actions/add-envars-to-bashrc.sh
#  3   $scriptDir/main-menu-actions/...
#  4   $scriptDir/main-menu-actions/...
#  5   $scriptDir/main-menu-actions/...
#  6   $scriptDir/main-menu-actions/...
#  7   $scriptDir/main-menu-actions/...
#  8   $scriptDir/main-menu-actions/...
#  9   $scriptDir/main-menu-actions/...
#  10  $scriptDir/main-menu-actions/...

# run the menu selector script
/bin/bash $scriptDir/main-menu-selector.sh

# store the list of selected options in this variable
actionsList=$(cat $tpwD/resources/actions-tmp)

# mount the shared data partition because we're likely going to use it
# $jGksudo /bin/bash $scriptDir/su_mount-shared-data-partition.sh

# iterate through the $actionsList and run the chosen scripts
for i in $actionsList; do
	if [ "$i" = 1 ] ; then
		$jDialog --msgbox "1"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/su_edit-etcfstab.sh
	fi;
	
	if [ "$i" = 2 ] ; then
		$jDialog --msgbox "2"
#		/bin/bash $scriptDir/main-menu-actions/add-envars-to-bashrc.sh
	fi;
	
	if [ "$i" = 3 ] ; then
		$jDialog --msgbox "3"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 4 ] ; then	
		$jDialog --msgbox "4"
#	    $jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 5 ] ; then
		$jDialog --msgbox "5"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 6 ] ; then
		$jDialog --msgbox "6"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX	
	fi;

	if [ "$i" = 7 ] ; then
		$jDialog --msgbox "7"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 8 ] ; then
		$jDialog --msgbox "8"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 9 ] ; then
		$jDialog --msgbox "9"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
	
	if [ "$i" = 10 ] ; then
		$jDialog --msgbox "10"
#		$jGksudo /bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
#		or
#		/bin/bash $scriptDir/main-menu-actions/XXXXXXXXXXXXXX
	fi;
done



# TODO: DONT FORGET TO UNMOUNT THE SHARED STORAGE PARTITION	

### SAVE THIS FOR LAST
# remove the temp file we generated to hold the list of actions to perform
# which was generated by $tpwD/main-menu-selector.sh

rm $tpwD/resources/actions-tmp

