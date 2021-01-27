require 'weather'

describe Weather do
    
  describe '#generate' do
    
    it 'should return stormy weather' do
      expect(subject.weather_types).to receive(:sample).and_return(:stormy)
      expect(subject.generate).to eq(:stormy)
    end

    it 'should return sunny weather' do
      expect(subject.weather_types).to receive(:sample).and_return(:sunny)
      expect(subject.generate).to eq(:sunny)
    end

  end

  describe '#status' do
    
    it 'should be nil upon initialization' do
      expect(subject.status).to be(nil)
    end

    it 'should save the generated weather to the status' do
      subject.generate
      expect(subject.status).to_not be(nil)
    end

  end

end
