class Acronym
    class << self
        # First try
        # def abbreviate(phrase)
        #     acronym = ""
        #     phrase.split(/[ -]/).reject(&:empty?).each { |word| acronym << word[0].upcase }
        #     acronym
        # end

        # Cleaner way
        def abbreviate(phrase)
            phrase.scan(/\b\w/).join.upcase
        end
    end
end