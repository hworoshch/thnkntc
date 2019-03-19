cart = {}
total = 0

loop do
  puts "Введите название товара или 'стоп' для завершения ввода:"
  title = gets.chomp
  break if title == 'стоп'
  puts "Введите цену товара:"
  price = gets.chomp.to_f
  puts "Введите количество товара:"
  quantity = gets.chomp.to_f
  cart[title] = { price: price, quantity: quantity }
end

puts cart 

cart.each do |key, item|
  sum = item[:price] * item[:quantity]
  puts item
  puts "#{key}: #{item[:price]} × #{item[:quantity]} = #{sum}"
  total += sum
end

puts "================================================"
puts "ИТОГО: #{total}"
