class Scale
  attr_reader :chromatic

  S_TONE = %w[C G D A E B F# a e b f# c# g# d#]
  SHARP = %w[C C# D D# E F F# G G# A A# B]

  F_TONE = %w[F Bb Eb Ab Db Gb d g c f bb eb]
  FLAT = %w[C Db D Eb E F Gb G Ab A Bb B]
  
  def initialize(tone)
    @tone = tone
    @signature = S_TONE.include?(@tone) ? SHARP : FLAT
    @start = @signature.index(@tone.capitalize)
    @chromatic = @start == 0 ? @signature : @signature[@start..-1] + @signature[0..@start-1]
  end

  def interval(inv)
    result = [@signature[@start]]
    index = @start
    inv.each_char do |char|
      increment = case char 
                  when 'M' 
                      2
                  when 'm'
                      1
                  when 'A'
                      3
                  end
      index += increment
      index = index - 12 if index > 11
      result << @signature[index]
    end
    result
  end
end