class ListOps
    class << self
        def arrays(array)
            count = 0
            array.each { |_| count += 1}
            count
        end

        def reverser(arr)
            reverse = [] 
            reverse << arr.pop until arr.empty?
            reverse
        end

        def concatter(arr1, arr2)
            arr1 << arr2.shift until arr2.empty?
            arr1
        end

        def mapper(arr)
            list = []
            arr.each {|item| list << yield(item)}
            list
        end

        def filterer(arr)
            list = []
            arr.each {|item| list << item if yield(item)}
            list
        end

        def sum_reducer(arr)
            sum = 0
            arr.each {|item| sum += item }
            sum
        end

        def factorial_reducer(arr)
            factorial = 1
            factorial *= arr.shift until arr.empty?
            factorial
        end
    end
end