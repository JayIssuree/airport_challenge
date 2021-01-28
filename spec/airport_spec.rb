require 'airport'

describe Airport do

  let(:weather) { double :weather, :generate => :sunny, :status => :sunny }
  let(:subject) { described_class.new("RSPEC Airport", weather: weather) }
  let(:plane) { double :plane, :update_location => nil }

  describe '#initialize' do
      
    it 'is initialized with a name' do
      expect(subject.name).to eq("RSPEC Airport")
    end

    it 'is initialized with a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be initialized with a capacity of choice' do
      new_capacity = 11
      subject = described_class.new('name', new_capacity)
      expect(subject.capacity).to eq(new_capacity)
    end

  end
    
  describe '#store(plane)' do
      
    it 'should store the plane in the hangar' do
      expect { subject.store(plane) }.to change { subject.hangar.length }.by(1)
      expect(subject.hangar).to include(plane)
    end

    it 'should not store a plane when the hangar is full' do
      subject = described_class.new("RSPEC Airport", 1)
      subject.store(plane)
      plane2 = double(:plane)
      expect { subject.store(plane2) }.to raise_error("Hangar is at capacity")
    end

    it 'should call update location on the plane' do
      expect(plane).to receive(:update_location).with(subject)
      subject.store(plane)
    end

    it 'should not store a duplicate of the plane' do
      subject.store(plane)
      expect{ subject.store(plane) }.to raise_error("Plane already in hangar")
    end

  end

  describe '#release(plane)' do
    
    it 'should remove the plane from the hangar' do
      subject.store(plane)
      expect { subject.release(plane) }.to change { subject.hangar.length }.by(-1)
      expect(subject.hangar).to_not include(plane)
    end

    it 'should call update location on the plane' do
      expect(plane).to receive(:update_location).with(nil)
      subject.release(plane)
    end

  end

  describe 'weather conditions' do

    it 'should initialize a weather condition upon initialization' do
      expect(subject.weather_status).to eq(:sunny)
    end

    it 'should be able to generate new weather' do
      expect(weather).to receive(:generate)
      subject.generate_new_weather
    end

  end
    
end
