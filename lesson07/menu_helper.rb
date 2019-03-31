module MenuHelper

  MAIN_MENU_TITLE = "ГЛАВНОЕ МЕНЮ"
  MAIN_MENU = [
    'Станции',
    'Маршруты',
    'Поезда' 
  ]

  STATIONS_MENU_TITLE = "СТАНЦИИ"
  STATIONS_MENU = [
    'Создать станцию',
    'Список станций',
    'Список поездов на станции'
  ]

  ROUTES_MENU_TITLE = "МАРШРУТЫ"
  ROUTES_MENU = [
    'Создать маршрут',
    'Изменить маршрут',
    'Назначить маршрут поезду' 
  ]
  ROUTES_MANAGE_MENU = [
    'Добавить станцию',
    'Удалить станцию'
  ]

  TRAINS_MENU_TITLE = "ПОЕЗДА"
  TRAINS_MENU = [
    'Создать поезд',
    'Изменить поезд',
    'Управлять поездом',
    'Создать вагон',
    'Список вагонов поезда',
    'Загрузить вагон'
  ]
  TRAINS_CREATE_MENU = [
    'Грузовой',
    'Пассажирский'
  ]
  TRAINS_MANAGE_MENU = [
    'Прицепить вагон',
    'Отцепить вагон'
  ]
  TRAINS_DRIVE_MENU = [
    'Вперед по маршруту',
    'Назад по маршруту'
  ]

  def show_menu(menu)
    menu.each.with_index(1) { |item, index| puts "#{index}> #{item}" }
    puts "0> Отмена"
    hr
  end

end
