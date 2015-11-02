require_relative './lib/bodies'

print "Enter body name:    "
body_name = gets.chomp
unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

radius, gm = body.values_at(:radius, :gm)
print "Current orbit (km): "
init_radius = gets.chomp.to_f * 1000 + radius
print "Desired orbit (km): "
target_radius = gets.chomp.to_f * 1000 + radius

dv1 = (Math.sqrt(gm / init_radius) * (Math.sqrt(2 * target_radius / (init_radius + target_radius)) - 1)).abs
dv2 = (Math.sqrt(gm / target_radius) * (1 - Math.sqrt(2 * init_radius / (init_radius + target_radius)))).abs

puts "∆v required for first burn:  #{'%.02f' % dv1}"
puts "∆v required for second burn: #{'%.02f' % dv2}"
puts "Total ∆v required:           #{'%.02f' % (dv1 + dv2)}"

