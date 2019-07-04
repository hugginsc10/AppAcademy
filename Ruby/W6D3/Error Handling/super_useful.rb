def convert_to_int(str)

  begin
    p "The input is #{str}"
    Integer(str)
  rescue TypeError => e
    p "I got one Type Error, that's not cool"
    return nil

  rescue ArgumentError => e
    p "I got one Argument Error, that's not cool"
    return nil
  end

end

# p convert_to_int(nil)
# p convert_to_int("12.34")
# p convert_to_int("123")
# p convert_to_int(1234)
# p convert_to_int(:Q12)
# p convert_to_int([1])
# p convert_to_int("qwer")

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
    puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue
    p "THATS NOT A FRUIT!!"
    retry if maybe_fruit == "coffee"
  end
end  

# p feed_me_a_fruit


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Thats not a name!" unless name.is_a?(String) && name.length > 0
    raise "Thats too short to be best friends" unless yrs_known.is_a?(Integer) && yrs_known >= 5
    raise "Thats not a pastime" unless fav_pastime.is_a?(String) && fav_pastime.length != 0

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end