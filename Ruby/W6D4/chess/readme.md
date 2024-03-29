# Chess
Write a chess game using object-oriented programming.

Please read all through the various phases before proceeding.

Review the Chess UML Diagram to get an overview of what you'll be creating. The diagram is beneficial for getting an idea of how different aspects of the project fit together; however, you should code your project by following the instructions closely and using the diagram as a reference for what methods we should create and what they should look like. It'll be helpful for clearing up any confusion about how classes inherit from or relate to one another.

You must split your program into multiple files. Use `require_relative` to load files. Make separate files for each class. Give files snake_case titles.

Don't forget to keep using Git. Look back at Minesweeper's instructions and read the Git portions again if you need a reminder.

# Learning Goals
Know when and why private methods are used
Be able to read UML and understand the benefits of UML
Be familiar with how to use the Singleton module
Know how to use modules
Know how class inheritance works
# Phase I: Board
Your Board class should hold a 2-dimensional array (an array of arrays). Each position in the board either holds a moving `Piece` or a `NullPiece` (`NullPiece` will inherit from `Piece`).

There are many different kinds of pieces in chess, and each moves a specific way. Based on their moves, they can be placed in four categories:

Sliding pieces (Bishop/Rook/Queen)
Stepping pieces (Knight/King)
Null pieces (occupy the 'empty' spaces)
Pawns (we'll do this class last)
To start off, you'll want to create an empty Piece class as a placeholder for now. Write code for `#initialize` so we can setup the board with instances of `Piece` in locations where a `Queen/Rook/Knight/` etc. will start and `nil` where the `NullPiece` will start.

The `Board` class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:

there is no `piece` at `start_pos` or
the piece cannot move to `end_pos`. Time to test! Open up pry and `load 'board.rb'`. Create an instance of `Board` and check out different positions with board[pos]. Do you get back `Piece` instances where you expect to? Test out `Board#move_piece(start_pos, end_pos)`, does it raise an error when there is no piece at the start? Does it successfully update the Board?
Once you get some of your pieces moving around the board, call over your TA for a code-review.

# Phase II: Pieces
Lets populate the `Piece` parent class that contains the functionality common to all pieces. A key method of `Piece` is `#moves`, which should return an array of places a `Piece` can move to. Of course, every piece will move differently, so you can't write (implement) the #moves method of Piece without subclasses.

NB You will not implement tricky moves like "en passant". Don't implement castling, draws, or pawn promotion either. You will handle check and check mate, however.

You should make modules for `Slideable` and `Stepable`. Accessing this on GitHub? Use this link. The Slideable module can implement `#moves`, but it needs to know what directions a piece can move in (diagonal, horizontally/vertically, both). Classes that include the module Slideable (Bishop/Rook/Queen) will need to implement a method #move_dirs, which #moves will use.

Your `Piece` will need to (1) track its position and (2) hold a reference to the `Board`. Classes that include Slideable in particular need the Board so they know to stop sliding when blocked by another piece. Don't allow a piece to move into a square already occupied by the same color piece, or to move a sliding piece past a piece that blocks it.

The `NullPiece` class should include `the singleton module`. It will not need a reference to the `Board` - in fact its `initialize` method should take no arguments. Make sure you have a way to read its `color` and `symbol`.

After completing each piece load the file in pry and make sure it moves properly. Once you have completed all pieces refactor your Board#initialize so that all your pieces are placed in their respective starting positions.

Time to test! Open up pry and `load 'board.rb'`. Create an instance of `Board` and check out different positions with `board[pos]`. Do you get back instances of the type of pieces you expect? Can you move the pieces around?

For now, do not worry if a move leaves a player in check.

Once you are finished with phases I & II head over to Part Two.