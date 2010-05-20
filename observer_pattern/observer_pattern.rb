module Game_stuff
  def winner
    "#{[@game.player1, @game.player2][rand(2)]} is the winner"
  end
  def greeting_message
    @welcome
  end
end

class Game
  attr_accessor :player1, :player2
  def initialize(game_type, player1 = "player1", player2 = "player2")
    @player1 = player1 
    @player2 = player2
    @game = game_type.new(self) 
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

end
