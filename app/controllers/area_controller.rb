class AreaController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = AreaControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    20.times do
      box = rmq.append(Box).move(l: rand(7) * 40, t: rand(11) * 40).on(:tap) { |sender| escape(sender) }
      append_swipes(box)
    end

  end

  def append_swipes(box)
    box.on(:swipe_left) { |sender| rmq.animate { rmq(sender).nudge(left: 40) } }
    box.on(:swipe_right) { |sender| rmq.animate { rmq(sender).nudge(right: 40) } }
    box.on(:swipe_up) { |sender| rmq.animate { rmq(sender).nudge(up: 40) } }
    box.on(:swipe_down) { |sender| rmq.animate { rmq(sender).nudge(down: 40) } }
  end

  def escape(sender)
    opts = {}
    opts[[:down, :up, :left, :right].sample] = 40
    rmq.animate do
      rmq(sender).nudge(opts)
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
