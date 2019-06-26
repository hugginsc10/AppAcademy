# Memory Puzzle
Today we're going to implement a simple command-line version of the classic Match 2 memory card game.

Here is a glimpse of what the final product will look like when you are done:

![memory game preview](https://assets.aaonline.io/fullstack/ruby/projects/memory/memory.gif)

## Learning Goals
Understand how classes interact in an object-oriented program
Be able to use require_relative
Be able to write the methods [] and []= and explain how they work
Develop a workflow that uses pry to test small parts of your code
Know how to initialize an Array with a default value
Know how to use duck typing to allow different classes to interact with your program
Write classes for Card, Board, and Game. Please put each class in its own file and use require_relative to include other files in your program.

## Card
A Card has two useful bits of information: its face value, and whether it is face-up or face-down. You'll want instance variables to keep track of this information. You'll also want a method to display information about the card: nothing when face-down, or its value when face-up. I also wrote `#hide`, `#reveal`, `#to_s`, and `#==` methods.

**Common problem:** Having issues with `#hide` and `#reveal?` Try testing small. Accessing this on GitHub? Use this link.

## Board
The Board is responsible for keeping track of all your Cards. You'll want a grid instance variable to contain Cards. Useful methods:

`#populate` should fill the board with a set of shuffled Card pairs
`#render` should print out a representation of the Board's current state
`#won?` should return true if all cards have been revealed.
`#reveal` should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).


## Game
The Game should have instance variable for the Board and the previously-guessed position (if any). It should also have methods for managing the Board-Player interaction. You may want a play loop that runs until the game is over. Inside the loop, you should render the board, prompt the player for input, and get a guessed pos. Pass this pos to a make_guess method, where you will handle the actual memory/matching logic. Some tips on implementing this:

If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
If the cards match, we should leave them both face-up.
Else, flip both cards face-down.
In either case, reset previous_guess.
It wouldn't be an interesting game if the player could see their previous moves. Run system("clear") before rendering the Board. This will hide any previous output from the player. sleep(n) will pause the program for n seconds. Use this method to (temporarily) show the player an incorrect guess before flipping the Cards face-down again.


Implement a simple command-line interface, allowing the user to determine the difficulty of the game (i.e., the size of the board). Do this before the Game is initialized. Remember if __FILE__ == $PROGRAM_NAME!
Enforce an upper limit on the number of turns played. If the limit is exceeded, the player loses.
Let's add a twist: start the game by placing a certain number of "bombs" instead of normal cards. When the game starts, show the bombs for 5 seconds or so; then hide them. If the player reveals a bomb, the game ends. (If you feel this is too harsh, perhaps you can implement "lives" or "hit points"). You might also want to determine the bomb count as a function of board size.
We've already got a working "Match 2" puzzle. What about a "Match 3" or "Match 4"? Generalize your code to work for any number of matching cards.