class Squares
    attr_reader :square_of_sum, :sum_of_squares, :difference

    def initialize(value)
        @square_of_sum = (1..value).sum ** 2
        @sum_of_squares = (1..value).map { |n| n**2 }.sum
        @difference = @square_of_sum - @sum_of_squares
    end
end