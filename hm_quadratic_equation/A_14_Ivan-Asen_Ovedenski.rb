a = ARGV[0].to_i()
b = ARGV[1].to_i()
c = ARGV[2].to_i()

d = b**2 - 4*a*c
if d<0 
	puts "Does not have answer..."
elsif d == 0 
	x = (-b)/2*a
	print x
else 
	x1 = ((-b) + (Math.sqrt(d)))/(2*a)
	x2 = ((-b) - (Math.sqrt(d)))/(2*a)
	if x1 < x2
		print "#{x1},#{x2}"
	else
		print "#{x2},#{x1}"
	end
end
