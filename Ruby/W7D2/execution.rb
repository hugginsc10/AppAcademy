# O(n)
# def my_min(list)
#     least = list[0]
#     (0...list.length).each do |i|
#         if least > list[i]
#             least = list[i]
#         end

#     end
#     least
# end
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# O(n)
# def my_min(list)
#     list.inject { |least, num|  num < least ? num : least }
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def lcs(list)
    subsums = []
    (0...list.length).each do |start_idx|

        ((start_idx + 1)...list.length).each do |end_idx|
            subsums << list[start_idx..end_idx]

        end
    end
    subsums.map(&:sum).max 
end

list = [2, 3, -6, 7, -6, 7]
p lcs(list) # => 8 (from [7, -6, 7])

# Kadane's Algo(Maximum Sub Array - only returning max_current)
def lcs(list)
    max_ending, max_current = 0, 0
    cur_st, max_st, max_ed = 0, nil, nil

    list.each_with_index do |ele, i|
      if max_ending + ele < 0
        max_ending = 0
        cur_st = i + 1
      else
        max_ending = max_ending + ele
      end

      if max_current < max_ending
        max_current = max_ending

        max_st = cur_st
        max_ed = i
      end
    end
    max_current
end