puts "Как вас зовут?"
name = gets.chomp
puts "Каков ваш рост?"
height = gets.to_i
weigth = height - 110
if weigth < 0
  puts "#{name}, ваш вес уже оптимальный"
else
  puts "#{name}, ваш оптимальный вес равен #{weigth}"
end
