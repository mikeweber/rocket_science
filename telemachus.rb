require 'websocket-eventmachine-client'
require 'json'
require_relative './lib/ap_pe'

EM.run do
  ws = WebSocket::EventMachine::Client.connect(uri: 'ws://10.0.1.13:8085/datalink')

  trap("TERM") { stop }
  trap("INT")  { stop }

  ws.onopen do
    puts "Connected"
    x = { "+" => ["v.altitude", "v.orbitalVelocity", "v.angleToPrograde"], :rate => 1000 }
    body = bodies[:kerbin]
    puts body
    @ap_pe = ApPe.new(body)
    send_message ws, x
  end

  ws.onmessage do |msg, type|
    puts "Received message: #{msg}"
    data = JSON.parse msg
    puts data.inspect
    @ap_pe.v = data['v.orbitalVelocity']
    @ap_pe.r = data['v.altitude']
    @ap_pe.zenith = data['v.angleToPrograde']
    @ap_pe.calculate!
    puts "Orbit eccentricity: #{@ap_pe.e}"
    puts "Ap/Pe: #{@ap_pe.ap}/#{@ap_pe.pe}"
  end

  ws.onclose do
    puts "Disconnected"
  end

  ws.onerror do |err|
    puts err
    stop
  end

  def stop
    puts "Terminating connection..."
    EM.stop
  end

  def send_message(ws, msg)
    puts "sending #{msg.to_json}"
    ws.send msg.to_json
  end
end

