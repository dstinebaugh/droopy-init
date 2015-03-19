# droopy-init
Allows init control to the python webserver droopy

Enables easy usage of the awesome little python webserver <a href="http://stackp.online.fr/?p=28">droopy</a> and allows it to start on boot.
<h3>Setup</h3>
Edit the file by changing <username> with the desired user account to run droopy as. (note there's 2 places!)<br />
Save the file to /etc/init.d/droopy<br />
Debian systems can then run "sudo update-rc.d droopy defaults" to install it.

<h3>Invocation</h3>
sudo /etc/init.d/droop {start|stop}

<h3>Requirements</h3>
<b>Python</b>  - of course or droopy wont run!<br />
<b>screen</b> - This script will launch a screen session named droopy as the configured user and than launch droopy into that session.
