class Sieve
    attr_reader :primes

    def initialize(number)
        @number = number
        @primes = retrieve_primes
    end

    private

    def retrieve_primes
        primes = []
        list = (2..@number).to_a
        until list.empty?
            primes << list[0]
            list = list.select { |n| (n % list[0]).nonzero?}
        end
        primes
    end
end