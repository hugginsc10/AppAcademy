Array.prototype.uniq = function () {
    let uniqueArr = [];
    for (let i = 0; i < this.length; i++) {
        if (uniqueArr.indexOf(this[i]) === -1) {
            uniqueArr.push(this[i]);
        }
    }
    return uniqueArr;
}

Array.prototype.twosum = function () {
    const pair = [];
    for (let i = 0; i < this.length; i++){
        for (let x = (i + 1); x < this.length; x++){
            if (this[i] + this[x] === 0){
            pair.push([i,x]);
        }
    }
}
return pair;
};
// console.log([5,-5,0,1,3,-3,8,0].twosum());

Array.prototype.tranpose = function () {
    const transposed = Array.from (
        {length: this[0].length}, () => Array.from({length: this.length})
    );
    for (let i=0; i < this.length; i++){
        for (let x= 0; x < this[i].length; x++){
            transposed[x][i] = this[i][x];
        }
    }
    return transposed;
}
// console.log([[1,3,5],[2,4,6]].tranpose());
