class Luhn
    class << self

        def valid?(digits)
            @digits = digits.delete(' ').chars.reverse
            return false if @digits.size <= 1 || @digits.any?(/[^0-9]/)

            (@digits
                .map(&:to_i)
                .each_with_index
                .map { |n, i| i.odd? ? n * 2 : n }
                .map { |n| n > 9 ? n - 9 : n }
                .sum % 10).zero?
        end
    end
end
