print "ISP:       "
isp = gets.chomp.to_f

print "Thrust:    "
thrust = gets.chomp.to_f

print "Burn time: "
time = gets.chomp.to_f

print "Enter initial mass (optional): "
mass0 = gets.chomp.to_f

delta_m = (thrust * time) / (isp * 9.8)

puts "Change of mass:       #{'%.02f' % delta_m}"
unless mass0 == 0
  mass1 = mass0 - delta_m
  puts "New mass:             #{'%.02f' % mass1}"
end

