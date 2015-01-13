module MotionSwipe

  module_function

  def build(args)
    # @allCards = args[:cards] || "blahblah"
    puts args
    @exampleCardLabels = args[:example_card_labels] || ["1", "second", "3rd", "last"]
    @allCards = args[:all_cards] || ["1", "second", "3rd", "last"]
    @title = args[:title] || nil
    @frame = args[:frame] || @delegate.view.frame


    puts "frame origin: #{@frame.origin}"
    puts "frame origin 1: #{@frame.origin[1]}"

    puts "frame width: #{@frame.width}"
    puts "frame height: #{@frame.height}"

    draggable = DraggableViewBackground.alloc.initWithFrame(@frame) #, withHeight: 20, withWidth: 20)
    # draggable.
    # draggabe.cardHeight = args[:height]
    # draggable.cardWidth = args[:width]

    draggable

  end
end