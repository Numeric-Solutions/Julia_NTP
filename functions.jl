using Sockets
using Dates

# convert from COBOL epoch (January 1, 1601) to Unix (January 1, 1970)
global const epoch::UInt32 = 2208988800 # NTP epoch offset



function getNTPtime(server::String="pool.ntp.org", port::Int=123)

  packet = zeros(UInt8, 48)
  packet[1] = 0x1B

  socket = UDPSocket()                              # open socket
  ipaddress = getaddrinfo(server)                   # get server IP address
  send(socket, ipaddress, port, packet)             # send packet

  data = recv(socket)                               # put recieved data in vector
  vtime = ntoh.(reinterpret(UInt32, data[41:48]))   # get time data (2 Unit32s)
  s  = Int(vtime[1] - epoch)                        # first element is seconds
  μs = round(Int, vtime[2] * 1e6/typemax(UInt32))   # second is fractional seconds (convert to μs)

  dt = unix2datetime(s) + Microsecond(μs)           # combine
  return dt
end


"""
  # list of commonly used NTP servers
  
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
"""