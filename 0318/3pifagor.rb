triangle = []
puts "Введите 1 сторону треугольника:"
triangle << gets.to_f
puts "Введите 2 сторону треугольника:"
triangle << gets.to_f
puts "Введите 3 сторону треугольника:"
triangle << gets.to_f

cathetus1, cathetus2, hypotenuse = triangle.sort!

right_triangle = cathetus1**2 + cathetus2**2 == hypotenuse**2

if right_triangle
  result = "Треугольник прямоугольный"
  if cathetus1 == cathetus2
    result += " и равнобедренный"
  end
elsif cathetus1 == cathetus2 && cathetus2 == hypotenuse
  result = "Треугольник равнобедренный и равносторонний, но не прямоугольный"
else
  result = "Треугольник не прямоугольный"
end

puts result
  
