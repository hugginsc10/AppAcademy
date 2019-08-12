const MovingObject = require("./moving_object.js")

var Asteroid = function(options) {
  MovingObject.call(this, {
    pos: options.pos,
    vel: Util.randomVec(Asteroid.RADIUS),
    radius: Asteroid.RADIUS,
    color: Asteroid.COLOR
  });
}

Util.inherits(Asteroid, MovingObject);

Asteroid.COLOR = '#A52A2A';
Asteroid.RADIUS = 30;

