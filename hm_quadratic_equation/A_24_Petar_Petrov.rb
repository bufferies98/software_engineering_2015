a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
if a != 0
    discriminant = b**2 - 4*a*c
    if discriminant < 0 || a == 0
    elsif discriminant > 0
        x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
        x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
        if x1 < x2
            puts "#{x1},#{x2}"
        else
            puts "#{x2},#{x1}"
        end
    else
        x1 = -b/(2 * a)
        puts "#{x1}"
    end
end
