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

end