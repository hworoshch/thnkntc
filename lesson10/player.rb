class Player

  attr_accessor :cards, :bank
  attr_reader :score, :name

  def initialize
    @bank = 100
    @cards = []
  end

  def score
    @score = 0
    @cards.each { |card| @score += card.value }
    @score
  end

end
