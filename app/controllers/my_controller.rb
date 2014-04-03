class MyController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MyStylesheet
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @info = rmq.append(UILabel, :info).get
    @hide_button = rmq.append(UIButton, :hide_button).get
    rmq(@hide_button).on(:tap) do
      dismissViewControllerAnimated(true, completion: -> { puts "my view hidden" })
      puts "hide button tapped!"
    end

  end

end

