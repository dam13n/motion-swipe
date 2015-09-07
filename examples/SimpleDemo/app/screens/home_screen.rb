class HomeScreen < PM::Screen
  title "Your title here"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button

    @hello_world = append!(UILabel, :hello_world)

    # set the draggable frame to the home screen's height and width
    @draggable_view = MotionSwipe.build({
      frame: CGRectMake(0, 0, rmq.frame.width, rmq.frame.height),
      delegate: self # Needed if you want to call method of a class with your button
    })

    # set the card dimensions
    card_height = (rmq(@draggable_view).frame.height*3/4).to_i
    card_width = (rmq(@draggable_view).frame.width*3/4).to_i
    # offset = 20
    @draggable_view.setCardWithHeight(card_height, withWidth: card_width)

    @draggable = rmq.append(@draggable_view)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
