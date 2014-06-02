class Card

  attr_accessor :contents, :chosen, :matched

  def match(other_cards) # so bad name for this method...
    score = 0
    other_cards.each do |card|
      if card.contents == contents
        score = 1
      end
    end

    score
  end

  def matches_any?(other_cards)
    other_cards.find { |card| matches?(card) } != nil
  end

  def matches?(card)
    contents == card.contents
  end

end
