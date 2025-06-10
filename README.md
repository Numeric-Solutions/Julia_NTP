# Julia_NTP
Example code shwoing how to ping an NTP server and get the date-time


# Linux: Configure NTP
Configure `custom.conf`

copy to `/etc/systemd/timesyncd.conf.d/custom.conf`



[create directory if needed]

run `sudo systemctl restart systemd-timesyncd`

check computer time: `timedatectl`

check synchronization: `systemd-timesyncd.service - Network Time Synchronization`