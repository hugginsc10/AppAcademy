class Maze
    POSITIONS = [[1,0], [0,1],[-1,0],[0,-1]]
    attr_reader :start, :end
    
    def initialize(file)
        @board = load_board(file)
        @start = start_pos
        @end = end_pos
    end

    def load_board(file)
        maze = []
        File.open(file).each_line do |line|
            chars = line.split(//)
            maze << chars
        end
        maze
    end

    def wall?(pos)
        x, y = pos
        @board[y][x] == "*"
    end
    
    def inside_maze?(pos)
        x, y = pos
        not_negative = (x >= 0) && (y >= 0)
        inside = (x <= @board[0].length) && (y <= @board.length)
        not_negative && inside
    end
    
    def start_pos
        find_char("S")
    end
    
    def end_pos
        find_char("E")
    end
    
    def find_char(char)
        @board.each_with_index do |line,  y|
            return [line.index(char), y] if line.index(char)
        end
    end

    def neighbors(pos)
        pos_x, pos_y = pos
        neighbors = []
        POSITIONS.each do |dist_x, dist_y|
            neighbor = [(dist_x + pos_x), (dist_y + pos_y)]
            if inside_maze?(neighbor) && (!wall?(neighbor))
                neighbors << neighbor
            end
        end
        neighbors
    end

    def dupe(n)
        unless n.class == Array
            n.dup
        else
            new_map = []
            n.each do |x|
                new_map << dupe(x)
            end
            new_map
        end
    end
    
    def travel(path)
        copy_board = dupe(@board)
        path.each do |pos|
            x, y = pos
            point = copy_board[x][y]
            if pos == "X"
                puts "this path backs up to #{x}, #{y}"
            elsif pos == "*"
                puts "this path hit a wall"
            else
                copy_board[y][x]
            end
        end
        travel(copy_board)
    end
end

class Solver
    def initialize(maze)
        @maze = maze
        reset
    end
    
    def find_distance(pos)
        pos_x, pos_y = pos
        end_x, end_y = @maze.end_pos
        ((pos_x - end_x) + (pos_y + end_y))

    end

    def estimate(pos)
        to_end = find_distance(pos)
        traveled = travel(pos).length
        to_end + traveled
    end

    def min_sum(queue)
         queue.inject do |chosen, current|
            old = estimate(chosen)
            newer = estimate(current)
            if old > newer
                return current
            else
                return chosen
            end
        end
    end
    def branching_paths(min = :min_sum)
        queue = [@current]
        visited = [@current]

        until queue.empty? || @current = @maze.end
            @current = self.send(min, queue)
            queue.delete(@current)
            visited << @current
            close = @maze.neighbors(@current)
            close.each do |neighbor|
            unless visited.include?(neighbor) || queue.include?(neighbor)
            queue << neighbor
            @branching_paths[neighbor] = @current
          end
        end
      end

      @branching_paths
    end
    def find(ending = @maze.end_pos)
        way = [ending]
        last_spot = ending
         until @branching_paths[last_spot].nil?
            way << @branching_paths[last_spot]
            last_spot = @branching_paths[last_spot]
         end
         way
        

    end
    def solve(min = :min_sum)
        branching_paths(min)
        way = find
        @maze.travel
    end

    def reset
        branching_paths = {}
        @current = @maze.start_pos
    end

if __FILE__ == $PROGRAM_NAME
  filename = "maze_board.txt"
  maze = Maze.new(filename)
  puts maze
  puts "Start is at #{maze.start_pos}"
  puts "End is at #{maze.end_pos}"
  solver = Maze::Solver.new(maze)
  solver.solve
end


    

