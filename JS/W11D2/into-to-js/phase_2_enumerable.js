Array.prototype.myeach = function (each) {
    for (let i = 0; i < this.length; i++){
        each(this[i]);
    }
};
// const num = [1, 2, 3, 4, 5];

// var arr1 = []

// num.myeach((x) =>{
//     arr1.push(x+1);
    
// });
// console.log(arr1);

Array.prototype.mymap = function (func) {
  const mapped = [];
  this.myeach(x => mapped.push(func(x)));
  return mapped;
}
// const num = [1, 2, 3, 4, 5];
// console.log(num.mymap( ivo => ivo + 1));


Array.prototype.myinject = function (func, value=this[0]){
  let array = this;
  if (value){
    value = array[0];
    array = array.slice(1);
  }
  let ans = value;

  array.myeach(x => ans = func(ans, x));
  return ans;
};

const num = [1, 2, 3, 4, 5, 10];
console.log(num.myinject((accum, el) => accum * el));