class Thermometer
  def self.read
    reading = `cat /sys/bus/w1/devices/28-000003e8346c/w1_slave`
    r = /t=([-]?[[:digit:]]+)/
    c = (r.match(reading)[1].to_f) / 1000
    f = (1.8 * c) + 32
  end
end
