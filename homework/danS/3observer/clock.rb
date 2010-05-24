require "observer_pattern"

class Clock
  include Observer
  attr_reader :time

  def initialize(time = 0)
    @time = time
  end

  def tick
    @time += 1  
  end
end

class Display

  def initialize(clock)
    @myTime = 0
    clock.add_observer(self)
  end

  def update(time)
    @myTime = time
  end
end