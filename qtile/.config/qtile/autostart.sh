#!/usr/bin/bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run picom
run udiskie --automount --smart-tray --notify
run redshift-gtk -l geoclue2
