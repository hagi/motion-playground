class CardGameControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.green
  end

  def card_front(st)
    st.frame = { top: 200, w: 100, h: 150 }
    st.color = color.black
    st.centered = :both
    st.font = font.system(20)
    st.background_image = image.resource('front')
  end

  def card_back(st)
    st.frame = { top: 200, w: 100, h: 150 }
    st.color = color.red
    st.text = ''
    st.background_image = image.resource('back')
    st.centered = :both

  end

  def flips_label(st)
    st.frame = "a15:j15" # { from_bottom: 10, w: 200, h: 20 }
    st.color = color.white
  end

end
