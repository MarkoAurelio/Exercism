class Clock
    attr_accessor :to_s, :hour, :minute

    def initialize(hour: 0, minute: 0)
        @hour = (hour + (minute - minute % 60) / 60) % 24
        @minute = minute % 60

        @to_s = format('%02d:%02d', @hour, @minute)
    end

    def +(clock)
        Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
    end

    def -(clock)
        Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
    end

    def ==(clock)
        @to_s == clock.to_s
    end
end