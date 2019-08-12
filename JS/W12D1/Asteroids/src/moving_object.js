
function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
};

MovingObject.prototype.draw = function draw(ctx) {

  ctx.fillStyle = this.color;
  
  ctx.arc( 
    this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true
  );
};
MovingObject.prototype.move = function(ctx) {
  this.pos = ([(this.pos[0] += this.vel[0]), (this.pos[1] += this.vel[1])]);
};
MovingObject.prototype.isCollideWith = function(otherObject) {
  var dist = Util.distance(this.pos, otherObject.pos);
  var collisionDistance = this.radius + otherObject.radius;
  return dist < collisionDistance;
};
MovingObject.prototype.collideWith = function(otherObject){
  this.game.remove(this, otherObject);
};


module.exports = MovingObject