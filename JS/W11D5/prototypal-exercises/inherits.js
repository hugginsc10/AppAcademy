function MovingObject() {}

function Ship() {};

function Asteroid() {};


// function Surrogate() {}

// Surrogate.prototype = MovingObject.prototype;

// ship.prototype = new Surrogate();
// ship.prototype.constructor = Ship;


Function.prototype.inherits = function inherits(ParentClass) {
    function Surrogate() {}
    Surrogate.prototype = ParentClass.prototype;
    this.prototype = new Surrogate() ;
    this.prototype.constructor = this;
};

Function.prototype.inherits2 = function inherits(ParentClass) {
  this.prototype = Object.create(ParentClass.prototype);
  this.prototype.constructor = this;
}
function ChassClass() {};
Ship.inherits2(MovingObject);
Asteroid.inherits2(ChassClass);

MovingObject.prototype.move = function () {
    console.log("I'm moving")
}

let c = new Ship();

c.move()
 console.log(Ship.prototype instanceof MovingObject);

