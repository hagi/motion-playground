class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def hello_world(st)
    st.frame = {t: 100, w: 200, h: 18}
    st.centered = :horizontal
    st.text_alignment = :center
    st.text = 'Hello World'
    st.color = color.battleship_gray
    st.font = font.medium
  end

  def my_view_button(st)
    st.frame = { top: 150, w: 200, h: 20 }
    st.text = "My View"
    st.centered = :horizontal
  end

  def card_game_button(st)
    st.frame = { top: 180, w: 200, h: 20 }
    st.text = 'card game'
    st.centered = :horizontal
    st.color = color.battleship_gray
  end

  def area_button(st)
    st.frame = { top: 210, w: 200, h: 20 }
    st.text = 'area'
    st.centered = :horizontal
    st.color = color.battleship_gray
  end


end
