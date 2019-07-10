
require "byebug"

class Integer

  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, idx|
      sum += el.hash * idx.hash
    end
    sum
  end
end

class String
  def hash
    #ord() returns interger orginal of a one-character string
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
