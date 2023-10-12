class Isogram
    class << self
        def isogram?(input)
            input = input.downcase.gsub(/[-\s]/, '')
            input.chars.uniq == input.chars
        end

        # def isogram?(input)
        #     letters = input.downcase.scan(/\w/)
        #     letters == letters.uniq
        # end
    end
end

