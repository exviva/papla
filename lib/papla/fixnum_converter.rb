module Papla
  class FixnumConverter
    def convert(number)
      validate!(number)

      if number.zero?
        spell_zero
      else
        groups = group(number)
        groups_as_words = convert_groups(groups)
        groups_as_words.flatten.join(' ')
      end.capitalize
    end

    private

    def validate!(number)
      max = 999_999_999
      raise ArgumentError, "#{number} is too big, only numbers up to #{max} are supported" if number > max
    end

    def group(number)
      groups = []

      while number > 0
        number, group = number.divmod(1000)
        groups.unshift(group)
      end

      groups
    end

    def convert_groups(groups)
      bound = groups.count - 1
      result = []

      groups.each_with_index do |group, i|
        if group > 0
          result << convert_small_number(group)
          result << spell_rank(bound - i, group) if i < bound
        end
      end

      result
    end

    def convert_small_number(number)
      if number.zero?
        []
      elsif number < 20
        [spell_ones(number)]
      elsif number < 100
        tens, remainder = number.divmod(10)
        [spell_tens(tens), convert_small_number(remainder)]
      else
        hundreds, remainder = number.divmod(100)
        [spell_hundreds(hundreds), convert_small_number(remainder)]
      end
    end

    def backend
      @backend ||= Backend.new
    end

    def spell_zero;                backend.zero;                end
    def spell_ones(index);         backend.ones(index);         end
    def spell_tens(index);         backend.tens(index);         end
    def spell_hundreds(index);     backend.hundreds(index);     end
    def spell_rank(index, number); backend.rank(index, number); end
  end
end
