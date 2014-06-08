describe 'CardGameController' do

  tests CardGameController

  it "changes 'flips_label' on card touch" do
    tap('card') # poor workaround for finding button by invalid accesibility label
    tap('card')

    view('Flips: 2').should != nil
  end

  it "draws card on 'card' touch" do
    previous_card = view('card').currentTitle

    tap('card')
    view('card').currentTitle.should == ''

    tap('card')
    view('card').currentTitle.should != ''
    view('card').currentTitle.should != previous_card
  end

end
