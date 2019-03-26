require_relative 'ui_helper'
require_relative 'menu_helper'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'station'
require_relative 'route'

class Main

  include UiHelper
  include MenuHelper

  def run
    loop do
      header(MAIN_MENU_TITLE)
      show_menu(MAIN_MENU)
      case gets.to_i
      when 1 then stations_menu
      when 2 then routes_menu
      when 3 then trains_menu
      when 0 then break
      end
    end
  end

  private

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index}> #{item}"
    end 
  end

  def select_from_collection(collection)
    hr
    index = gets.to_i
    collection[index - 1]
  end

  def stations_menu
    loop do
      header(STATIONS_MENU_TITLE)
      show_menu(STATIONS_MENU)
      case gets.to_i
      when 1 then create_station
      when 2 then show_stations
      when 3 then show_station_trains
      when 0 then break
      end
    end
  end

  def create_station
    header("СОЗДАТЬ СТАНЦИЮ")
    puts "Введите название станции: "
    station_title = gets.chomp
    Station.new(station_title)
  end

  def show_stations
    header("СПИСОК СТАНЦИЙ")
    show_collection(Station.all)
  end

  def show_station_trains
    spacer
    puts "Введите номер станции:"
    show_collection(Station.all)
    station = select_from_collection(Station.all)
    return unless station
    header("ПОЕЗДА НА СТАНЦИИ #{station.title.upcase}:")
    show_collection(station.trains)
  end

  def routes_menu
    loop do
      header(ROUTES_MENU_TITLE)
      show_menu(ROUTES_MENU)
      case gets.to_i
      when 1 then create_route
      when 2 then manage_route
      when 3 then assign_route
      when 0 then break
      end
    end
  end

  def create_route
    header("СОЗДАТЬ МАРШРУТ")
    puts "Введите номер начальной станции:"
    show_collection(Station.all)
    start_station = select_from_collection(Station.all)
    hr
    puts "Введите номер конечной станции:"
    available_stations = Station.all - [start_station]
    show_collection(available_stations)
    end_station = select_from_collection(available_stations)
    return if start_station.nil? || end_station.nil?
    Route.new(start_station, end_station)
  end

  def manage_route
    header("ИЗМЕНИТЬ МАРШРУТ")
    puts "Введите номер маршрута:"
    show_collection(Route.all)
    route = select_from_collection(Route.all)
    spacer
    show_collection(route.stations)
    spacer
    puts "Введите номер:"
    show_menu(ROUTES_MANAGE_MENU)
    case gets.to_i
    when 1 then route_add_station(route)
    when 2 then route_remove_station(route)
    when 0 then return
    end
  end

  def route_add_station(route)
    available_stations = Station.all - route.stations
    spacer
    puts "Введите номер добавляемой станции:"
    show_collection(available_stations)
    station = select_from_collection(available_stations)
    route.add_station(station)
  end

  def route_remove_station(route)
    spacer
    puts "Введите номер удаляемой станции:"
    show_collection(route.stations)
    station = select_from_collection(route.stations)
    route.remove_station(station)
  end

  def assign_route
    header("НАЗНАЧИТЬ МАРШРУТ")
    puts "Введите номер маршрута:"
    show_collection(Route.all)
    route = select_from_collection(Route.all)
    spacer
    puts "Введите номер поезда: "
    show_collection(Train.all)
    train = select_from_collection(Train.all)
    train.set_route(route)
  end

  def trains_menu
    loop do
      header(TRAINS_MENU_TITLE)
      show_menu(TRAINS_MENU)
      case gets.to_i
      when 1 then create_train
      when 2 then manage_train
      when 3 then drive_train
      when 0 then break
      end
    end
  end

  def create_train
    header("СОЗДАТЬ ПОЕЗД")
    puts "Введите номер поезда:"
    train_number = gets.to_i
    spacer
    puts "Введите тип поезда:"
    show_menu(TRAINS_CREATE_MENU)
    case gets.to_i
    when 1 then CargoTrain.new(train_number)
    when 2 then PassengerTrain.new(train_number)
    when 0 then return
    end
  end

  def manage_train
    header("ИЗМЕНИТЬ ПОЕЗД")
    puts "Введите номер поезда:"
    show_collection(Train.all)
    train = select_from_collection(Train.all)
    return unless train
    spacer
    show_collection(train.cars)
    spacer
    puts "Введите номер операции:"
    show_menu(TRAINS_MANAGE_MENU)
    case gets.to_i
    when 1 then train_add_car(train)
    when 2 then train_remove_car(train)
    when 0 then return
    end
  end

  def train_add_car(train)
    case train.type
    when 'cargo' then train.add_car(CargoCar.new)
    when 'passenger' then train.add_car(PassengerCar.new)
    end
  end

  def train_remove_car(train)
    spacer
    puts "Выберите вагон:"
    show_collection(train.cars)
    car = select_from_collection(train.cars)
    train.remove_car(car)
  end

  def drive_train
    header("УПРАВЛЕНИЕ ПОЕЗДОМ")
    puts "Выберите поезд:"
    show_collection(Train.all)
    train = select_from_collection(Train.all)
    return unless train
    spacer
    puts "Введите номер действия:"
    show_menu(TRAINS_DRIVE_MENU)
    case gets.to_i
    when 1 then train.move_forward
    when 2 then train.move_back
    when 0 then return
    end
  end

end
