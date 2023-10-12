class WordProblem
    def initialize(problem)
        @problem = problem[8..].gsub("by","").chop!
    end

    def answer
        tokens = @problem.split
        result = tokens.shift.to_i

        while tokens.any?
            operator = tokens.shift
            operand = tokens.shift.to_i

            case operator
            when "plus"
                result += operand
            when "minus"
                result -= operand
            when "multiplied"
                result *= operand
            when "divided"
                result /= operand
            else
                raise ArgumentError, "Invalid operator: #{operator}"
            end
        end
        result
    end
end