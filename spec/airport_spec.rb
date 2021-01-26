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
      
    it 'should store the plane in the airport' do
      expect { subject.store(plane) }.to change { subject.hangar.length }.by(1)
      expect(subject.hangar).to include(plane)
    end

  end
    
end
