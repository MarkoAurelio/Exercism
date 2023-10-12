class Raindrops
    class << self

        def convert(number)
            *drops = number % 3, number % 5, number % 7
            return number.to_s unless drops.any?(0)
            
            "#{'Pling' if drops[0].zero?}#{'Plang' if drops[1].zero?}#{'Plong' if drops[2].zero?}"
        end
    end
end

