# encoding: utf-8

require_relative '../../../../lib/bluebook/abbreviation/periodicals.rb'

describe Bluebook::Abbreviation do
  {
    'American Journal of African Bankruptcy' => 'Am. J. Afr. Bankr.',
    'New York Times' => 'N.Y. Times',
    'Texas Law Review' => 'Tex. L. Rev.',
    'Bermuda Law Journal' => 'Berm. L.J.',
    'N.Y.U. Law Review' => 'N.Y.U. L. Rev.',
    'N.Y.U. Law Journal' => 'N.Y.U. L.J.',
    'Of Bankruptcy' => 'Bankruptcy'
  }.each do |long, abbreviated|
    specify { subject.periodical(long).should == abbreviated }
  end
end
