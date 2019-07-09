def windowed_max_range(arr, w)
    current_max_range = 0
    max_min = []
    
    arr.each.with_index do |el,i|
        window = arr[i...w + i]
        current = window.max - window.min
        if window.size == w && current > current_max_range
        current_max_range = current
        end
    end
    
    current_max_range
end

# def windowed_max_range(arr, w)
#     d, s = [],0
#     out = []
#     arr.each_index do |i|
#         d.pop while d[s] && arr[d[-1]] < arr[i]
#         d << i
#         s += 1 if d[s] == i - w
#         out << arr[d[s]] if i >= w - 1
#     end
#        out     
# end
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue
    
end

