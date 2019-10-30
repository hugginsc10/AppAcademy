require 'benchmark'
require 'io/console'
class SortingDemo
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

#def lcs(list)
#    subsums = []
#    (0...list.length).each do |start_idx|
#
#        ((start_idx + 1)...list.length).each do |end_idx|
#            subsums << list[start_idx..end_idx]
#
#        end
#    end
#    subsums.map(&:sum).max 
#end
#
#list = [2, 3, -6, 7, -6, 7]
#p lcs(list) # => 8 (from [7, -6, 7])

# Kadane's Algo(Maximum Sub Array - only returning max_current)
def self.lcs(list)
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

def self.largest_contiguous_subsum(list) 
    max_sum = list.first 
    current_sum = list.first
    low_end = list.first
    (1..list.length-1).each do |i|
        current_sum += list[i]
        max_sum = current_sum if max_sum < current_sum
        low_end = list[i] if list[i] > low_end
        current_sum = 0 if current_sum < 0 
    end 
    return max_sum if  max_sum > low_end
    
    low_end
end 
  def self.performance_test(size, count)
      arrays_to_test = Array.new(count) { random_arr(size) }

      Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                          "Avg. Kadanes:  ", "Avg. Daniel: ") do |b|
        kadanes = b.report("Tot. Kadanes:  ") { run_lcs(arrays_to_test) }
        daniel = b.report("Tot. Daniel ") { run_largest_contiguous_subsum(arrays_to_test) }
        [kadanes/count, daniel/count]
      end
  end
  def self.random_arr(n)
    Array.new(n) { rand(n) }
  end
  def self.run_lcs(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      lcs(array_to_test)
    end
  end
  def self.run_largest_contiguous_subsum(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      largest_contiguous_subsum(array_to_test)
    end
  end
  def self.run_performance_tests(multiplier = 5, rounds = 3)
      [1, 10, 100, 1000, 10000].each do |size|
        size *= multiplier
        wait_for_keypress(
          "Press any key to benchmark sorts for #{size} elements"
        )
        performance_test(size, rounds)
      end
  end
  

  def self.wait_for_keypress(prompt)
    puts prompt
    STDIN.getch
  end
end
SortingDemo.run_performance_tests()