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
    st.frame = { top: 150, w: 200, h: 20 }
    st.text = "Hide view"
    st.centered = :horizontal
  end


end
