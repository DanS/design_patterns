require "observer"

module Game_stuff
  include Observable
  def winner
    name = [@game.player1, @game.player2][rand(2)]
    changed
    notify_observers(name)
    "#{name} is the winner"
  end
  def greeting_message
    @welcome
  end
end

class Game
  attr_accessor :player1, :player2, :scoreBoard
  def initialize(game_type, player1 = "player1", player2 = "player2")
    @player1 = player1 
    @player2 = player2
    @game = game_type.new(self)
    @scoreBoard = ScoreBoard.new(@game)
  end
  
  def start_game
    @game.greeting_message
  end

  def play
    @game.winner
  end
end

class TwoHeads
  include Game_stuff
  def initialize(game) 
    @game = game
    @welcome = "Welcome to Two Heads game, it is #{@game.player1}'s turn"
  end
end

class SevenDie
  include Game_stuff
  def initialize(game) 
    @game = game
    @welcome = "Welcome to Seven Die game, it is #{@game.player1}'s turn"
  end
end

class ScoreBoard
  attr_reader :winners
  def initialize(game)
    @game = game
    @winners = []
    @game.add_observer(self)
  end
  def update(winner)
    @winners << winner
  end
  def score
    scores = {}
    @winners.uniq.each {|k| scores[k] = 0}
    @winners.each {|k| scores[k] = scores[k] + 1 }
  end
end
