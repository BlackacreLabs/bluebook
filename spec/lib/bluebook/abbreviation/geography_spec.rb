require_relative '../../../../lib/bluebook/abbreviation/geography'

describe Bluebook::Abbreviation do
  context 'United States' do
    context 'states' do
      specify { subject.state('Texas').should == 'Tex.' }
    end

    context 'territories' do
      specify { subject.territory('Puerto Rico').should == 'P.R.' }
      specify { subject.territory('Little Guam').should == 'Little Guam' }
    end

    context 'cities' do
      specify { subject.city('San Francisco').should == 'S.F.' }
      specify { subject.city('Montgomery').should == 'Montgomery' }
    end
  end

  context 'Australia' do
    specify { subject.australia('Tasmania').should == 'Tas.' }
  end

  context 'Canada' do
    specify { subject.canada('Manitoba').should == 'Man.' }
  end

  context 'countries and regions ' do
    specify { subject.country('Bermuda').should == 'Berm.' }
    specify { subject.country('Africa').should == 'Afr.' }
  end
end
