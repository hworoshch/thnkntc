fibonacci = [0, 1]
number = 1

while number <= 100 do
  fibonacci << number
  number = fibonacci[-2] + fibonacci[-1]
end

puts fibonacci
