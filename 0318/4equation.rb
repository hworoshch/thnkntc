puts "Введите коэффициент a:"
a = gets.to_f
puts "Введите коэффициент b:"
b = gets.to_f
puts "Введите коээфициент c:"
c = gets.to_f

d = (b**2) - (4 * a * c)

if d == 0
  x = -b / (2.0 * a)
  puts "D = #{d}; корень = #{x}"
elsif d > 0
  sqrtd = Math.sqrt(d)
  x1 = (-b + sqrtd) / (2.0 * a)
  x2 = (-b - sqrtd) / (2.0 * a)
  puts "D = #{d}; x1 = #{x1}; x2 = #{x2}"
else
  puts "D = #{d}; корней нет"
end
