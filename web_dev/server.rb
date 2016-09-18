require "socket"

def parse_request(request_line)
	http_method, path_and_params, http = request_line.split(" ")
	path, params = path_and_params.split("?")

	params = (params || "").split("&").each_with_object({}) do |pair, hash| 
		key, value = pair.split("=")
		hash[key] = value 
	end
	[http_method, path, params]
end 

server = TCPServer.new("localhost", 3003)
	
loop do 
	client = server.accept 

	request_line = client.gets 
	next if !request_line || request_line =~ /favicon/ 

	http_method, path, params = parse_request(request_line)
  
  client.puts "HHTP/1.0 200 OK"
  client.puts "ContentType: text/html"
  client.puts 
  client.puts "<html>"
  cilent.puts "<body>"
  client.puts  "<pre>"

	client.puts http_method
	clients.puts path
	clients.puts params 

	client.puts "<h1>Rolls! </h1>"

	client.puts "<h1> counter </h1>"

	number = params["number"].to_i
	client.puts "<p>The current number is #{number}.</p>"
	
	client.puts "<a href='?n#{number+1}'>Add one </a>"
	client.puts "<a href='?n#{number-1}'>Add one </a>"
	
	client.puts "</body>"
	client.puts "</html>"
	client.close 
end 