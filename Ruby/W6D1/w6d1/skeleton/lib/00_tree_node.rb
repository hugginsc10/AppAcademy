class PolyTreeNode
   attr_reader :parent, :children
   attr_accessor :value
    def initialize(value, parent = nil)
        @value = value
        @parent = parent
        @children = []
    end
    def parent=(node)
        if @parent
            @parent.children.delete(self)
        end
        @parent = node
        return @parent unless @parent
        parent_child = node.children
        parent_child << self unless parent_child.include?(self)
        
    end
    def add_child(node)
        node.parent = self
    end
    def remove_child(node)
        node.parent = nil
        raise "Node is not a child" unless self.children.include?(node)
    end

    def dfs(target)
        if self.value == target
            return self
        else
            self.children.each do |child|
                value = child.dfs(target)
                return value if value
            end
        end
        nil
    end
    def bfs(target)
        queue = [self]
        until queue.empty?
            value = queue.shift
            if value.value == target
                return value
            end
            queue.concat(value.children)
        end
        nil


    end
    def inspect
        @value.inspect
    end
end