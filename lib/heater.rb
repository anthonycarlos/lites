class Heater
  def self.on
    `gpio write 1 1`
  end
  def self.off
    `gpio write 1 0`
  end
  def self.state
    `gpio read 1`.to_i > 0
  end
end

