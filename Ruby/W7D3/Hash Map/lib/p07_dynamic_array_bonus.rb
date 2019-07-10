class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i >= @count || (i + @count) < 0
    i += @count if i < 0
    @store[i]
  end

  def []=(i, val)
    raise IndexError if (i + @count) < 0
    i += @count if i < 0
    resize!(i * 2) if i > capacity
    @store[i] = val
    @count = i + 1 if i >= @count
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |x|
     return true if x == val
    end
    false
  end

  def push(val)
    resize! if @count == capacity
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    resize! if @count + 1 == capacity
    idx = @count - 1
    until idx < 0
      @store[idx + 1] = @store[idx]
      idx -= 1
    end
    @store[0] = val
    @count += 1

  end

  def pop
    return nil if @count == 0
    val = last
    @store[@count - 1] = nil
    @count -= 1
    val
  end

  def shift
    return nil if @count == 0
    val = first
    idx = 0
    while idx < @count - 1
      @store[idx] = @store[idx + 1]
      idx += 1
    end
    @count -= 1
    val
  end

  def first
    if @count == 0
      return nil
    else
      @store[0]
    end
  end

  def last
    if @count == 0
      return nil
    else
      @store[@count-1]
    end
  end

  def each(&prc)
    i = 0
    while i < @count
      prc.call(@store[i])
      i += 1
    end

  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!(cap = capacity * 2)
   
    store = @store
    @store = StaticArray.new(cap)
    i = 0
    while i < @count
      @store[idx] = store[idx]
      idx += 1
    end
  end
end
