class Heater
  def self.on
    `gpio write 1 1`
  end
  def self.off
    `gpio write 1 0`
  end
end

