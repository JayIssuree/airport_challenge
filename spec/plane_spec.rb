require 'plane'

describe Plane do

  let(:airport) { double :airport, 
                         :hangar => [],
                         :name => "Heathrow",
                         :store => nil,
                         :release => nil
  }
    
  describe '#land(airport)' do
      
    it 'should say the plane has landed successfully' do
      expect(subject.land(airport)).to eq("#{subject} successfully landed at #{airport.name}")
    end

    it 'should call airport.store(plane)' do
      expect(airport).to receive(:store).with(subject)
      subject.land(airport)
    end

  end

  describe '#take_off' do
      
    it 'should take off from an airport' do
      subject.land(airport)
      allow(subject).to receive(:current_location).and_return(airport)
      expect(subject.take_off).to eq("#{subject} successfully took off from #{airport.name}")
    end

  end

  describe '#update_location(location)' do
    
    it 'should update the location' do
      subject.update_location(airport)
      expect(subject.current_location).to eq(airport)
    end

  end

end
