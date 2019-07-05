class Array

    def my_uniq
        my_h = Hash.new(0)
        self.each do |el|
            my_h[el] += 1
        end
        my_h.keys
        
    end

    def two_sum
        raise NoMethodError unless self.is_a?(Array)
        pairs = []
        self.each_index do |i|
            ((i + 1)...self.length).to_a.each do |j|
                pairs << [i,j] if self[i] + self[j] == 0
            end
        end
        pairs
    end
end
    
def my_transpose(array)
    raise RuntimeError unless array.length == array[0].length
    transposed = []
    array.length.times do |i|
        subarray = []
        array.each do |sub|
            subarray << sub[i]
        end
        transposed << subarray
    end
    transposed

end

