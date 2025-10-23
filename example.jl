"""
  Example code shwoing how to ping an NTP server
  and get the date-time
"""

include("functions.jl")
# get time stamps from a few popular NTP servers
dt_nist   = getNTPtime("time.nist.gov")
dt_ntp    = getNTPtime("pool.ntp.org")
dt_google = getNTPtime("time.google.com")
dt_ubuntu = getNTPtime("ntp.ubuntu.com")
dt_win    = getNTPtime("time.Windows.com")
dt_local  = now(UTC)
