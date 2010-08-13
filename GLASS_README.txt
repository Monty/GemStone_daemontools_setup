GemStone starts automatically when this GLASS Appliance is booted.  Seaside gems
and statmonitor processes that are killed will be restarted automatically by
daemontools. To stop the Seaside gems use:
  sudo /etc/init.d/topaz stop
To stop statmonitor processes use:
  sudo /etc/init.d/statmon stop

The IP Address of this Appliance is printed out when you login. You can use:
  ssh -Y glass@<IP Address>
to login from your system. You may find that more usable than logging in directly
to the VMware console.

You can use [sudo] /etc/init.d/topaz, /etc/init.d/gemstone, /etc/init.d/netldi,
and /etc/init.d/statmon followed by start|stop|restart|status to control
GemStone. The script GemStone_daemontools_setup/shutdownGemstone will stop all
GemStone processes.

Two statmonitor processes are running. One monitors at 1-second intervals, the
other at 60-second intervals. Their output is in stats/1-second and
stats/60-second directories respectively. Running 'sudo /etc/init.d/statmon start'
deletes 1-second stats older than 4 hours and 60-second stats older than 30 days.

The directory GemStone_daemontools_setup contains the scripts that were used to
create this GLASS appliance. You do not need to run them again.  We've left the
scripts in case you want to experiment with creating different GLASS appliance
configurations. More recent scripts may be found at:
http://github.com/Monty/GemStone_daemontools_setup

Note: Most of those scripts need to be run by root. The glass account is setup
to use sudo. You cannot login as root directly.

-- The GLASS team
