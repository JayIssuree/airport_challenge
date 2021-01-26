require 'plane'

describe Plane do

  let(:airport) { double :airport, 
                         :hangar => [],
                         :name => "Heathrow",
                         :store => nil 
  }
    
  describe '#land(airport)' do
      
    it 'should say the plane has landed successfully' do
      expect(subject.land(airport)).to eq("Plane successfully landed at #{airport.name}")
    end

    it 'should call airport.store(plane)' do
      expect(airport).to receive(:store).with(subject)
      subject.land(airport)
    end

  end

end
