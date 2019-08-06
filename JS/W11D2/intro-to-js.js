Array.prototype.uniq = function() {
  let uniqueArr = [];
  for (let i = 0; i < this.length; i++) {
    if (uniqueArr.indexOf(this[i]) === -1) {
      uniqueArr.push(this[i]);
    }
  }
  return uniqueArr;
}

Array.prototype.twosum = function () {
  
}