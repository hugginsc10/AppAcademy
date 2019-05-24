def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    return 1 if n == 1
    n + sum_to(n - 1)
end

p sum_to(9)

def add_numbers(array)
    return 0 if array.empty?
    array[0] + add_numbers(array[1..-1])
    
end

p add_numbers([1,2,3,4,5])


def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1
    (n - 1) * gamma_fnc(n - 1)
end

p gamma_fnc(4)

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..-1], favorite)

end
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')
def reverse(str)
    return "" if str.empty?
    reverse(str[1..-1]) + str[0]
end

p reverse("house")