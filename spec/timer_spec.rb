require 'spec_helper'

describe Timer do

  describe "#initialize" do
    Given(:timer) { Timer.new }
    Then { timer.sleep_interval == 5 }
  end

  describe "#enqueue" do

    context "first event" do
      Given(:timer) { Timer.new }
      Given(:event) { Event.new(Time.now, :action) }
      When { timer.enqueue(event) }
      Then { timer.next_event == event }
    end

  end

  describe "#run" do
    Given(:start_time) { Time.local(2015,1,3,12,47,23) }
    Given { Timecop.travel(start_time) }
    Given(:event) { Event.new(start_time + 9, :action) }
    Given(:timer) { t = Timer.new; t.enqueue(event); t }
    When { timer.run }
    Then { event.triggered? == true }

    context "event scheduled for 12:47:23" do
      Given(:event) { Event.new(Time.local(2015,1,3,12,47,23), :action) }
      Given(:timer) { t = Timer.new; t.enqueue(event); t }

      context "time is 12:47:22" do
        When do
          Timecop.freeze(Time.local(2015,1,3,12,47,22)) do
            timer.run
          end
        end
        Then { event.triggered? == false }
      end

    end

  end

end
#Given(:start) { Time.local(2015,1,3,12,47,23) }
#
#I want to test that the event gets triggered at 12:47:23
#describe "#run" do
#  Given(:timer) { Timer.new }
#  And(:now) { }
#  Then 
#  timer.run
#end
#given i have an event scheduled for 12:47:23
#when i run the timer
#and time is 12:47:22
#then it should not trigger
#
#when time is 12:47:23 
#  then it should trigger
#
#
#when time is 12:47:24 
#  then it should trigger


