days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Введите день:"
day = gets.to_i
puts "Введите месяц:"
month = gets.to_i
puts "Введите год:"
year = gets.to_i

leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
days_count = day
days_count += 1 if month > 2 && leap_year
days_count += days.first(month - 1).sum

puts days_count
