module MotionSwipe

  module_function

  def build(args)
    # @allCards = args[:cards] || "blahblah"
    puts args
    @exampleCardLabels = args[:example_card_labels] || ["1", "second", "3rd", "last"]
    @allCards = args[:all_cards] || ["1", "second", "3rd", "last"]
    @title = args[:title] || nil
    @frame = args[:frame] || @delegate.view.frame

    draggable = DraggableViewBackground.alloc.initWithFrame(@frame)

    draggable

  end
end