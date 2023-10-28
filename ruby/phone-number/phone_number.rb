class PhoneNumber
    def self.clean(phone)
        phone = phone.scan(/[0-9]/).join.delete_prefix("1")
        return nil unless phone.size == 10 && ("2".."9").include?(phone[0]) && ("2".."9").include?(phone[3])
        phone
    end
end