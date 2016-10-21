require "socket"
require "ruby_cowsay"
require "fortune_gem"

server = TCPServer.new("0.0.0.0", 80)

loop do
  socket = server.accept
  request = socket.gets
  STDERR.puts request
  response = Cow.new.say FortuneGem.give_fortune({:max_length => 80})
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" + 
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n\r\n"
  socket.print response 
  socket.close
end
