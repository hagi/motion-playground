describe PlayingDeck do

  it "has 52 cards" do
    deck = PlayingDeck.new

    deck.cards.count.should == 52
  end

end
