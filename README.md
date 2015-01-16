Motion-Swipe for RubyMotion
====================
![alt tag](http://imgur.com/4bYw12e.gif)

Trying to add a Tinder-like swipe gem for RubyMotion. Not really production ready but useable. PRs for fixes, refactors and features accepted! This is also my first gem - advice/help is welcome.

This is a wrapper around Richard Kim's TinderSimpleSwipeCards written in obj-c. He does an excellent job detailing how it all works, so that you customize it easily. Some of that got erased when I was making this, so see his source: https://github.com/cwRichardKim/TinderSimpleSwipeCards

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

__now just append views, buttons, whatever to that draggable view, and you're good!__
