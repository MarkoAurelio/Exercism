class Year
    class << self
        def leap?(year)
            year.modulo(4).zero? unless year.modulo(100).zero? && year.modulo(400).nonzero?
        end
    end
end