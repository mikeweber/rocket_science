require_relative './bodies'

print "Enter body name:       "
body_name = gets.chomp
unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

radius, gm = body.values_at(:radius, :gm)

print "Enter apoapsis (km):   "
ap = gets.chomp.to_f

print "Enter periapsis (km) (leave blank for circular orbit):  "
pe = gets.chomp.to_f
if ap == 0
  pe = ap
end

if ap == pe
  alt = ap
else
  print "Current altitude (km) (leave blank for circular orbit): "
  alt = gets.chomp.to_f
end
alt = alt * 1000 + radius
pe = pe * 1000 + radius
ap = ap * 1000 + radius

semi_major_axis = (ap + pe) / 2

e = (ap - pe) / (ap + pe)
puts "Eccentricity: #{e}"
puts "Current velocity: #{Math.sqrt(gm * (2 / alt - 1 / semi_major_axis))}"

