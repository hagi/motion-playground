describe Deck do

  it "adds card on top" do
    deck = Deck.new
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = "bar"

    deck.add_card(card_1)
    deck.add_card(card_2, at_top: true)

    cards = deck.instance_variable_get(:@cards)
    cards.should.not == nil
    cards[0].match [card_2]
  end

  it "adds add card on bottom" do
    deck = Deck.new
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = "bar"

    deck.add_card(card_1)
    deck.add_card(card_2)

    cards = deck.instance_variable_get(:@cards)
    cards.should.not == nil
    cards[0].match [card_1]
  end

  it "draws random card" do
    deck = Deck.new
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = "bar"

    deck.add_card(card_1)
    deck.add_card(card_2)

    card = deck.draw_random_card
    deck.draw_random_card.should == (card.match([card_1]) == 1 ? card_2 : card_1)
  end


  it "remove cards from deck if drawing card" do
    deck = Deck.new
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = "bar"

    deck.add_card(card_1)
    deck.add_card(card_2)

    cards = deck.instance_variable_get :@cards
    cards.count.should == 2

    deck.draw_random_card
    cards.count.should == 1

    deck.draw_random_card
    cards.count.should == 0
  end


  it "draws 'nil' card on empty deck" do
    deck = Deck.new
    deck.draw_random_card.should == nil
  end


end