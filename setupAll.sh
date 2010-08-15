#!/bin/bash

if [ $UID -ne 0 ]; then
   echo "You must be root to run this!"
   exit
fi 

# Get params
source config

echo "This script executes all daemontools setup scripts in the proper seauence."
echo "Type \"Y\" to confirm each step prior to execution. Type \"N\" to skip that step."
echo "NOTE: Make sure you have already installed GemStone/S and the the config file"
echo "in this directory contains appropriate settings:"
echo "#-------------------------------------------------------"
cat config
echo "#-------------------------------------------------------"

echo "Shall I continue? (Y/N)"

read cont
case "$cont" in
    y|Y|yes)
    ;;
    *)
    echo "Not continuing"
    exit
    ;;
esac

./copySeasideScripts
#
case "$SEASIDE_VERSION" in
    3.0)
    ./daemontools_setup 3.0
    ;;
    2.8)
    ./daemontools_setup 2.8
    ;;
    *)
    echo "SEASIDE_VERSION in the config file is $SEASIDE_VERSION"
    echo "it must be either 3.0 or 2.8"
    ;;
esac
#
./bootGemstone_setup
#
./lighttpd_setup
#
./daemontools_start
#
./bootGemstone_start

# Success
exit 0
