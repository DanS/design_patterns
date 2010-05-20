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
    winner = [@game.player1, @game.player2].rand
    return "#{winner} is the winner"
  end
end

class TwoHeads
  def initialize(game) 
      @game = game
  end
  def greeting_message
    "Welcome to Two Heads game, it is #{@game.player1}'s turn"
  end
end

class SevenDie
  def initialize(game) 
    @game = game
  end
  def greeting_message
    "Welcome to Seven Die game, it is #{@game.player1}'s turn"
  end
end

class ScoreBoard

end
