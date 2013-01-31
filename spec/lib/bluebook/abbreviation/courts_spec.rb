# encoding: utf-8

require_relative '../../../../lib/bluebook/abbreviation/courts'

describe Bluebook::Abbreviation do
  {
    'Northern District of Illinois' => 'N.D. Ill.',
    'Pennsylvania Superior Court' => 'Pa. Super. Ct.',
    'Fifth Circuit' => '5th Cir.'
  }.each do |input, expected|
    specify {
      subject.federal_court(input).should == expected
    }
  end
end
