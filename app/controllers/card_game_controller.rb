class CardGameController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = CardGameControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    @card = rmq.append(UIButton, :card_front).get
    @card.accessibilityLabel = 'card' # TODO: poor solution for testing difficulty
    rmq(@card).on(:tap) do |sender|
      puts sender
      card_button_touched
    end

    @flips_label = rmq.append(UILabel, :flips_label).get
  end

  def card_button_touched
    if @card.currentTitle == ''
      rmq(@card).apply_style(:card_front) #.style { |st| st.text = draw_card.contents }
      @card.setTitle(draw_card.contents, forState:UIControlStateNormal)

    else
      rmq(@card).apply_style(:card_back)
    end
    self.flips_count += 1
  end

  def flips_count=(count)
    @flips_count = count
    @flips_label.text = "Flips: #{@flips_count}"
    puts "flips_count changed to #{count}"
  end

  def flips_count
    @flips_count || 0
  end

  def draw_card
    @deck ||= PlayingDeck.new
    @deck.draw_random_card
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
