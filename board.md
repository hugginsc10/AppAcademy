class Array

    def merge_sort(&prc)
        return self if self.count <= 1
        prc ||= Proc.new {|a,b| a <=> b }
        middle = count / 2
        left = take(middle).merge_sort(&prc)
        right = drop(middle).merge_sort(&prc)

        merge(left, right, &prc)
    end

    def merge(left_side, right_side, &prc)
        is_merged = []

        until left_side.empty? || right_side.empty? 
            case prc.call(left_side.first, right_side.first)
            when -1
                is_merged << left_side.shift
            when 0
                is_merged << left_side.shift
            when 1
                is_merged << right_side.shift
            end
        end
        is_merged.concat(left_side).concat(right_side)
    end
end

def bsearch(arr, tar)

    return nil if arr.length == 0
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid + 1.. -1]
    return mid if arr[mid] == tar
    if arr[mid] > tar
        bsearch(left, tar)
    else
        memo = bsearch(right, tar)
        memo.nil? ? nil : mid +1  + memo
    end   
end

class Array
    def flatten(level = nil)
        new_arr = self.dup
        return new_arr if level == 0
        next = level ? level - 1 : nil
        self.each_with_index do |num, idx|
            new_arr[idx] = num.flatten(next) if num.is_a?(Array)
        end
        new_arr
    end
end

class Array

    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end

    def my_each_with_index(&blk)
        i = 0
        while i < self.length
            blk.call(self[i], i)
            i += 1
        end
        self
    end
end


class Array
    def my_inject(accumulator = nil, &blk)
        i = 0
        if accumulator.nil?
            accumulator = self.first
            i+=1
        end

        while i < length
            accumulator = blk.call(accumulator, self[i])
            i += 1
        end
        accumulator
    end

    def my_inject(accumulator = nil, &blk)
        accumulator ||= self.shift
        self.each { |el| accumulator = blk.call(accumulator, el) }
        accumulator
    end

    
end

class Array

    def dupes
        hash = Hash.new { |h, k| h[k] = [] }
        self.each_with_index { |el, idx| hash[el] << idx }
        hash.select { |k, v| v.length > 1 }
    end

end
##
"cats are cool".shuffled_sentence_detector("dogs are cool") => false
"cool cats are".shuffled_sentence_detector("cats are cool") => true
##
class String
    def shuffled(sentence)
        self.split(" ").sort == sentence.split(" ").sort
    end
end

def fac_rec(num)

    return [1] when num == 1
    factors = fac_rec(num - 1)
    factors << factors[-1] * (num - 1)
    factors
end

def fibs(n)
    return [0,1].take(n) if n <= 2
    first = fibs(n - 1)
    second = first[-1] + first[-2]
    first << second
    first
end

def digital_root(num)

    num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))

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
jumble_sort("hello") => "ehllo"
jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alpha = nil)

    alpha ||= ("a".."z").to_a
    sorted = ""
    alpha.each do |al|
        str.each_char { |el| sorted += el if al == el }
    end
    sorted
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
def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a
#
#   sorted_chars = str.chars.sort do |chr1, chr2|
#     alphabet.index(chr1) <=> alphabet.index(chr2)
#   end
#
#   sorted_chars.join
# end

# Monkey patch the array class quick sort method.
# The method should be able to accept a block.

class Array

  def my_quick_sort(&prc)
    left, right, pivot, prc = [], [], self[0], prc || Proc.new { |a, b| a <=> b }
    self[1..-1].each { |el| prc.call(pivot, el) == 1 ? right << el : left << el}
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in Array#sort method in your implementation. 
  def bubble_sort(&prc)
    prc ||=  Proc.new {|x,y| x <=> y}
    sorted = false
    when !sorted
        sorted = true
        (0...self.length-1).each do |i|
            if prc.call(self[i], self[i + 1] == 1)
                sorted = false
                self[i], self[i + 1] = self[i + 1], self[i]
            end
        end
        self
    end


  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    arr = self.dup
    arr.bubble_sort(&prc)
  end
end

# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"

def base_converter(num, b)

end

class Array

  def my_rotate(positions = 1)

    return self if position  == 0
    if positions > 1
        positions.times do |i|
            ele = self.shift
            self << ele
        end
    else
        position.abs.times do |i|
            ele = self.pop
            self.unshift(ele)
        end
    end
    self 

  end
end

def fibb_iter(n)
(1..n).inject( [0, 1] ) { | num | num << num.last(2).inject(:+) }
end 

def exp_two(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even? 
       exp_two(b, n / 2) * exp_two(b, n / 2)
    else
        b * exp_two(b, (n-1) / 2) * b
    end
end

# Write a method that translates a sentence into pig latin. You may want a helper method.

## Rules
# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'ay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'
# - 'qu' counts as a consonant (see third example)

## Examples
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'

def pig_latinify(sentence)
    words = sentence.split(" ").map do |word|
        translate(word)
    end

    words.join(" ")
end

def translate(word)
    vowels = ["a", "e","i","o","u"]
    if vowels.include?(word[0])
        word + "ay"
    else
        word.each_char.with_index do |char, idx|
           if vowels.include?(word[idx]) && !"q".include?(word[idx - 1])
            part = word[0...idx]
            new = word[idx..-1] + part + "ay"
            new
        end
    end
end

def pig(sentence)
    sentence.split.map { |word| "aeiou".include?(word[0]) ? word + "ay" : word[find_index(word)..-1] + word[0...find_index(word)] + "ay" }.join(" ")
end

def find_index(word)
    word.each_char.with_index { |el, idx| return idx if "aeiou".include?(el) && word[idx - 1] != "q"}
end

# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
    return true if key.size == 0
    return false if key.length > string.length
# key_idx = string.index
    string[0] == key[0] ? string_include_key?(string[1..-1], key[1..-1]) : string_include_key?(string[1..-1], key)


end