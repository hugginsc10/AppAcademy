var Game = function() {
  this.dim_x = DIM_X;
  this.dim_y = DIM_Y;
  this.num_asteroids = Game.NUM_ASTEROIDS;
  this.asteroids = [];
  this.addAsteroids();

};
Game.DIM_X = window.innerWidth * 0.75;
Game.DIM_Y = window.innerHeight * 0.75;
Game.NUM_ASTEROIDS = 10;

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++){
    var asteroid = new asteroid(pos: this.randomPosition);
    this.asteroids.push(asteroid);
  }
}
Game.prototype.randomPosition = function() {
  posX = Math.floor(Math.random() * Game.DIM_X);
  posY = Math.floor(Math.random() * Game.DIM_Y);
  return[posX, posY];
};


Game.prototype.draw = function(ctx){
    ctx.clearRect(0, 0  Game.DIM_X, Game.DIM_Y);
    for (let i = 0; i < this.allObjects().length; i++) {
      this.allObjects()[i].draw(ctx);
    };
};

Game.prototype.moveObjects = function(ctx){
  for (let i = 0; i < this.allObjects().length; i++) {
      this.allObjects()[i].move(ctx);
  }
  this.draw(ctx);
};
Game.prototype.wrap = function(pos) {
  var posX = pos[0];
  var poxY = pos[1];
  if (poxX < -1) {
    posX = Game.DIM_X + 1;
  }
  if (posX > Game.DIM_X + 1){
    posX = 0;
  }
  if (poxY < -1) {
    posY = Game.DIM_Y + 1;
  }
  if (posY > Game.DIM_Y + 1){
    posY = 0;
  }
  return [posX, posY];
};
Game.prototype.checkCollision = function() {
  for (let i = 0; i < this.allObjects().length; i++) {
    for (let j = 0; j < this.allObjects().length; j++) {
      if (i !== j && this.allObjects()[i].isCollideWith(this.allObjects()[j])){
        this.allObjects()[i].collide
      }
    }
  }
}
Game.prototype.remove = function(obj, otherObj) {
  this.asteroids.splice(this.allObjects().indexOf(obj), 1);
  this.asteroids.splice(this.allObjects().indexOf(otherObj), 1);
};
Game.prototype.allObjects = function() {
  return [].concat(this.asteroids, this.ship, this.bullets);
};
Game.prototype.add = function(obj) {
  if (obj instanceof Asteroid) {
    this.asteroids.push(obj);

  }
  if (obj instanceof Bullet) {
    this.bullets.push(obj);
  }
};
Game.prototype.remove = function(obj) {
  if (obj instanceof Asteroid) {
    var asteroidIdx = this.asteroids.indexOf(obj);
    this.asteroids.splice(asteroidIdx, 1);
  }
};

