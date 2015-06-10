require 'docking_station'

describe DockingStation do

  it 'should respond to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'should release a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
