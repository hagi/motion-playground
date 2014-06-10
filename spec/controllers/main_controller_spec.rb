describe "Main controller" do

  tests MainController

  it "has 'Hello World' label" do
    view('Hello World').class.should == UILabel
  end

  it "has 'My View' button" do
    view('My View').class.should == UIButton
  end

  it "pops 'My own view!' when 'My View' button tapped" do
    tap('My View')
    # controller.instance_variable_get('@my_controller').nil?.should == false
    view('My own view!').class.should == UILabel
  end

  it "has 'card game' button which pops 'Card Game' view" do
    view('card game').class.should == UIButton
    tap('card game')

    controller.instance_variable_get('@card_game_controller').nil?.should == false
  end

  it "has 'area' button" do
    view('area').class.should == UIButton
    tap('area')

    controller.instance_variable_get('@area_controller').nil?.should == false
  end

end