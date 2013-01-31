require_relative '../../../lib/bluebook/courts/federal.rb'

describe Bluebook::Courts::Federal do
  specify {
    subject::CIRCUIT_COURTS_OF_APPEALS.compact.count.should == 12
  }

  specify {
    subject::CIRCUIT_COURTS_OF_APPEALS[1].should ==
      'United States Court of Appeals for the First Circuit'
  }
end
