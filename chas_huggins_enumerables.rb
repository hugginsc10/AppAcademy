require 'byebug'

class Array
    def my_each(&prc)
        return self if prc.nil?

        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        return self if prc.nil?

        selected = []

        self.my_each do |num|
            selected << num if prc.call(num)
        end

        selected
    end

    def my_reject(&prc)
        return self if prc.nil?

        rejected = []

        self.my_each do |num|
            rejected << num if !prc.call(num)
        end

        rejected
    end

    def my_any?(&prc)
        return self if prc.nil?

        self.my_each do |ele|
            if prc.call(ele)
                return true         
            end
        end

        return false
    end

    def my_all?(&prc)
        return self if prc.nil?

        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end

        return true
    end

    def my_flatten
        
        new_arr = []
      
        self.each do |n|
            if n.is_a?(Array)
                new_arr.concat(n.my_flatten)
            else
                new_arr << n
            end

        end

        new_arr
    end


    def my_zip(*arrays)

        new_arr = []

       self.length.times do |i|
            subzip = [self[i]]

            array.my_each do |array|
                subzip < array[i]
            end
            new_arr << subzip
        end
        new_arr 
    end

    def my_rotate(num = 1)
        n = self.length
        new_arr = []

        n.times do |i|
            new_idx = (i + num) % self.length
            new_arr << self[new_idx]
        end

        new_arr
    end

    def my_join(str = "")

        new_str = ""
        self.each do |ele|
            new_str += (ele + str)
        end

        if str != ""
            new_str.slice(0, new_str.length-1)
        else
            new_str
        end

    end

    def my_reverse
        reversed = []

        i = -1
        self.each do |ele|
            reversed << self[i]
            i -= 1
        end
        reversed
    end
    
end



def factors(num)
    (1..num).select {|factor| num % factor == 0}
end
class Array
    def bubble_sort!(&prc)
        prc ||= Proc.new {|x,y| x <=> y}
        sorted = false

        while !sorted
            sorted = true
            (0...self.length-1).map do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i+1] =  self[i+1], self[i]
                end
            end
            
        end
        self

    end
end


def bubble_sort(array, &prc)
    prc ||= Proc.new {|x,y| x <=> y}
    sorted = false

    while !sorted
        sorted = true
        (0...array.length-1).each do |i|
            if prc.call(array[i], array[i + 1]) == 1
                sorted = false
                array[i], array[i+1] =  array[i+1], array[i]
            end
        end
        
    end
    array

end



def substrings(string)
    subs=  []
    (0..string.length - 1).each do |i|
        (i..string.length).each do |i2|
            if i2> i
                sub = string[i..i2]
                subs << sub
            end
        end
    end

    subs


end


def subwords(word, dictionary)
    words = []
    substrings = substrings(word)
    substrings.select do |sub|
        
       if dictionary.include?(sub)
            words << sub
       end
    end
    words
end

p subwords("asdfcatqwer", ["cat", "car"])

