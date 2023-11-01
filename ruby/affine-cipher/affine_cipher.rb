class Affine
    def initialize(keyA, keyB)
        raise ArgumentError unless coprime?(keyA)

        @keyA = keyA
        @keyB = keyB
    end

    def encode(text)
        text.
        downcase.
        scan(/[a-z0-9]/).
        map{ |c| encrypt(c) }.
        join.
        scan(/.{1,5}/).
        join(' ')
    end

    def decode(text)
        text.
        scan(/[a-z0-9]/).
        map{ |c| decrypt(c) }.
        join
    end

    private

    def encrypt(char)
        return char if char.match?(/[[:digit:]]/)

        y = char.ord - 'a'.ord
        ((((@keyA * y) + @keyB) % MOD) + 'a'.ord).chr
    end

    def decrypt(char)
        return char if char.match?(/[[:digit:]]/)

        y = char.ord - 'a'.ord
        (((mod_inverse(@keyA, MOD) * (y - @keyB)) % MOD) + 'a'.ord).chr
    end

    def coprime?(number)
        MOD.gcd(number) == 1
    end

    def mod_inverse(a, m)
        start_mod, prev, curr = m, 0, 1
      
        while a > 1
            a, m = m, a if a < m
            quotient, a = a.divmod(m)
            prev, curr = curr, prev - quotient * curr
        end
      
        curr += start_mod if curr.negative?
        curr
    end      

    MOD = ('a'..'z').to_a.size
end