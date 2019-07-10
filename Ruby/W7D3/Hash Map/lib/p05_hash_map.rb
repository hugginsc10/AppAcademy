require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    
    resize! if @count >= num_buckets
    if include?(key)
      bucket(key).update(key,val)
    else
      @count += 1
      bucket(key).append(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    removed = bucket(key).remove(key)
    self.count -= 1 if removed
    removed
  end

  def each
    @store.each do |bucket|
      bucket.each {|node| yield [node.key, node.val]}
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) {LinkedList.new}
    store.each do |bucket|
      bucket.each {|node| set(node.key, node.val)}
    end
  end

  def bucket(key)
    self.store[key.hash % num_buckets]
  end
end
