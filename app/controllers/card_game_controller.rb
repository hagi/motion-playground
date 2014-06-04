class CardGameController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = CardGameControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    @card = rmq.append(UIButton, :card_front).get
    rmq(@card).on(:tap) do |sender|
      puts sender
      card_button_touched
    end
  end

  def card_button_touched
    if @card.currentTitle == ''
      rmq(@card).apply_style(:card_front)
    else
      rmq(@card).apply_style(:card_back)
    end
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
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
