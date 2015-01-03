class Timer
  attr_reader :sleep_interval, :next_event
  def initialize
    @sleep_interval = 5
  end

  def enqueue(event)
    @next_event = event
  end

  def run
    @running = true
    while @running do
      if Time.now.to_i >= @next_event.time.to_i
        trigger @next_event
        @running = false
      end
      sleep_a_little
    end
  end

  def sleep_a_little
    puts "Sleeping #{@sleep_interval}"
    sleep @sleep_interval
    puts "Awoke from sleep at #{Time.now}"
  end

  def trigger(event)
    event.execute
    puts "Triggered event at #{Time.now}"
  end
end
