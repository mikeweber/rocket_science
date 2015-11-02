require_relative './bodies'

body_name = ARGV.shift

unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

v = ARGV.shift
if v.nil? || v.empty?
  print "Current velocity (m/s): "
  v = gets.chomp
end
v = v.to_f

r = ARGV.shift
if r.nil? || r.empty?
  print "Current altitude (km): "
  r = gets.chomp
end
r = r.to_f * 1000 + radius

zenith = ARGV.shift
if zenith.nil? || zenith.empty?
  print "Current zenith angle (degrees): "
  zenith = gets.chomp
end
zenith = zenith.to_i * Math::PI / 180

ap_pe = ApPe.new(body_name, v, r, zenith)
ap_pe.calculate!

puts "Orbit eccentricity: #{ap_pe.e}"
puts "Ap/Pe: #{ap_pe.ap}/#{ap_pe.pe}"

