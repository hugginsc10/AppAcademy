var Util = require('./util.js');
var MovingObject = require('./moving_object.js');
var Asteroid = require('./asteroid.js');

var Bullet = function(options) {
    MovingObject.call(this, {
        pos: options.pos,
        vel: options.vel,
        radius: Bullet.RADIUS,
        color: Bullet.COLOR
    });
}


Util.inherits(Bullet, MovingObject);
Bullet.RADIUS = 3;
Bullet.COLOR = '#17202A';
};

Bullet.prototype.colideWith = function(otherObject) {
    if (this.game.asteroids.includes(otherObject)) {
        this.game.remove(otherObject);
        this.game.bullets.splice(this.game.bullets.indexOf(this), 1)
    }
};

module.exports = Bullet;
