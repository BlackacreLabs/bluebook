require_relative '../../../lib/bluebook/date_patch'

describe Bluebook do
  it 'adds a Date extension' do
    Date.parse('2012-09-13').to_bluebook.should == 'Sept. 13, 2012'
  end
end
