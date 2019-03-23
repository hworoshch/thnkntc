require_relative 'menu'

require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'station'
require_relative 'route'

def hr 
  puts "\n"
end

def spacer
  puts "\n\n"
end

def list_stations(stations)
  stations.each_with_index { |station, index| puts "#{index}> #{station.title}" if station }
end

def list_trains(trains)
  trains.each_with_index { |train, index| puts "#{index}> #{train.type.capitalize} #{train.number}" }
end
  

loop do
  show_main_menu
  case gets.to_i
    when 1
      loop do
        show_stations_menu
        stations = Station.all
        case gets.to_i
          when 1
            spacer
            puts "СОЗДАТЬ СТАНЦИЮ"
            hr
            puts "Введите название станции: "
            station_title = gets.chomp
            Station.new(station_title)
          when 2
            spacer
            puts "СПИСОК СТАНЦИЙ"
            hr
            list_stations(stations)
          when 3
            spacer
            puts "Введите номер станции:"
            list_stations(stations)
            hr
            station = stations[gets.to_i]
            return unless station
            spacer
            puts "ПОЕЗДА НА СТАНЦИИ #{station.title.upcase}:"
            list_trains(station.trains)
          when 9
            break
        end
      end
    when 2
      loop do
        routes = Route.all
        stations = []
        show_routes_menu
        case gets.to_i
          when 1
            spacer
            puts "СОЗДАТЬ МАРШРУТ"
            hr
            puts "Введите номер начальной станции:"
            stations = Station.all
            list_stations(stations)
            hr
            start_station = stations[gets.to_i]
            spacer
            puts "Введите номер конечной станции:"
            list_stations(stations.delete(start_station))
            hr
            end_station = stations[gets.to_i]
            route = Route.new(start_station, end_station) 
          when 2
            spacer
            puts "ИЗМЕНИТЬ МАРШРУТ"
            hr
            puts "Введите номер маршрута:"
            routes.each_with_index { |route, index| puts "#{index}> #{route.stations.first.title} - #{route.stations.last.title}" }
            hr
            route = routes[gets.to_i]
            spacer
            puts "Введите номер операции:"
            puts "1> Добавить станцию"
            puts "2> Удалить станцию"
            hr
            case gets.to_i
              when 1
                spacer
                puts "Введите номер добавляемой станции:"
                stations = Station.all
                available_stations = stations - route.stations
                list_stations(available_stations)
                hr
                station = available_stations[gets.to_i]
                route.add_station(station)
              when 2
                spacer
                puts "Введите номер удаляемой станции:"
                list_stations(route.stations)
                hr
                station = stations[gets.to_i]
                route.remove_station(station)                
            end
          when 3
            spacer
            puts "НАЗНАЧИТЬ МАРШРУТ"
            hr
            puts "Введите номер маршрута:"
            routes.each_with_index { |route, index| puts "#{index}> #{route.stations.first.title} - #{route.stations.last.title}" }
            hr
            route = routes[gets.to_i]
            spacer
            puts "Введите номер поезда: "
            trains = Train.all
            list_trains(trains)
            hr
            train = trains[gets.to_i]
            train.set_route(route)
          when 9
            break
        end
      end
    when 3
      loop do
        show_trains_menu
        trains = Train.all
        routes = Route.all
        case gets.to_i
          when 1
            spacer
            puts "СОЗДАТЬ ПОЕЗД"
            hr
            puts "Введите номер поезда:"
            train_number = gets.to_i
            spacer
            puts "Введите номер типа:"
            puts "1> Грузовой"
            puts "2> Пассажирский"
            hr
            case gets.to_i
              when 1
                puts CargoTrain.new(train_number)
              when 2
                puts PassengerTrain.new(train_number)
            end
          when 2
            spacer
            puts "ИЗМЕНИТЬ ПОЕЗД"
            hr
            puts "Введите номер поезда:"
            list_trains(trains)
            hr
            train = trains[gets.to_i]
            return if train.nil?
            spacer
            puts "Введите номер операции:"
            puts "1> Добавить вагон"
            puts "2> Удалить вагон"
            hr
            case gets.to_i
              when 1
                train.add_car(CargoCar.new) if train.type == 'cargo'
                train.add_car(PassengerCar.new) if train.type == 'passenger'
              when 2
                spacer
                puts "Выберите вагон:"
                train.cars.each_with_index { |car, index| puts "#{index}> #{car}" }
                hr
                car = train.cars[gets.to_i]
                train.remove_car(car)
            end
          when 3
            spacer
            puts "УПРАВЛЕНИЕ ПОЕЗДОМ"
            hr
            puts "Выберите поезд:"
            list_trains(trains)
            hr
            train = trains[gets.to_i]
            return if train.nil?
            spacer
            puts "Введите номер действия:"
            puts "1> Вперед по маршруту"
            puts "2> Назад по маршруту"
            hr
            case gets.to_i
              when 1
                train.move_forward
              when 2
                train.move_back
            end
          when 9
            break
        end
      end
    when 9
      break
  end
end

