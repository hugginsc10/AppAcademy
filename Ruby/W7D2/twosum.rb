def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        ((i + 1)...arr.length).each do |j|
            if arr[i] + arr[j] == target_sum
                return true
            end
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
   arr.each_with_index do |i,j|
        key = target_sum - i
            if x = arr.bsearch_index{|y| key <=> y}
                return true unless j == x
            end
    end
    false
    
end
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# def two_sum?(arr, target)
#     search = {}
#     arr.each_with_index do |num, i|
#         ans = [search[target-num], i]
#         unless search[target-num].nil?
#             return true if ans.length == 2
           
#         end
#         search[num] = i

#     end
#     return false
# end

def two_sum?(arr, target)
   hash = Hash.new
    arr.each_with_index do |num, i|
        return true if hash[num]
        hash[target - num] = i
    end
    return false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false