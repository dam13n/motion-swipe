Motion-Swipe for RubyMotion
====================

Trying to add a Tinder-like swipe gem for RubyMotion.


__create a draggable view background__
``` ruby
@draggable = MotionSwipe.build({
  frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height),
  delegate: self # Needed if you want to call method of a class with your button
})
```

__adjust the draggable view's height and width__
``` ruby
@draggable.setCardWithHeight(@height, withWidth: width)
```

__create a new draggable view, and add it to the draggable view background__
``` ruby
new_card = @draggable.createDraggableView
@draggable.addCard(new_card)
```
