def process_guess
    guess = valid_guess
    i, j = guess
    @board[i, j].reveal
    @guessed_pos << guess
end
def hide_pair
    i1, j1 = @guessed_pos[0]
    i2, j2 = @guessed_pos[1]
    @board[i1, j1].hide
    @board[i2, j2].hide
end

def match?(guess_pair)
    i1, j1 = guessed_pos[0]
    i2, j2 = guessed_pos[1]
    self[i1, j1].value == self[i2, j2].value
end

def valid_guess
    i, j = @player.make_guess
    while @board[i, j].face_up
      puts 'Please choose a card that is face down'
      i, j = @player.guess
    end
    [i, j]
end
def turn
    @guessed_pos = []
    show_guess
    puts
    show_guess
    process_guess_pair
    pause
end
def show_guess
    process_guess
    clear_screen
    @board.render
end
def process_guess_pair
    puts
    if pair_match?
      puts "You've got a match!"
    else
      puts "Better luck next time!"
      hide_pair
    end
end