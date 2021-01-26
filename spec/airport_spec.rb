require 'airport'

describe Airport do

  let(:subject) { described_class.new("RSPEC Airport") }
  let(:plane) { double :plane }

  describe '#initialize' do
      
    it 'is initialized with a name' do
      expect(subject.name).to eq("RSPEC Airport")
    end

  end
    
  describe '#store(plane)' do
      
    it 'should store the plane in the hangar' do
      expect { subject.store(plane) }.to change { subject.hangar.length }.by(1)
      expect(subject.hangar).to include(plane)
    end

  end

  describe '#release(plane)' do
    
    it 'should remove the plane from the hangar' do
        subject.store(plane)
        expect { subject.release(plane) }.to change { subject.hangar.length }.by(-1)
        expect(subject.hangar).to_not include(plane)
    end

  end
    
end
