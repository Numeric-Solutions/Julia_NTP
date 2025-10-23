# Julia_NTP
Example code shwoing how to ping an NTP server and get the date-time.  

See `example.jl`.


## Linux: Configure NTP
To sync your Linux computer to an NTP server, configure `custom.conf` and 
copy it to `/etc/systemd/timesyncd.conf.d`.
```bash
sudo mkdir -p /etc/systemd/timesyncd.conf.d
sudo cp custom.conf /etc/systemd/timesyncd.conf.d/
sudo systemctl restart systemd-timesyncd.service
sudo timedatectl set-ntp true
```

To check your computer time: `timedatectl`

To check synchronization status: 
```bash
systemctl status systemd-timesyncd.service
timedatectl timesync-status
```

## List of commonly used NTP servers
```
  time.Windows.com
  us.pool.ntp.org
  time.nist.gov
  ntp.ubuntu.com
  pool.ntp.org
  time.google.com
  ntp.viarouge.net
  ntp1.time.nl
  ntp2.time.nl
  ntppool1.time.nl
  ntppool2.time.nl
  ntp.jst.mfeed.ad.jp
  ntp1.jst.mfeed.ad.jp
  ntp2.jst.mfeed.ad.jp
  ntp3.jst.mfeed.ad.jp
  ntp1.v6.mfeed.ad.jp
  ntp2.v6.mfeed.ad.jp
  ntp3.v6.mfeed.ad.jp
  ntp5.leontp.com
  ntp6.leontp.com
  ntp7.leontp.com
  ntp8.leontp.com
  ntp9.leontp.com
  timekeeper.webwiz.net
  ntp.theitman.uk
  eshail.batc.org.uk
  leontp.ccgs.wa.edu.au
  a.st1.ntp.br
  b.st1.ntp.br
  c.st1.ntp.br
  d.st1.ntp.br
  a.ntp.br
  b.ntp.br
  c.ntp.br
  gps.ntp.br
```