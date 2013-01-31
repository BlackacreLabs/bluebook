# encoding: utf-8

require_relative '../../../../lib/bluebook/abbreviation/periodicals.rb'

describe Bluebook::Abbreviation do
  specify {
    subject.month('December').should == 'Dec.'
    subject.month(9).should == 'Sept.'
  }
end
