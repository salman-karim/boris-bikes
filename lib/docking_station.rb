require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No bikes available' if bikes.all? {|bike| bike.broken?}
    working_bike = bikes.reject {|bike| bike.broken?}.pop
    bikes.delete(working_bike)
  end

  def dock bike
    fail "Docking station full" if full?
    bikes << bike
  end

  def release_broken_bikes
    broken_bikes = bikes.select {|bike| bike.broken?}
    bikes.reject! {|bike| bike.broken?} 
    broken_bikes
  end

  #private

  attr_reader :bikes

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
