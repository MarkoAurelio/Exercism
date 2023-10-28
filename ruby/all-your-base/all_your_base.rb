class BaseConverter
    class << self
        def convert(input_base, digits, output_base)
            raise ArgumentError if  input_base < 2 || 
                                    output_base < 2 || 
                                    digits.any?(&:negative?) || 
                                    digits.any? { |digit| digit >= input_base }

            return [0] if digits.empty? || digits.all?(0)
            
            decimal_value = 0
            digits.each { |digit| decimal_value = decimal_value * input_base + digit }
            converted = []

            while decimal_value > 0
              remainder = decimal_value % output_base
              converted.unshift(remainder)
              decimal_value /= output_base
            end
            
            converted
          end
    end
end
