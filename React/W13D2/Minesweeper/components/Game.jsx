
import React from 'react';
import * as Minesweeper from './minesweeper';
import Board from './Board'

class Game extends React.Component{
    // debugger
  constructor(props) {
  super(props);
  this.state = { board: new Minesweeper.Board(9, 9) }
  this.updateGame = this.updateGame.bind(this)
  this.restartGame = this.restartGame.bind(this)
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState(
      {board: this.state.board}
    )
  }
  restartGame() {
    const board = new Minesweeper.Board(9,9);
    this.setState({board: board});
  }


  render() {
    let modal;
    if (this.state.board.lost() || this.state.board.won()) {
     const text = this.state.board.lost() ? "You lost!" : "You Won!"
    
    modal = <div className="modal-background">
      <div className="modal-content">
         <p>{text}</p>
         <button onClick={this.restartGame}>Play Again!</button>
      </div>

      </div>
    }
    return (
    <div>
      {modal}
      <Board board={this.state.board} updateGame={this.updateGame}/>
    </div>
    );
  }
}
export default Game;