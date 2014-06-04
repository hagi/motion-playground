class PlayingDeck < Deck

  def initialize
    for suit in PlayingCard.valid_suits do
      for rank in 1..PlayingCard.max_rank do
        card = PlayingCard.new
        card.suit = suit
        card.rank = rank
        add_card card
      end
    end
  end


end