class Prime
    class << self
        def nth(n)
            raise ArgumentError unless n > 0

            primes = []
            number = 2

            until primes.size == n
                number += 1 until prime?(number)
                primes << number
                number += 1
            end

            primes.last
        end

        private

        def prime?(number)
            (2..Math.sqrt(number).to_i).each { |n| return false until (number % n).nonzero? }
        end
    end
end

