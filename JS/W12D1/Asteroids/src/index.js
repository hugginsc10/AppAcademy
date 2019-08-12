
var MovingObject = require("./moving_object.js")


window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', function(event) {
  var context = document.getElementById('game-canvas');
  context.height = window.innerHeight * 0.75;
  context.width = window.innerWidth * 0.75;
  var ctx = context.getContext('2d');
  var newGame = new GameView(ctx);
});