require 'docking_station'

require 'bike'

describe DockingStation do

    it 'should respond to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases working bike' do
      bike = double :bike, broken?: false
      subject.dock bike
      expect(subject.release_bike).to be bike
    end

    it 'does not release broken bikes' do
      bike = double :bike, broken?: true
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it { is_expected.to respond_to(:dock).with(1).argument}

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  describe 'capacity' do
    it 'can set the capacity' do
      expect(subject.capacity=(50)).to eq 50
    end
  end


  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe 'load' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock double :bike}
      expect{subject.dock double :bike }.to raise_error 'Docking station full'
    end
  end

end
