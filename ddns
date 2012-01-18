#!/usr/bin/env ruby       

require 'eventmachine'   
require 'net/http'   
require 'optparse'   
 
options = {:server => 'localhost', :port => '80', :name => 'TEST_' + (0...8).map{65.+(rand(25)).chr}.join, :interval => 30}
OptionParser.new do |opts|
  opts.banner = "Usage: ddns [-s server] [-p port] [-n name] [-i interval]"
  opts.on("-s SERVER", "--server SERVER", "Hostname of server running ddns-server") { |v| options[:server]    = v }
  opts.on("-p PORT", "--port PORT", "Port of server running ddns-server")           { |v| options[:port]      = v }
  opts.on("-n NAME", "--name NAME", "Unique identifier for current machine")        { |v| options[:name]      = v }
  opts.on("-i INTERVAL", "--interval INTERVAL", "Update interval in minutes")       { |v| options[:interval]  = v.to_i }
  opts.on( '-h', '--help', 'Display this screen' ) { puts opts }
end.parse!

public_ip = Net::HTTP.get(URI('http://icanhazip.com/'))                                        
Net::HTTP.get(URI("http://#{options[:server]}:#{options[:port]}/set?name=#{options[:name]}&ip=#{public_ip}"))

EventMachine.run {
    timer = EventMachine::PeriodicTimer.new(options[:interval] * 60) do     
    public_ip = Net::HTTP.get(URI('http://icanhazip.com/'))
    Net::HTTP.get(URI("http://#{options[:host]}:#{options[:port]}/set?name=#{options[:name]}&ip=#{public_ip}"))
  end
}                        