class Triangle
    def initialize(lengths)
        @lengths = lengths.sort
    end

    def equilateral?
        valid_triangle? && @lengths.uniq.size == 1
    end

    def isosceles?
        valid_triangle? && @lengths.uniq.size < 3
    end

    def scalene?
        valid_triangle? && @lengths.uniq.size == 3
    end

    private 

    def valid_triangle?
        @lengths.all?(&:positive?) && @lengths.take(2).sum >= @lengths[2]
    end
end
