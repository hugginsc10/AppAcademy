require 'byebug'
def range(start, e)
    return [] if e < start
    return start if start + 1 == e
    ranged = []
    ranged << start
    ranged << range(start + 1, e)
    ranged.flatten
end
range(1, 5) #=> [1,2,3,4]




def exp_one(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exp_one(b, n-1)


end
exp_one(5, 2)

def exp_two(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even? 
       exp_two(b, n / 2) * exp_two(b, n / 2)
    else
        b * exp_two(b, (n-1) / 2) * b
    end
end
exp_two(5,4)
class Array
    def deep_dup
        self.map {|x| x.dup}
        #new_arr = []
        #return array[0] if array.length <= 1 #["nuts", "bolts", "washers"] => [nuts], [bolts], [washers]
        #array.each do |sub|
        #    if sub.is_a?(Array) 
        #        sub.each do |el|
        #            el
        #        end
        #    end
        #end
        ##new_arr += array[0] + deep_dup(array[1..-1])
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = [["nuts", "bolts", "washers"],["capacitors", "resistors", "inductors"]].deep_dup
robot_parts_copy[1] << "LEDs"

robot_parts[1] # => ["capacitors", "resistors", "inductors"]
robot_parts_copy[1]

#[0, 1, 1, 2, 3, 5, 8, 13]
def fibb_recur(n)
    # fibb_arr = [0,1]
    # return [0] if n == 1
    # return [] if n == 0
    fibb_arr = [0, 1].take(n)
    return fibb_arr if n <= 2
    fibb = fibb_recur(n - 1)
    fibb << fibb[-2] + fibb[-1]


end
fibb_recur(5)

def fibb_iter(n)
(1..n).inject( [0, 1] ) { | num | num << num.last(2).inject(:+) }
end 
fibb_iter(3)

def bsearch(array, target)
     sorted = array.sort
     first_index = 0
     mid_index = (first_index + (sorted.length - 1)) / 2
     last_index = sorted.length - 1
    
    if sorted[mid_index] > target
        left_half = sorted[0..(mid_index - 1)]
        bsearchedl = bsearch(left_half, target)

    elsif sorted[mid_index] < target
        right_half = sorted[(mid_index + 1)..last_index]
        bsearchedr = bsearch(right_half, target)
        bsearchedr + mid_index + 1
    else
       return mid_index
    end
    
end



# p bsearch([1, 2, 3, 4, 5, 6], 6 ) #=>5<--- the index value in the sorted
# p bsearch([1, 2, 3, 4, 5, 6], 5 ) #=>4<--- the index value in the array
# p bsearch([1, 2, 3, 4, 5, 6], 4 ) #=>3<--- the index value in the array
# p bsearch([1, 2, 3, 4, 5, 6], 3 ) #=>2<--- the index value in the array
# p bsearch([1, 2, 3, 4, 5, 6], 2 ) #=>1<--- the index value in the array
# p bsearch([1, 2, 3, 4, 5, 6], 1 ) #=>0<--- the index value in the array

def merge_sort(array)
   return array if array.length <= 1
   middle = array.length / 2
   left = array[0...middle]
   right = array[middle...array.length]
   merge(merge_sort(left), merge_sort(right)) 

end

def merge(left, right) #([2,4,3], [1,5,6])
    sorted = [] 
    until left.empty? || right.empty?
       sorted << (left.first <= right.first ? left.shift : right.shift)
    end
    sorted + left + right
end

merge_sort([5,7,2,7,12,20,1,10,15,4])

def subsets(array)
    return [[]] if array.empty?
    subsets1 = subsets(array.drop(1)) #[3]
    subsets2 = []
    subsets1.each do |subs| 
        subsets2 << subs + [array.first]
    end
    subsets1 + subsets2
end
subsets([1, 2, 3])

class Array
    def permutations
        return [self] if length <= 1
        perms = []
        each {|n| (self - [n]).permutations.each {|p| perms << ([n] + p)} } 
        perms
    end
end


p [1,2,3].permutations

#permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                          #    [2, 1, 3], [2, 3, 1],
#                          #     [3, 1, 2], [3, 2, 1]]


def make_change(amt, coins = [25, 10, 5, 1])
    

end
