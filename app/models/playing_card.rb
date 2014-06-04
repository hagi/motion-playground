class PlayingCard < Card

  attr_accessor :rank

  def contents
    rank_strings = PlayingCard.rank_strings
    "#{rank_strings[rank || 0]}#{suit}"
  end

  def suit
    @suit ? suit_strings[@suit] : '?'
  end

  def suit=(suit)
    if PlayingCard.valid_suits.include? suit
      @suit = suit
    end
  end

  def rank=(rank)
    @rank = rank if rank < PlayingCard.max_rank
  end


  def self.valid_suits
    [:heart, :club, :diamond, :spade]
  end

  def self.max_rank
    rank_strings.count - 1
  end

private
  def suit_strings
    {
      spade: '♠',
      heart: '♥',
      diamond: '♦',
      club: '♣'
    }
  end

  def self.rank_strings
    %w/? A 2 3 4 5 6 7 8 9 10 J Q K/
  end

end