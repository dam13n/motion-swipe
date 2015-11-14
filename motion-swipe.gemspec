# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "motion-swipe"
  s.version     = '0.0.6'
  s.summary     = "Rubymotion gem to use TinderSimpleSwipeCards"
  s.description = "Easily create an interface with swipeable cards."
  s.authors     = ["Damien Sutevski"]
  s.email				= "dameyawn@gmail.com"
  s.homepage		= "http://github.com/dam13n/motion-swipe"

  s.require_paths = ["lib", "vendor"]
  # s.files         = `git ls-files`.split($\)
  s.files         = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["README.md"]
  s.license     = 'MIT'
end
