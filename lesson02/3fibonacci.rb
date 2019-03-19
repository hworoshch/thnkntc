fibonacci = [0, 1]
number = 1

while number <= 100 do
  number = fibonacci[-2] + fibonacci[-1]  
  fibonacci << number
end

puts fibonacci
