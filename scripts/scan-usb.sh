#!/bin/bash

log_file="/var/log/clamav/$(date +%F_%R).log"

echo -e "[*] New devices was connected at $(date)\n" > $log_file

# Debug
#env >> $log_file

# Log USB info
echo "[*] USB Label: ${ID_FS_LABEL}" >> $log_file
echo -e "[*] Mounted point: ${DEVNAME}\n" >> $log_file
echo "[*] Starting analyze..." >> $log_file

# Scan mounted device
#clamscan -i -r ${DEVNAME} >> $log_file         		# Simple analysis and not remove compromised files
clamscan --remove=yes -i -r ${DEVNAME} >> $log_file     # Analysis and remove compromised files

echo -e "\n[*] Analysis completed!" >> $log_file
