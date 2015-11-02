print "Mass of rocket: "
init_mass = gets.chomp.to_f
print "ISP:            "
exhaust_velocity = gets.chomp.to_f * 9.8
print "Rocket thrust:  "
thrust = gets.chomp.to_f
print "∆v:             "
dv = gets.chomp.to_f

propellant_mass = 1 - Math::E ** (-dv / exhaust_velocity)
dt = (init_mass * exhaust_velocity) / thrust * propellant_mass
new_mass = init_mass * (1 - propellant_mass)

puts "Burn will take #{dt}s"
puts "The new mass of the rocket will be #{new_mass} (change of #{init_mass - new_mass})"

