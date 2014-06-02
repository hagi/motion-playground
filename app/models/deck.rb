class Deck

  def add_card(card, at_top: at_top)
    if at_top
      cards.insertObject(card, atIndex: 0)

    else
      cards.addObject(card)
    end
  end

  def add_card(card)
    add_card(card, at_top: false)
  end

  def draw_random_card
    random_card = nil
    if cards.count > 0
      index = rand(cards.count) # was: unsigned index = arc4random() % [self.cards count];
      random_card = cards[index]
      cards.removeObjectAtIndex(index)
    end
    random_card
  end

  def cards
    @cards ||= []
  end

end