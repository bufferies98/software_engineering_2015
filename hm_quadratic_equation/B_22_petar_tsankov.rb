a = ARGV[0].to_f()
b = ARGV[1].to_f()
c = ARGV[2].to_f()
if a==0
	if b!=0
		puts"#{-c/b}"
	end
else
	d=(b*b)-(4*a*c)
	if d==0
		puts "#{(-b/(2*a))}"
		else if d>0.0
			x1=((-b-Math.sqrt(d))/2*a)
			x2=((-b+Math.sqrt(d))/2*a)
			puts "#{x1},#{x2}"
		end
	end
end