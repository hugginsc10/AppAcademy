export default class Bird {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.x = this.dimensions.width / 3;
    this.y = this.dimensions.height / 2;
    this.velocity = 0;
    // debugger
  };
  drawBird(ctx){
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.x, this.y, 40, 30);
  };

  animate(ctx){
    this.drawBird(ctx);
          
  };
}