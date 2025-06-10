"""
  Example code shwoing how to ping an NTP server
  and get the date-time
"""

include("functions.jl")

dt_ntporg = getNTPtime("pool.ntp.org")
dt_ubuntu = getNTPtime("ntp.ubuntu.com")
dt_me     = now(UTC)

# get the offset between my pc and ubuntu.com
println("δt = $(dt_ubuntu - dt_me)")
