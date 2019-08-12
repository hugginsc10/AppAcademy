const Game = require('./game.js')

function GameView(ctx){
    this.currentGame = new Game();
};

GameView.prototype.start = function(){
    game = this.currentGame;
    context = this.ctx;
    this.bindKeyHandlers();
    setInterval(function() {
        game.draw(context);
        game.move(context);
    }, 100);
};
GameView.prototype.addKeyHandlers = function() {
    key('w', function() {
        game.ship.power([0,1]);
    });
    key('a', function() {
        game.ship.power([-1, 0]);
    });
    key('s', function() {
        game.ship.power([0, -1]);
    });
    key('d', function() {
        game.ship.power([1, 0]);
    });
    key('f', function() {
        game.ship.fireBullet();
    });
}

GameView.prototype.moveObjects
GameView.prototype.draw