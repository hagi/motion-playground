describe "Main controller" do

  tests MainController

  it "has 'Hello World' label" do
    view('Hello World').nil?.should == false
  end

  it "has 'My View' button" do
    view('My View').nil?.should == false
  end

  it "pops @my_controller when 'My View' button tapped" do
    tap('My View')
    controller.instance_variable_get('@my_controller').nil?.should == false
  end

end