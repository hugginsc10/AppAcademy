  
require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
name = ""
time = 0
fav = ""
begin
    sam = BestFriend.new(name, time, fav)

    sam.talk_about_friendship
    sam.do_friendstuff
    sam.give_friendship_bracelet
rescue => e
    p e
    p "input your bestie's name"
    name = gets.chomp
    p "input how long have you been friends"
    time = convert_to_int(gets.chomp)
    p "input your favorite past-time"
    fav = gets.chomp

    retry
end