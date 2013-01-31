require_relative 'abbreviation/dates'

class Date
  def to_bluebook
    abbrev = Bluebook::Abbreviation.month(month)
    "#{abbrev} #{day}, #{year}"
  end
end
