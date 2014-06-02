describe Card do

  it "matches returns 1 if any of the 'other' cards has the same content" do
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = 'foo'

    card_1.match([card_2]).should == 1
  end

  it "matches returns 0 if none of the 'other' cards has the same content" do
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = 'bar'

    card_1.match([card_2]).should == 0
  end

  it "matches other card if contents are the same" do
    card_1 = Card.new
    card_1.contents = 'foo'
    card_2 = Card.new
    card_2.contents = 'foo'

    card_1.matches?(card_2).should == true
  end

  it "does not match card if contents differ" do
    card_1 = Card.new
    card_2 = Card.new
    card_1.contents = 'foo'
    card_2.contents = 'bar'

    card_1.matches?(card_2).should == false
  end

  it "matches any of given cards if contents match" do
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = 'foo'

    card_1.matches_any?([card_2]).should == true
  end

  it "does not match any of given cards if contents do not match" do
    card_1 = Card.new
    card_1.contents = "foo"

    card_2 = Card.new
    card_2.contents = 'bar'

    card_1.matches_any?([card_2]).should == false
  end

end
