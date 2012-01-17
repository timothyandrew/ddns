#!/usr/bin/env ruby       

require 'eventmachine'   
require 'net/http'   

host     = 'localhost'   
port     = '4567' 
name     = (0...8).map{65.+(rand(25)).chr}.join
interval = 30                                         # Minutes
     
public_ip = Net::HTTP.get(URI('http://icanhazip.com/'))
Net::HTTP.get(URI("http://#{host}:#{port}/set?name=#{name}&ip=#{public_ip}"))

EventMachine.run {
  timer = EventMachine::PeriodicTimer.new(interval * 60) do     
    public_ip = Net::HTTP.get(URI('http://icanhazip.com/'))
    Net::HTTP.get(URI("http://#{host}:#{port}/set?name=#{name}&ip=#{public_ip}"))
  end
}                        