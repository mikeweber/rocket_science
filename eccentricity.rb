require_relative './bodies'

print "Enter body name:      "
body_name = gets.chomp
unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

radius = body[:radius]

print "Enter apoapsis (km):  "
ap = gets.chomp.to_f * 1000 + radius

print "Enter periapsis (km): "
pe = gets.chomp.to_f * 1000 + radius

e = (ap - pe) / (ap + pe)
puts "Eccentricity: #{e}"

