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

# get the offset between my pc and ubuntu.com
println("δt = $(dt_ubuntu - dt_me)")

# get the range
vdt           = [dt_nist, dt_ntp, dt_google, dt_ubuntu, dt_win, dt_local]
dtmin, dtmax  = extrema(vdt)
range         = dtmax - dtmin
println("range = $range")


