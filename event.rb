class Event
  attr_reader :time, :action

  def initialize(time, action)
    @time = time
    @action = action
  end

  def execute
    @triggered = true
  end

  def triggered?
    @triggered
  end

end
