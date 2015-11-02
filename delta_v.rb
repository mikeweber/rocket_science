print "Enter full mass: "
full_mass = gets.chomp.to_f

print "Enter dry mass:  "
dry_mass = gets.chomp.to_f

print "Enter ISP:       "
isp = gets.chomp.to_f

dv = 9.8 * isp * Math.log(full_mass / dry_mass)
puts "Total ∆v: #{dv}"

