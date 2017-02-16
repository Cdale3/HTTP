
# require 'minitest/capybara'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'faraday'

require './lib/iteration_zero'

class IterationZeroTest < Minitest::Test

	def test_it_exists
		IterationZero.new.is_a? IterationZero
	end

	def test_will_respond_to_an_http_request
 		%x( pwd )
		server = IterationZero.new
		server.listen_and_respond(9292)
		Faraday.get("http://127.0.0.1:9292/")

		assert_equal Faraday.get("http://127.0.0.1:9292/"), "0"
	 end

end














# require 'socket'
# require 'pry'
#
# #Starts server instance listening to port 9292
# counter = 0
#
# tcp_server = TCPServer.new(9292)
#  client = tcp_server.accept
#   counter += 1
#
#   #Snippet to keep reading stream until input is a blank line. Stores all requests in "request_lines" array
#   puts "Ready for a request"
#   request_lines = []
#
#    line = client.gets and !line.chomp.empty?
#     request_lines << line.chomp
#
#
#   #prints below to sceen for debugging
#   puts "Got this request:"
#   puts request_lines.inspect
#   #Response to requests.
#   puts "Sending response."
#   response = "<pre>" + request_lines.join("\n") + "</pre>"
#   verb = request_lines[0].split[0]
#   path = request_lines[0].split[1]
#   protocol = request_lines[0].split[2]
#   host = request_lines[1].split(":")[1].lstrip
#   port = request_lines[1].split(":")[2]
#   origin = host
#   accept = request_lines[-3].split[1]
#
# #binding.pry
#   diagnostics = <<END_OF_DIAGNOSTICS
# <pre>
#   Verb: #{verb}
#   Path: #{path}
#   Protocol: #{protocol}
#   Host: #{host}
#   Port: #{port}
#   Origin: #{origin}
#   Accept: #{accept}
# </pre>
# END_OF_DIAGNOSTICS
# case path
#   when "/"
#     response = diagnostics
# end
#   output = "<html><head></head><body>Hello Asshole. Counting:#{counter} #{response} #{diagnostics}</body></html>"
#   headers = ["http/1.1 200 ok",
#             "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
#             "server: ruby",
#             "content-type: text/html; charset=iso-8859-1",
#             "content-length: #{output.length}\r\n\r\n"].join("\r\n")
#   client.puts headers
#   client.puts output
#
#   #close up server
#   puts ["Wrote this response:", headers, output].join("\n")
# #end
# client.close
# puts "\nResponse complete, exiting."
