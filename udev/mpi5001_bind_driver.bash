#!/bin/bash

# check product
usbid="$(grep MPI5001 /sys/bus/usb/devices/*/product | grep -m 1 -oP 'ces/\K.+(?=/prod)')"  # extract bus number and port number. 

# check manufacturer
usbid2="$(grep QDtech /sys/bus/usb/devices/*/manufacturer | grep -m 1 -oP 'ces/\K.+(?=/manu)')"


if  [[ (-n $usbid) && ($usbid == $usbid2) ]]; then
	usbid=${usbid}:1.0

	echo $usbid

	echo -n "${usbid}" > /sys/bus/usb/drivers/usbfs/unbind
	echo -n "${usbid}" > /sys/bus/usb/drivers/usbhid/bind

fi

