str = "gizmo"
def first_anagram?(str)
    str.chars.permutation.to_a.map(&:join)
end
p first_anagram?("gizmo")


def second_anagram?(str1,str2)
    str2 = str2.chars
    str1 = str1.chars.each do |char|
        if !str2.index(char).nil?
            str2[str2.index(char)] = ""
        end
    end
    p str2
        
end
p second_anagram?("elvis", "lives")
p second_anagram?("gizmo", "sally")

def third_anagram?(str1, str2)
    str1.chars.sort.join == str2.chars.sort.join
end

p third_anagram?("elvis", "lives")
p third_anagram?("gizmo", "sally")

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)

    str1.chars.each {|el| count1[el] += 1}
    str2.chars.each {|el| count2[el] += 1}

    count1 == count2

end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")