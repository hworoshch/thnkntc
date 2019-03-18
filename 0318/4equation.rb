puts "Введите коэффициент a:"
a = gets.to_i
puts "Введите коэффициент b:"
b = gets.to_i
puts "Введите коээфициент c:"
c = gets.to_i

d = (b**2) - (4 * a * c)

if d < 0
  puts "D = #{d}; корней нет"
else
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  if d == 0
    puts "D = #{d}; корень = #{x1}"
  else
    puts "D = #{d}; x1 = #{x1}; x2 = #{x2}"
  end
end

