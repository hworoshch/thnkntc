require_relative 'player'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'card'
require_relative 'pack'

class Game
  def initialize
    @gamer = Gamer.new
    @dealer = Dealer.new
    @pack = Pack.new
    @pack.deal(@gamer, 2)
    show_cards(@gamer)
    @pack.deal(@dealer, 2)
    show_cards(@dealer)
    return nil
  end


  def show_cards(player)
    puts "#{player.name}:"
    player.cards.each { |card| print "#{card.suit}#{card.rank} " }
    puts "Total score: #{player.score}\n"
  end

end
