require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_node!(key)
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    squared = @prc.call(key)
    @map[key] = @store.append(key, squared)
    eject! if count > @max
    squared
  end

  def update_node!(node)
    @store.remove(node)    
    @map[node] = @store.append(node, @map.get(node))
  end

  def eject!
    ejected = @store.first
    @store.remove(ejected.key)
    @map.delete(ejected.key)
  end
end
