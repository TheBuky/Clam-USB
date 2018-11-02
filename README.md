<h1 align="center">
  <br>
  <a href="https://github.com/TheBuky/Clam-USB"><img src="https://www.clamav.net/assets/clamav-trademark.png" alt="Clam-USB" width="300"></a>
  <br>
  Clam-USB
  <br>
</h1>


## Objectifs

A simple implementation of [ClamAV](https://www.clamav.net/) for Rasberry to remove malware from USB.
The solution is based on the [ClamAV](https://www.clamav.net/) process to analyse files and just offer the configuration to automaticcly scan plugged devices.
In this tutorial, we'll consider you use a Rasberry. The tutorial will be similar on all debian based distributions and will need to be adapted for other distributions.

## ClamAV installation

At the beginning, you need to install ClamAV:
```
sudo apt install clamav
```

You can't refresh ClamAV database when when the process this running.
So you can run the script provided: `update-clamav.sh`
The script stop the clamav process, refresh the database and restart the clamav process.

To ensure better detection, I advise you to add a cron job to automatically update the ClamAV database.
```
sudo crontab -e
```
And add the job to the recurrence that suits you. I arbitrarily chose to put it "At 02:00 on Sunday":
```
# m h  dom mon dow   command
0 2 * * 0 /path_to_my_script/update-clamav.sh
```

## Udev configuration

Now you need to add a rule in udev events when partition is mounted. 
Add the lines given in `99-scan-plugged-usb.rules` to:
```
sudo vim /etc/udev/rules.d/99-scan-plugged-usb.rules
```

When an event of devices match in udev, the script specifed in `/path_to_your_script/scan-usb.sh` will be launched.
Finally, add the script `scan-usb.sh` at the previously specified location.

## Log files

You can find log files for each analysis in `/var/log/clamav/`.