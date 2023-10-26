class Pangram
    def self.pangram?(sentence)
        sentence.upcase.scan(/[A-Z]/).uniq.size == 26
    end
end