require 'time'

class Time
  # @param [String] time_str time string to be added
  def plus(time_str)
    self + Elapsed.time(time_str)
  end
  # @param [String] time_str time string to be subtracted
  def minus(time_str)
    self - Elapsed.time(time_str)
  end

  module Elapsed
    # @param [String] time_str time string to be parsed
    # @return [Fixnum] time_str in seconds
    def self.time(time_str)
      not_zero Parser.parse_time_str(time_str)
    end

    private
    # Allows number Strings or Fixnums
    # Raise ArgumentError unless the number is not zero
    #  always returns Integer
    def self.not_zero(i)
      i_dup = i.to_i #not really a dup since Fixnum is immutable
      if i_dup.zero?
        raise ArgumentError, 'Elapsed time not parsable'
      else
        return i_dup
      end
    end
  end

end

require File.expand_path('../elapsed/version.rb', __FILE__)
require File.expand_path('../elapsed/parser/parser.rb', __FILE__)
