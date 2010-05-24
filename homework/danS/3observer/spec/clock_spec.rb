require "clock"

describe Clock do
  describe "tick method" do
    it "should increment time by one second" do
      c = Clock.new
      t = c.time
      c.tick
      c.time.should == t + 1
    end
  end
end