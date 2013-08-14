class Time
  module Elapsed

    module Parser
      LAST_REGEX = /
        ((?<years>[\d]+)y)?
        ((?<weeks>[\d]+)w)?
        ((?<days>[\d]+)d)?
        ((?<hours>[\d]+)h)?
        ((?<minutes>[\d]+)m)?
        ((?<seconds>[\d]+)s?)? #Defaults to seconds
      /ix

      TIME_TO_SECONDS = { 
        'years' => 31536000,
        'weeks' => 604800,
        'days' => 86400,
        'hours' => 3600,
        'minutes' => 60,
        'seconds' => 1
      }

      # @param [String] time_str User string to parse
      # @return [Fixnum] parsed time in seconds
      def self.parse_time_str(time_str, last_regex = LAST_REGEX)
        raise ArgumentError unless last_regex.is_a?(Regexp)
        keys = last_regex.names
        matches = time_str.gsub(/\s+/, '').scan(last_regex)
        ago_hash = matches.inject({}) do |h, m|
            m.map!(&:to_i) #Expect zeros
            match_hash = Hash[*keys.zip(m).flatten]
            h.merge(match_hash){|k, old_v, new_v| [old_v, new_v].max }
          end
        ago_hash.merge(TIME_TO_SECONDS) do |k, base, multiplier|
          base*multiplier
        end.values.inject(&:+)
      end
    end

  end
end