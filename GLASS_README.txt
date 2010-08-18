GemStone starts automatically when this GLASS Appliance is booted.  Seaside gems
and statmonitor processes that are killed will be restarted automatically by
daemontools. To stop the Seaside gems use:
  sudo /etc/init.d/topaz stop
To stop statmonitor processes use:
  sudo /etc/init.d/statmon stop

The IP Address of this Appliance is printed at boot time and when you login. Use:
  ssh -Y glass@<IP Address>
to login from your system. You may find that environment more usable than logging
in directly to the VMware console.

If you have problems logging in from GemTools, make sure you are using a current
GemTools version, then use this command for assistance:
  gemtools_login_help

To control GemStone running under daemontools, use gemstone_start, gemstone_stop,
and gemstone_status. You can use [sudo] /etc/init.d/topaz, /etc/init.d/gemstone,
/etc/init.d/netldi, and /etc/init.d/statmon followed by start|stop|restart|status
to control individual GemStone components.

Two statmonitor processes are running. One monitors at 1-second intervals, the
other at 60-second intervals. Their output is in stats/1-second and
stats/60-second directories respectively. The convenience command statmon_purge
deletes 1-second stats older than 4 hours and 60-second stats older than 30 days.
You may chose to purge statmon files manually (or never).

The directory GemStone_daemontools_setup contains the scripts that were used to
create this GLASS appliance. You do not need to run them again.  We've left the
scripts in case you want to experiment with creating different GLASS appliance
configurations. Most of those scripts need to be run by root. The glass account
is setup to use sudo. You cannot login as root directly.

Since git is installed on this GLASS Appliance, you can obtain later updates to
these scripts by:
  cd GemStone_daemontools_setup 
  git stash         # To preserve any local changes you've made
  git pull
  git pop           # To restore any local changes you've made

You may want to first see what changes you'll be pulling at:
  http://github.com/Monty/GemStone_daemontools_setup

-- The GLASS team
