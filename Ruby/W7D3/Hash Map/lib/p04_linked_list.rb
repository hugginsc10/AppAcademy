class Node
  #attr_reader :key
  attr_accessor :val, :next, :prev, :key

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |el|
    return el.val if el.key == key
   end
   nil
  end

  def include?(key)
    self.any? do |node|
      node.key == key
    end
  end

  def append(key, val)
    new_node = Node.new(key, val)

    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
    new_node
  end

  def update(key, val)
    self.each do |el|
     if el.key == key
      el.val = val
      return el
     end
    end
  end

  def remove(key)
    self.each do |el|
      if el.key == key
        el.prev.next = el.next
        el.next.prev = el.prev
        return el.val
      end
    end
    nil
  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
