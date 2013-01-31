module Bluebook
  module Abbreviation
    MONTHS = [nil] +
      %w{Jan. Feb. Mar. Apr. May June July Aug. Sept. Oct. Nov. Dec.}

    def self.month(month)
      if month.is_a?(Fixnum)
        MONTHS[month]
      elsif Date::MONTHNAMES.include?(month)
        MONTHS[Date::MONTHNAMES.index(month)]
      else
        raise "Invalid month: #{month}"
      end
    end
  end
end
