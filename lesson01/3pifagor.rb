triangle = []
puts "Введите 1 сторону треугольника:"
triangle << gets.to_f
puts "Введите 2 сторону треугольника:"
triangle << gets.to_f
puts "Введите 3 сторону треугольника:"
triangle << gets.to_f

cathetus1, cathetus2, hypotenuse = triangle.sort!

right_triangle = cathetus1**2 + cathetus2**2 == hypotenuse**2

if right_triangle && cathetus1 == cathetus2
  puts "Треугольник прямоугольный и равнобедренный"
elsif right_triangle
  puts "Треугольник прямоугольный"
elsif cathetus1 == hypotenuse
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
