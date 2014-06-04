describe PlayingCard do

  it "returns combined rank/suit contents" do
    card = PlayingCard.new
    card.rank = 4
    card.suit = :club

    card.contents.should == '4♣'
  end


end