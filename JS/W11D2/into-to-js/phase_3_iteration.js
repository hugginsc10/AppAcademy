Array.prototype.bubblesort = function () {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < (this.length - 1); i++){
            if (this[i] > this[i + 1]){
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
};
// const arr1 = [1, 4, 28, 17, 2, 7, 9, 10, 14];
// console.log(arr1.bubblesort());

String.prototype.substrings = function () {
    let subs = [];
    for (let x = 0; x < this.length; x++){
        for (let y = x + 1; y <= this.length; y++){
            subs.push(this.slice(x,y));
        }
    }
    return subs;
};
console.log("chas".substrings());