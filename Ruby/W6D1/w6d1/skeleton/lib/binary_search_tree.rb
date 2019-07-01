class Node
    
    attr_accessor :left, :right, :value
    def initialize(value = nil)
        @value = value
        @left = nil
        @right = nil
    end

end

class BinarySearchTree
    attr_accessor :root, :value
    def initialize(value)
        @root = Node.new(value)
    end
    def insert(value)
        current = @root
        while nil != current
            if (value < current.value) && (current.left == nil)
                current.left = Node.new(value)
            elsif (value > current.value) && current.right == nil
                current.right = Node.new(value)
            elsif value < current.value
                current = current.left
            else value > current.value
                current = current.right
            end
        end

    end
   
    def search_bst(value, node = @root)
        if value == node.value
            return node
        elsif value < node.value
            search_bst(value, node.left)
        else
            search_bst(value, node.right)
        end
    end
end
bst = BinarySearchTree.new(20)
bst.insert(18)
bst.insert(15)
bst.insert(19)
bst.insert(28)
bst.insert(25)
p bst.search_bst(28)
