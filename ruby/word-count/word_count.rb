class Phrase
    attr_reader :word_count

    def initialize(sentence)
        @sentence = sentence.downcase.scan(/\b[\w']+\b/)
        @word_count = @sentence.group_by(&:itself).transform_values(&:count)
    end
end