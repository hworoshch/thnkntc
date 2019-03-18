triangle = Array.new
puts "Введите 1 сторону треугольника:"
triangle1 = gets.to_i
puts "Введите 2 сторону треугольника:"
triangle2 = gets.to_i
puts "Введите 3 сторону треугольника:"
triangle3 = gets.to_i

result = ""

if triangle1 == triangle2 || triangle2 == triangle3 || triangle1 == triangle3
  result = "Треугольник является равнобедренным"
  if triangle1 == triangle2 && triangle2 == triangle3
    result += " и равносторонним. "
  else
    result += ". "
  end
end

if triangle1 > triangle2
  if triangle1 > triangle3
    c = triangle1
    a = triangle2
    b = triangle3
  else
    c = triangle3
    a = triangle1
    b = triangle2
  end
else
  if triangle2 > triangle3
    c = triangle2
    a = triangle1
    b = triangle3
  else
    c = triangle3
    a = triangle1
    b = triangle2
  end
end

if a**2 + b**2 == c**2
  result += "Треугольник является прямоугольным."
else
  result += "Треугольник не является прямоугольным."
end

puts result
