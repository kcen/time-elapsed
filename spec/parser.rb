require 'time-elapsed'
describe Time::Elapsed::Parser do
  p = Time::Elapsed::Parser
  describe '.parse_time_str' do
    it 'should correctly parse test cases' do
      p.parse_time_str('32s').should == 32
      p.parse_time_str('5 minutes 4seconds').should == 304
      p.parse_time_str('6 weeks of vacation').should == 3628800
      p.parse_time_str('12 years ago').should == 378432000
      p.parse_time_str('12days 3 minutes and 6hrs2sec').should == 1058582
      p.parse_time_str('13minutes').should == 780
      p.parse_time_str('2 hours').should == 7200
      p.parse_time_str('13').should == 13
      p.parse_time_str('3 weeks 2days 4hrs 10minutes 2 secs').should == 2002202
    end

    it 'should return zero for no elapsed time and non-parsable garbage' do
      p.parse_time_str('afea').should == 0
      p.parse_time_str('0s').should == 0
      p.parse_time_str('0 weeks of vacation').should == 0
    end
  end
end

