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

# set the absolute path of the folder we're in 
tpwD=$(pwd)
scriptDir=$tpwD/scripts
jDialog=$tpwD/resources/bin/kdialog
jGksudo=$tpwD/resources/bin/gksudo

text1=$(cat $tpwD/resources/message-update-before-continue)
$jDialog --title "Before we proceed..." --continue-label "We're good. Let's go!" \
	--cancel-label "Stop right there! I need to update!"  \
	--warningcontinuecancel "$text1" ;

if [ "$?" = 0 ]; then
	$jDialog --sorry "All good, proceeding...";
else
	exit 1
fi

$jDialog --sorry "done";
