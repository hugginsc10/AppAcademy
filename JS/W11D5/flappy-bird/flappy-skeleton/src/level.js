export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
  }

  drawBackground(ctx) {
    // debugger
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
  }
}