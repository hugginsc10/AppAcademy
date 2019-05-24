class Board
    attr_reader :grid

    def initialize(grid = self.empty_grid)
        @grid = grid 
    end
    def self.empty_grid 
        Array.new(9) do
            Array.new(9) {Tile.new(0)}
        end
    end
    def self.from_file(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split("").map {|char| Integer(char)}
            nums.map {|n| Tile.new(n)}
        end
        self.new(tiles)

    end

    def [](position)
        x, y = position
        grid[x][y]
    end

    def []=(position, value)
        x, y = position
        tile = grid[x][y]
        tile.value = value
    end

    def rows
        grid
    end

    def columns
        rows.transpose
    end

    def render
        puts "  #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
    end
    def size
        grid.size
    end

    def solved?
        rows.all? {|row| solved_set?(row)} && 
        columns.all? {|col| solved_set?(col)} &&
        squares.all? {|square| solved_set?(square)}
    end

    def solved_set?(tiles)
       nums = tiles.map(&:value)
       nums.sort == (1..9).to_a
    end
    def square(idx)
        tiles = []
        x = (idx / 3) * 3
        y = (idx % 3) * 3

        (x...x + 3).each do |i|
            (y...y + 3).each do |j|
                tiles << self[[i, j]]
            end
        end

        tiles
    end
    def squares
        (0..8).to_a.map { |i| square(i) }
    end

    def dup
        duped_grid = grid.map do |row|
          row.map { |tile| Tile.new(tile.value) }
        end

        Board.new(duped_grid)
    end
end