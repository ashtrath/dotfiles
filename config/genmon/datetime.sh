#!/usr/bin/env bash

#genmon script for displaying the time
#displays date and time on the tooltip

DATE=$(echo "\uf073 ")
DATE+=`date '+ %d %B %A %H:%M'`
TIME+=`date '+%H\n%M'`

# Panel
INFO="<txt>"
INFO+="${TIME}"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="${DATE}"
MORE_INFO+="</tool>"

# OnClick
CLICK="<txtclick>"
CLICK+="xfce4-datetime-plugin"
CLICK+="</txtclick>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

# OnClick Print
echo -n "${CLICK}"
