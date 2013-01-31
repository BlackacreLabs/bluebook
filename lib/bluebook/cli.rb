require 'thor'

module Bluebook
  class CLI < Thor
    desc 't6', 'abbreviate a string per Table 6'
    def t6(input=STDIN)
      input = input.read if input.is_a?(IO)
      require_relative 'abbreviation/cases'
      STDOUT.write(Bluebook::Abbreviation.table_6(input))
    end

    desc 't10', 'abbreviate a string per Table 10'
    def t10(input=STDIN)
      input = input.read if input.is_a?(IO)
      require_relative 'abbreviation/geography'
      STDOUT.write(Bluebook::Abbreviation.table_10(input))
    end

    desc 'date', 'format a date for a citation parenthetical'
    def date(input=STDIN)
      input = input.read if input.is_a?(IO)
      require_relative 'date_patch'
      STDOUT.write(Date.parse(input).to_bluebook)
    end
  end
end
