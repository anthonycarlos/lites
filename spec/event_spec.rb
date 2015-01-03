require 'spec_helper'

describe Event do

  describe "#initialize" do
    Given(:time) { Time.now }
    Given(:action) { :action }
    Given(:event) { Event.new(time, action) }
    Then { event.time == time }
    And { event.action == action }
  end

  describe "#trigger" do
    Given(:time) { Time.now }
    Given(:action) { :action }
    Given(:event) { Event.new(time, action) }
    When { event.execute }
    Then { event.triggered? == true }
  end

end
