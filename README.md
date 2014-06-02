motion-playground
===================

RubyMotion playground. No idea yet, probably lame exercises.

##### step 0: clean app by rmq (https://github.com/infinitered/rmq)

```
$ rmq create motion-playground
```

##### step 1: add some other view available by using button
- `?` where is border of the button?
- `?` how to go up from cmd+point in simulator, ButtonLabel -> Button (repl/console info needed)

##### step 2: add some styling for buttons
- `?` why border_width/color styler works as ui_button_styler but not as ui_view_styler (border_radius works as ui_view_styler)

##### step 3: add some tests
- http://integrallis.com/2013/03/tdd_in_ios_w_ruby_motion_part_i
- http://www.rubymotion.com/developer-center/articles/testing/
- http://rubymotion-tutorial.com/8-testing/
- http://blog.motioninmotion.tv/rubymotion-testing-tools

##### step 4: CDQ
- https://github.com/infinitered/cdq
```
$ rake schema:build
$ cdq create model task
```
- `!` bad model test generator: https://github.com/infinitered/cdq/issues/4

##### step 5: Card Game
- https://itunes.apple.com/us/course/developing-ios-7-apps-for/id733644550
- `?` how to get something like 'arc4random()' this in ruby motion?











