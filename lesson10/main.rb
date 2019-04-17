require_relative 'game'
require_relative 'player'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'card'
require_relative 'pack'

class Main

  DEFAULT_BET = 10

  def run
    create_players
    @game = Game.new
    first_deal
    loop do
      @game = Game.new
      first_deal
      loop do
        show_cards(@gamer)
        puts "Ходит #{@gamer.name}:"
        puts "1. Пропустить ход"
        puts "2. Добавить карту"
        puts "3. Открыть карты"
        case gets.to_i
        when 2 then add_card(@gamer)
        when 3 then break
        end
        puts "Ходит #{@dealer.name}:"
        add_card(@dealer) if @dealer.score < 17
      end
      show_hands
    end
  end

  protected

  def create_players
    puts "Ваше имя: "
    gamer_name = gets.chomp.to_s
    @gamer = Gamer.new(gamer_name)
    @dealer = Dealer.new
  end

  def first_deal
    [@gamer, @dealer].each do |player|
      @game.pack.deal(player, 2)
      withdraw(player, @game, 10)
    end
  end

  def show_cards(player)
    print "#{player.name}:"
    player.cards.each { |card| print " #{card.suit}#{card.rank}" }
    puts ", score: #{player.score}\n"
  end

  def add_card(player)
    return if player.cards.count > 2
    @game.pack.deal(player)
    show_hands
  end

  def winner
    return nil if @gamer.score == @dealer.score
    @gamer.score > @dealer.score ? @gamer : @dealer
  end

  def show_hands
    [@gamer, @dealer].each { |player| show_cards(player) }
    if winner.nil?
      puts "Ничья!"
      split_bank
    else
      puts "Победил #{winner.name}"
      withdraw(@game, winner)
    end
  end

  def withdraw(from, to, value = from.bank)
    from.bank -= value
    to.bank += value
  end

  def split_bank
    value = @game.bank / 2
    [@gamer, @dealer].each { |player| withdraw(@game, player, value) }
  end
end
