var MovingObject = require('./moving_object.js');
var Util = require('./util.js');

var Ship = function(options) {
    MovingObject.call(this, {
        pos: options.pos,
        vel: [0, 0],
        radius: Ship.RADIUS,
        color: Ship.COLOR,

    })
}
Ship.prototype.power = function(impulse) {
    this.vel[0] += impulse[0];
    this,vel[1] += impulse[1];
};