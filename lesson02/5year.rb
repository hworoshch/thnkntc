days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите день:"
day = gets.chomp.to_i
puts "Введите месяц:"
month = gets.chomp.to_i
puts "Введите год:"
year = gets.chomp.to_i

days_count = day
days.first(month - 1).each { |d| days_count += d }
days_count += 1 if month > 2 && year % 4 == 0 && ( year % 400 == 0 || year % 100 != 0 )

puts days_count
