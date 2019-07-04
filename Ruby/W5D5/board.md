## Binary Search
<!-- Write a method that binary searches an array for a target and returns its
index if found. Assume a sorted array.

NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
We will not give you points if you visit every element in the array every time
you search.

For example, given the array [1, 2, 3, 4], you should NOT be checking
1 first, then 2, then 3, then 4. -->

def binary_search(arr, target)
    mid = arr.length / 2
    return nil if arr.empty?
    
    case target <=> arr[mid]
    when -1
        binary_search([0...mid], target)
    when 0
        mid
    when 1
        sright = binary_search([(mid + 1)..-1], target)
        sright.nil? ? nil : sright + mid + 1
    end

end


<!-- p binary_search([1,2,3,4,6,7], 4) 3 -->



## merge sort
class Array 
    def merge_sort(&prc)
        return self if self.length <= 1
        mid = self.length / 2
        prc ||= Proc.new {|i, j| i <=> j}
        sortl = self.take(mid).merge_sort(&prc)
        sortr = self.take(mid).merge_sort(&prc)
        Array.merge(sortl, sortr, &prc)
    end

    def self.merge(left, right, &prc)
        is_merged = []
        until left.empty? || right.empty?
            case prc.call(left.first <=> right.first)
            when -1
            is_merged << left.shift
            when 0
            is_merged << left.shift
            when 1
            is_merged << right.shift
            end
        end
        is_merged.concat(left).concat(right)
    end 
end


## my_each
<!-- Write a method that calls a passed block for each element of the array -->
class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end
## My_Flatten
    def my_flatten(lvl = nil)
        dupe = self.dup
        if lvl == 0
            return dupe
        en
        next_lvl = lvl ? lvl - 1 : nil

        self.my_each.with_index do |num, i|
            dupe[idx] = num.my_flatten(next_lvl) if num.is_a?(Array)
        end
        dupe
    end



<!-- # Without an argument:
[["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

# When given 1 as an argument:
# (Flattens the first level of nested arrays but no deeper)
[["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]] -->

## Dups
<!-- Write an array method that returns a hash where the keys are any element that appears in the array more than once, and the values are sorted arrays of indices for those elements. -->
    def dups
        sorted = self.sort
        hash = Hash.new(|h,k| h[k] = [])
        sorted.each_with_index{|num, idx| hash[num] << idx}
        hash.select {|k,v| v.length > 1}
    end
end
[1,1,2,2,3,4,5].dups {1 => [0,1], 2 => [2,3]}

<!-- Write an array method that calls the given block on each element and
combines each result one-by-one with a given accumulator. If no accumulator is given, the first element is used. -->

def my_reduce(accumulator = nil, &blk)
    accumulator ||= self.shift
    self.each {|num| accumulator = blk.call(accumulator, num)}
    accumulator

    i = 0
    if accumulator.nil?
        accumulator = self.first
    end
    while i < self.length
        accumulator = blk.call(accumulator, self[i])
        i += 1
    end
    accumulator
end

### Factorials

<!-- Write a method that recursively finds the first `n` factorial numbers
and returns them. N! is the product of the numbers 1 to N.
Be aware that the first factorial number is 0!, which is defined
to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc. -->

def factorials_rec(num)
    return [1] if num == 1 
    factor = factorials_rec(num - 1)
    factor << factor[-1] * (num - 1)
    factor
end


def factorial(n)
    reurn 1 if n == 0 
    return 1 if n == 1
    num * factorials_rec(num - 1)
end

class String

    def shuffled_sentence(string)
        self.split(" ").sort == string.split(" ").sort
    end
end

### Digital Root
<!-- 
Write a method, `digital_root(num)`. It should Sum the digits of a positive
integer. If it is greater than 10, sum the digits of the resulting number.
Keep repeating until there is only one digit in the result, called the
"digital root". **Do not use string conversion within your method.**

You may wish to use a helper function, `digital_root_step(num)` which performs one step of the process.    -->

def digital_root_step(num)
    root = 0
    while num > 0
        root += (num % 10)

        num /= 10
    end
    root
end

def digital_root(num)

    while num > 10
        num = digital_root_step(num)
    end
    num

end

num < 10 ? num : digital_root(digital_root(num/10) + (num%10))


end



<!-- digital_root(114) 6 -->

def fibs(n)
    return[0,1].take(n) if n <= 2

    first = fibs(n - 1)
    second = first[-1] + first[-2]
    first << second
    first
end

end

### Largest Prime Factor

Write a method that returns the largest prime factor of a number. We recommend writing a `is_prime?` helper method.

def largest prime factor(num)
    return num if is_prime?(num)
    num.down_to(2).each {|ele| return ele if is_prime(num) && num % ele == 0 }
end

def is prime?(n)
    return false if n > 2
    (2...num).none? {|ele| n % ele == 0}
end

def lpf(num)
    factor = nil
    i = 2
    while i < num
        factor = i if num % i == 0
        i += 1
    end
    factor
end

### Jumble Sort
<!-- 
Jumble sort takes a string and an alphabet. It returns a copy of the string
with the letters re-ordered according to their positions in the alphabet. If
no alphabet is passed in, it defaults to normal alphabetical order (a-z).

Example:

```rb
jumble_sort("hello") => "ehllo"
jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe' -->



def Jumble Sort(str < alpha = nil )
    alpha ||= ("a".."z").to_a
    array = []
    str.each_char {|leter| array << alpha.index(letter)}
    array.quick_sort.map{|ele| alpha[ele]}.join("")
end
class Array

def quick_sort(&prc)
    prc ||= Proc.new{|x,y| x <=> y}
    return self if self.size < 2

    pivot = self.first
    left = self[1..-1].select{|x| prc.call(x, pivot) == -1}
    right = self[1..-1].select{|x| prc.call(x, pivot) != -1}
    left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
    end
end



class Array

  def my_quick_sort(&prc)
    left, right, pivot, prc = [], [], self[0], prc || Proc.new { |a, b| a <=> b }
    self[1..-1].each { |el| prc.call(pivot, el) == 1 ? right << el : left << el}
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end

def jumble_sort(str, alphabet = nil)
   alphabet ||= ('a'..'z').to_a

   sorted_chars = str.chars.sort do |chr1, chr2|
     alphabet.index(chr1) <=> alphabet.index(chr2)
   end

   sorted_chars.join
 end



 def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a

  sorted = false
  until sorted
    sorted = true

    str.length.times do |i|
      break if i == (str.length - 1)
      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
    end
  end

  str
end