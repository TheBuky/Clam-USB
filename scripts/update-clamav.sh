#!/bin/bash

echo -e "\nStopping ClamAV..."
/etc/init.d/clamav-freshclam stop

echo -e "\nUpdate the database..."
freshclam

echo -e "\nRestarting ClamAV..."
/etc/init.d/clamav-freshclam start