# encoding: utf-8

require_relative '../../../../lib/bluebook/abbreviation/cases.rb'

describe Bluebook::Abbreviation do
  specify {
    subject.table_6(
      'Alternative Brotherhood of Southern Railway Trustees'
    ).should == 'Alt. Bhd. of S. Ry. Trs.'
  }

  specify {
    subject.table_6(
      'alternative brotherhood of southern railway trustees'
    ).should == 'Alt. Bhd. of S. Ry. Trs.'
  }
end
