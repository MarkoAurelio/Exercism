class CollatzConjecture
    class << self
        def steps(n)
            raise ArgumentError if n <= 0
            
            steps = 0
            while n > 1 do
                n = n.even? ? n / 2 : n * 3 + 1
                steps += 1
            end
            steps
        end
    end
end