module MenuHelper
  MAIN_MENU_TITLE = 'ГЛАВНОЕ МЕНЮ'.freeze
  MAIN_MENU = %w[
    Станции
    Маршруты
    Поезда
  ].freeze
  STATIONS_MENU_TITLE = 'СТАНЦИИ'.freeze
  STATIONS_MENU = [
    'Создать станцию',
    'Список станций',
    'Список поездов на станции'
  ].freeze
  ROUTES_MENU_TITLE = 'МАРШРУТЫ'.freeze
  ROUTES_MENU = [
    'Создать маршрут',
    'Изменить маршрут',
    'Назначить маршрут поезду'
  ].freeze
  ROUTES_MANAGE_MENU = [
    'Добавить станцию',
    'Удалить станцию'
  ].freeze
  TRAINS_MENU_TITLE = 'ПОЕЗДА'.freeze
  TRAINS_MENU = [
    'Создать поезд',
    'Изменить поезд',
    'Управлять поездом',
    'Создать вагон',
    'Список вагонов поезда',
    'Загрузить вагон'
  ].freeze
  TRAINS_CREATE_MENU = %w[
    Грузовой
    Пассажирский
  ].freeze
  TRAINS_MANAGE_MENU = [
    'Прицепить вагон',
    'Отцепить вагон'
  ].freeze
  TRAINS_DRIVE_MENU = [
    'Вперед по маршруту',
    'Назад по маршруту'
  ].freeze

  def show_menu(menu)
    menu.each.with_index(1) { |item, index| puts "#{index}> #{item}" }
    puts '0> Отмена'
    hr
  end
end
