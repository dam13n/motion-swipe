module MotionSwipe

  module_function

  def build(args)
    @allCards = args[:cards] || "blahblah"
    @exampleCardLabels = args[:example_card_labels] || ["1", "second", "3rd", "last"]
    @title = args[:title] || nil
    @delegate = args[:delegate] || self

    # @transition = transitionBuild args[:transition]
    # @buttons = buttonsBuild args[:buttons]

    draggable = DraggableViewBackground.alloc.initWithFrame(self.view.frame)


    # alert = SIAlertView.alloc.initWithTitle(@title, andMessage:@message)
    # alert.transitionStyle = @transition

    draggable

  end