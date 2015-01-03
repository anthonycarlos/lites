class Timer
  def initialize
    @sleep_interval = 9
    @ft = Time.now + 9
    puts "It is now #{Time.now}"
    puts "ft is set to #{@ft}"
  end

  def run
    @running = true
    while @running do
      if Time.now.to_i >= @ft.to_i
        trigger_event
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

  def trigger_event
    puts "Triggered event at #{Time.now}"
  end
end
