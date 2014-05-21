class MyStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.red
  end

  def info(st)
    st.frame = {t: 100, w: 200, h: 25}
    st.centered = :horizontal
    st.text_alignment = :center
    st.text = 'My own view!'
    st.color = color.white
    st.font = font.medium
  end

  def hide_button(st)
    st.frame = { t: 150, w: 200, h: 40 }
    st.text = "Hide view"
    st.centered = :horizontal
    st.border_color = color.from_hex('#f5f5f5').CGColor
    st.border_width = 1
    st.corner_radius = 5
    st.background_color = color.from_rgba(255, 255, 255, 0.3)
  end


end
