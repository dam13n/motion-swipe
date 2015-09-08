class SwipeViewController < UIViewController
  def viewDidLoad

    @draggable = MotionSwipe.build({
      frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height),
      delegate: self # Needed if you want to call method of a class with your button
    })

    @height = (@draggable.frame.size.height*7/10).to_i
    @width = (@draggable.frame.size.width*7/8).to_i

    @draggable.setCardWithHeight(@height, withWidth: @width)
    # @draggable.cardHeight = @height
    @draggable.loadedCardsCount

    self.view.addSubview @draggable

    # add left action button
    left_button = UIButton.buttonWithType UIButtonTypeRoundedRect
    left_button.frame = [[50, 500], [100, 50]]
    left_button.backgroundColor = UIColor.redColor
    left_button.setTitle "Left Action"

    left_button.addTarget(self,
      action: :left_click,
      forControlEvents: UIControlEventTouchUpInside)

    self.view.addSubview left_button

    # add right action button
    right_button = UIButton.buttonWithType UIButtonTypeRoundedRect
    right_button.frame = [[250, 500], [100, 50]]
    right_button.backgroundColor = UIColor.greenColor
    right_button.setTitle "Right Action"

    right_button.addTarget(self,
      action: :right_click,
      forControlEvents: UIControlEventTouchUpInside)

    # Add the button to the view
    self.view.addSubview right_button

    5.times do |i|
      new_card = @draggable.createDraggableView

      new_card.cardId = i
      new_card.backgroundColor = UIColor.grayColor

      @draggable.addCard(new_card)
    end

    @draggable.loadCards()

  end

  def left_click
    puts "left"
    @draggable.swipeLeft
  end

  def right_click
    puts "right"
    @draggable.swipeRight
  end
end