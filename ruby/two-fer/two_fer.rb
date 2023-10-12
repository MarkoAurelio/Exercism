class TwoFer

    def self.two_fer(friend_name = "you")
        return "One for you, one for me." if friend_name.nil?
        "One for #{friend_name}, one for me."
    end
end
