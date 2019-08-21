import Game from './components/Game';
import ReactDOM from 'react-dom';
import Tile from './components/Tile';
import React from 'react';
document.addEventListener("DOMContentLoaded", () => {
    // debugger
    ReactDOM.render( <Game />, document.getElementById('main')
    );
});