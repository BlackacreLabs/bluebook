require_relative '../../../lib/bluebook/abbreviation/geography'

describe Bluebook::Abbreviation do
  specify {
    subject.state('Texas').should == 'Tex.'
  }
end
