class Bike

  def initialize
    @broken = false
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @broken = true
    @working = false
  end

  def broken?
    @broken
  end
end
