require_relative './lib/bodies'

puts "Enter body name"
body_name = gets.chomp
unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

radius, gm = body.values_at(:radius, :gm)
puts "Enter orbital period in seconds"
period = gets.chomp.to_f
puts "Enter Ap in km (leave blank for circular orbit)"
apoapsis = gets.chomp

semi_major_axis = ((period / Math::Tau) ** 2 * gm) ** (1.0 / 3)
puts "Semi-major axis (in km): #{semi_major_axis * 0.001}"
apoapsis = apoapsis.empty? ? semi_major_axis - radius : apoapsis.to_f * 1000
periapsis = 2 * (semi_major_axis - radius) - apoapsis
puts "Desired periapsis (in km): #{periapsis * 0.001}"

