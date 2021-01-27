require 'airport'

describe Airport do

  let(:subject) { described_class.new("RSPEC Airport") }
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
      subject.capacity.times { subject.store(plane) }
      expect { subject.store(plane) }.to raise_error("Hangar is at capacity")
    end

    it 'should call update location on the plane' do
      expect(plane).to receive(:update_location).with(subject)
      subject.store(plane)
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
    
end
