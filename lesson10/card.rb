class Card

  attr_reader :rank, :suit

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    self.get_value
  end

  protected

  def get_value
    if ('2'..'10').to_a.include?(self.rank)
      self.rank.to_i
    elsif ['J', 'Q', 'K'].include?(self.rank)
      10
    elsif self.rank == 'A'
      11
    end
  end

end
