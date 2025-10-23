using Sockets, Dates

# convert from COBOL epoch (January 1, 1601) to Unix (January 1, 1970)
const global epoch::UInt32 = 2208988800 # NTP epoch offset


"""
  getNTPtime(server::String="pool.ntp.org", port::Int=123)

   specify server usl (time.nist.gov or whatever) and a port,
   function returns the NTP server time as a DateTime object
"""
function getNTPtime(server::String="pool.ntp.org", port::Int=123)

  packet = zeros(UInt8, 48)
  packet[1] = 0x1B

  socket = UDPSocket()                                # open socket (blocking)
  ipaddress = getaddrinfo(server)                     # get server IP address
  send(socket, ipaddress, port, packet)               # send packet

  data = recv(socket)                                 # put recieved data in vector
  vtime = ntoh.(reinterpret(UInt32, data[41:48]))     # get time data (2 Unit32s)
  s = Int(vtime[1] - epoch)                           # first element is seconds
  μs = round(Int, vtime[2] * 1e6 / typemax(UInt32))   # second is fractional seconds (convert to μs)

  dt = unix2datetime(s) + Microsecond(μs)             # combine.
  return dt                                           # note that dt is type DateTime, which only supports milisecond resolution
end
