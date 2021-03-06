class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @hello_world_label = rmq.append(UILabel, :hello_world).get

    # step 1
    @my_view_button = rmq.append(UIButton.buttonWithType(UIButtonTypeRoundedRect), :my_view_button).get
    rmq(@my_view_button).on(:tap) do
      show_my_view
      puts "my view button clicked!"
    end

    generate_card_game_button
    generate_area_button
  end

  def show_my_view
      @my_controller ||= MyController.alloc.initWithNibName(nil, bundle:nil)
      presentViewController(@my_controller, animated:true, completion: -> { puts "my view presented" })
  end


  def init_nav
    self.title = 'Title Here'

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAction,
                                                                           target: self, action: :nav_left_button)
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                           target: self, action: :nav_right_button)
    end
  end

  def nav_left_button
    puts 'Left button'
  end

  def nav_right_button
    puts 'Right button'
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end


  def generate_card_game_button
    @card_game_button = rmq.append(UIButton, :card_game_button).get
    rmq(@card_game_button).on(:tap) do
      show_card_game
    end
  end

  def generate_area_button
    @area_button = rmq.append(UIButton, :area_button).get
    rmq(@area_button).on(:tap) do
      show_area
    end
  end


  def show_card_game
    @card_game_controller ||= CardGameController.new
    presentViewController(@card_game_controller, animated:true, completion: nil)
  end

  def show_area
    @area_controller ||= AreaController.new
    presentViewController(@area_controller, animated:true, completion: nil)
  end

end


__END__

# You don't have to reapply styles to all UIViews, if you want to optimize,
# another way to do it is tag the views you need to restyle in your stylesheet,
# then only reapply the tagged views, like so:
def logo(st)
  st.frame = {t: 10, w: 200, h: 96}
  st.centered = :horizontal
  st.image = image.resource('logo')
  st.tag(:reapply_style)
end

# Then in willAnimateRotationToInterfaceOrientation
rmq(:reapply_style).reapply_styles


