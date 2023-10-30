class BeerSong
    class << self
      def recite(bottles, verses)
        lyrics = ''
        @bottles = bottles
        while verses > 0
          lyrics << "#{bottle_text.capitalize} of beer on the wall, #{bottle_text} of beer.\n#{action_text}"
          @bottles -= 1
          lyrics << ", #{bottle_text} of beer on the wall.\n\n"
          verses -= 1
        end
        lyrics.chomp
      end
  
      private
  
        def bottle_text
            case @bottles
            when -1
                "99 bottles"
            when 0
                "no more bottles"
            when 1
                "#{@bottles} bottle"
            else
                "#{@bottles} bottles"
            end
        end
  
      def action_text
        case @bottles
        when 0
          "Go to the store and buy some more"
        when 1
          "Take it down and pass it around"
        else
          "Take one down and pass it around"
        end
      end
    end
  end
  