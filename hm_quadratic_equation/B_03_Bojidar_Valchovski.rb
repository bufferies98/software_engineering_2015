#!/usr/bin/ruby

a = ARGV[0].to_f;
b = ARGV[1].to_f;
c = ARGV[2].to_f;
	

if b == 0
	else
	if a == 0
		cInv = c.to_f - (2*c.to_f)
		l_result = cInv.to_f / b.to_f
		puts l_result.to_s	
	else

		disc = (b ** 2) - (4*a*c)
	
		if disc == 0
			x = -b/2*a
			puts x
		elsif disc > 0
			x1 = (-b + disc)/2*a
			x2 = (-b - disc)/2*a
			if x2 > x1
				puts "#{x1},#{x2}"
			else
				puts "#{x2},#{x1}"
			end 
		else

		end
	end
end
