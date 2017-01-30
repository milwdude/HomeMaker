#! /bin/bash

if [ ! -d "/media/joseph/shared-storage" ] ; then
	mkdir /media/joseph/shared-storage
fi

mount UUID=b76ef13d-b1dc-44be-a0fc-c7b58e917b96 /media/joseph/shared-storage
