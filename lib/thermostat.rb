require 'thermometer'
require 'heater'

class Thermostat
  HEATER_THRESHOLD = 38.0 # 38.0 is a Float

  def self.regulate
    temp = Thermometer.read # a Float
    puts "Temperature is #{temp}"
    heater_on = Heater.state
    if temp > HEATER_THRESHOLD
      if heater_on
        Heater.off
        puts "Turned off heater."
      end
    else
      unless heater_on
        Heater.on
        puts "Turned on heater."
      end
    end
  end

end
