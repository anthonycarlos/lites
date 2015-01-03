class Light
  def self.on
    `gpio write 0 1`
  end
  def self.off
    `gpio write 0 0`
  end
end
