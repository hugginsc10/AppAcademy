import Level from "./level.js"
import Bird from "./bird.js"


export default class FlappyBird {
  constructor(canvas){
    this.dimensions = {width: canvas.width, height: canvas.height};
    this.ctx = canvas.getContext("2d");
  
  };





  animate() {
  
    this.lvl.drawBackground(this.ctx);
    this.bird.animate(this.ctx);
  };

  

  restart() {
    this.lvl = new Level(this.dimensions);
    this.bird = new Bird(this.dimensions);
    this.animate(this.ctx);

  };
}