require_relative 'player'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'card'
require_relative 'pack'

class Game

  DEFAULT_BET = 10

  attr_accessor :bank

  def initialize
    @gamer = Gamer.new
    @dealer = Dealer.new
    @pack = Pack.new
    @bank = 0
  end

  def first_deal
    @pack.deal(@gamer, 2)
    withdraw(@gamer, self, DEFAULT_BET)
    show_cards(@gamer)
    @pack.deal(@dealer, 2)
    withdraw(@dealer, self, DEFAULT_BET)
    show_cards(@dealer)
  end

  def withdraw(from, to, value)
    from.bank -= value
    to.bank += value
  end

  def show_cards(player)
    print "#{player.name}:"
    player.cards.each { |card| print " #{card.suit}#{card.rank}" }
    puts ", score: #{player.score}\n"
  end
end
