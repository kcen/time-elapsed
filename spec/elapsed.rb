require 'time-elapsed'
describe Time do
  describe '.plus' do
    it 'adds time to value' do
      Time.at(0).plus('3days').to_i.should == 259200
    end
  end

  describe '.minus' do
    it 'subtracts time to value' do
      Time.at(259200 + 1234).minus('3 days').to_i.should == 1234
    end
  end
end

describe Time::Elapsed do
  describe '.time' do
    it 'creates a parsed string' do
      Time::Elapsed.time('3 weeks').should == 1814400
    end
    it 'raises an error on zero values' do
      expect { Time::Elapsed.time('0 weeks') }.to raise_error
    end
    it 'defaults to seconds' do
      Time::Elapsed.time('3m3').should == 183
      Time::Elapsed.time('3').should == 3
    end
  end
end