require_relative './lib/bodies'

puts "Enter body name"
body_name = gets.chomp
unless body = bodies[body_name.to_sym]
  puts "Unrecognized body name. Should be one of the following: #{bodies.keys.join(", ")}"
  exit
end

puts "Enter orbit Ap in km"
apoapsis = gets.chomp.to_f * 1000
puts "Enter orbit Pe in km (leave blank for circular orbit)"
periapsis = gets.chomp.to_f * 1000
periapsis = apoapsis if periapsis == 0
radius, gm = body.values_at(:radius, :gm)

semi_major_axis = (radius * 2 + apoapsis + periapsis) / 2
puts "Semi-major axis (in km): #{semi_major_axis * 0.001}"
time = (Math::Tau * Math.sqrt(semi_major_axis ** 3 / gm)).to_i
puts "Orbital period in seconds: #{time}"

time_string = "#{(time / 60) % 60}:#{time % 60}"
if time > 3600
  time_string = "#{(time / 3600) % 86_400}:#{time_string}"
  if time > 86_400
    time_string = "#{time / 86_400}:#{time_string}"
  end
end

puts time_string

