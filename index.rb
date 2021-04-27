require 'ruby2d'
require './snakeClass.rb'
require './gameClass.rb'



snake = Snake.new
  game = Game.new
  
  update do
    clear
  
    unless game.finished?
      snake.move
    end
  
    snake.draw
    game.draw
  
    if game.snake_hit_ball?(snake.x, snake.y)
      game.record_hit
      snake.grow
    end
  
    if snake.hit_itself?
      game.finish
    end
  end
  
  on :key_down do |event|
    if ['up', 'down', 'left', 'right'].include?(event.key)
      if snake.can_change_direction_to?(event.key)
        snake.direction = event.key
      end
    end
  
    if game.finished? && event.key == 'r'
      snake = Snake.new
      game = Game.new
    end
  end
  
  show