class Scrabble
    attr_reader :score

    def initialize(str)
        @score = sum_letters(str.upcase)
    end

    private

    def sum_letters(str)
        sum = 0
        str.each_char do | char |
            LETTER_POINTS.each do |key, value|
                sum += key if value.include?(char)
            end
        end
        sum
    end

    LETTER_POINTS = {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D", "G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q", "Z"]
    }
end