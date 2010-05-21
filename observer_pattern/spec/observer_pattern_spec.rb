require 'observer_pattern'
#game1 first person to roll under 7 twice with a die wins
#game2 first person to flip heads twice wins

describe Game do
  describe "At the start of the game" do

    before do
      @game = Game.new(TwoHeads)
      @game_with_names = Game.new(TwoHeads, "Liah", "Shailen")
    end

    it "there should be 2 players" do
      @game.player1.should == 'player1'
      @game.player2.should == 'player2'
    end
    
    it "the players should be able to use their own names" do
      @game_with_names.player1.should == 'Liah'
      @game_with_names.player2.should == 'Shailen'
    end

    it "should have a scoreboard" do
      @game.scoreBoard.should_not == nil
    end

    it "should record the count of winners in the scoreBoard" do
      10.times {@game.play}
      @game.scoreBoard.winners.length.should == 10
    end
  end

  describe "playing the game" do

    it "should return a winner name when played" do
      @game = Game.new(TwoHeads)
      @game.play.should =~ /(.*)is the winner/
    end
  end
end

describe TwoHeads do
  describe "At the start of the game" do 
    before do
      @two_heads = Game.new(TwoHeads)
      @two_heads_with_names = Game.new(TwoHeads, "Liah", "Shailen")
    end
    
    it "there should be 2 players" do
      @two_heads.player1.should == 'player1'
      @two_heads.player2.should == 'player2'
    end
    
    it "the players should be able to use their own names" do
      @two_heads_with_names.player1.should == 'Liah'
      @two_heads_with_names.player2.should == 'Shailen'
    end
    
    it "should output a greeting message" do
      @two_heads.start_game.should == "Welcome to Two Heads game, it is player1's turn"
      @two_heads_with_names.start_game.should == "Welcome to Two Heads game, it is Liah's turn"
    end
  end
end 
 
describe SevenDie do
  describe "At the start of the game" do
    
    before do
      @seven_die = Game.new(SevenDie)
      @seven_die_with_names = Game.new(SevenDie, "Liah", "Shailen")
    end
 
    it "there should be 2 players" do
      @seven_die.player1.should == 'player1'
      @seven_die.player2.should == 'player2'
    end
 
    it "the players should be able to use their own names" do
      @seven_die_with_names.player1.should == 'Liah'
      @seven_die_with_names.player2.should == 'Shailen'
    end
 
    it "should output a greeting message" do
      @seven_die.start_game.should == "Welcome to Seven Die game, it is player1's turn"
      @seven_die_with_names.start_game.should == "Welcome to Seven Die game, it is Liah's turn"
    end
  end
end