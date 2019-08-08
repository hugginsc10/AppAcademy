Function.prototype.myBind = function (context) {
  return () => this.apply(context);
};

Function.prototype.myBindA = function (context, ...binded) {
  return (...callArgs) => {return this.apply(context, binded.concat(callArgs));
  };
};