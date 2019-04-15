require_relative 'player'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'card'
require_relative 'pack'

class Game

  DEFAULT_BET = 10

  attr_accessor :bank
  attr_accessor :current_player

  def initialize
    @gamer = Gamer.new
    @dealer = Dealer.new
    #@current_player = @gamer
    @pack = Pack.new
    @bank = 0
  end

  def run
    Game.new
  end

  def first_deal
    [@gamer, @dealer].each do |player|
      @pack.deal(player, 2)
      withdraw(player, self, DEFAULT_BET)
      show_cards(player)
    end
  end

  def add_card(player)
    return if player.cards.count > 2
    @pack.deal(player)
    show_cards(player)
  end

  protected

  def withdraw(from, to, value)
    from.bank -= value
    to.bank += value
  end

  def show_cards(player)
    print "#{player.name}:"
    if player.is_a?(Gamer)
      player.cards.each { |card| print " #{card.suit}#{card.rank}" }
      puts ", score: #{player.score}\n"
    else
      player.cards.each { |card| print " *" }
    end
  end
end
