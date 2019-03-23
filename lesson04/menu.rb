def hr
  puts "\n"
end

def show_menu_footer
  puts "9> Назад"
  hr
end

def show_main_menu
  spacer
  puts "ГЛАВНОЕ МЕНЮ"
  hr
  puts "Введите номер: "
  puts "1> Станции"
  puts "2> Маршруты"
  puts "3> Поезда"
  puts "9> Выход"
  hr
end

def show_stations_menu
  spacer
  puts "СТАНЦИИ"
  hr
  puts "Введите номер: "
  puts "1> Создать станцию"
  puts "2> Список станций"
  puts "3> Список поездов на станции"
  show_menu_footer
end

def show_routes_menu
  spacer
  puts "МАРШРУТЫ"
  hr
  puts "Введите номер: "
  puts "1> Создать маршрут"
  puts "2> Изменить маршрут"
  puts "3> Назначить маршрут поезду"
  show_menu_footer
end

def show_trains_menu
  spacer
  puts "ПОЕЗДА"
  hr
  puts "Введите номер: "
  puts "1> Создать поезд"
  puts "2> Изменить поезд"
  puts "3> Управлять поездом"
  show_menu_footer
end

