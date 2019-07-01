require_relative "00_tree_node"
class KnightPathFinder
    attr_reader :start_pos
    attr_accessor :considered_positions, :root_node
   MOVES = [
       [1,2],
       [1,-2],
       [-1,2],
       [-1,-2],
       [2,1],
       [2,-1],
       [-2,1],
       [-2,-1]
   ]
    def self.valid_moves(pos)
        valid_moves = []
        MOVES.each do |move|
            x, y = pos
            x2, y2 = move
            newxy = [(x + x2), (y + y2)]

            if (newxy).all? {|new_coord| new_coord < 8 && new_coord >= 0}
                valid_moves << newxy
            end
           
        end
        valid_moves
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        self.build_move_tree
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
        .select {|move| !@considered_positions.include?(move)}
        .each {|move| @considered_positions << move}
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        queue = [root_node]
        until queue.empty?
            current_node = queue.shift
            pos = current_node.value
            self.new_move_positions(pos).each do |move|
                new_node = PolyTreeNode.new(move)
                current_node.add_child(new_node)
                queue << new_node
            end
        end
    end
 
 
end


p KnightPathFinder.new([0,0])