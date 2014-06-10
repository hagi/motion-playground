class AreaController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = AreaControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here
    20.times do
      rmq.append(Box).move(l: rand(300), t: rand(450)).on(:tap) { |sender| escape(sender) }
    end

  end

  def escape(sender)
    opts = {}
    opts[[:down, :up, :left, :right].sample] = 40
    rmq(sender).nudge(opts)
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
