function range(beg, end) {
    if (beg === end){
        return [];

    }
    let x = range(beg, end - 1);
    x.push(end - 1);
    return x;
};
// console.log(range(3,9));

function recsum(nums) {
    if (nums.length === 0){
        return 0;
    }
    let num = nums[0];
    return recsum(nums.slice(1, nums.length)) + num;
}
// console.log(recsum([1,2,3,4,5,6]));

function exp(b,e) {
    if (e === 0){
        return 1;
    } else if (e > 0) {
        return (b * exp(b, e - 1));
    } else {
        return ((1 / (b * exp(b, e + 1)))).toFixed(4);
    }
}
// console.log(exp(2,3));
// console.log(exp(2,-1));

function fibrec(n){
    if (n < 3){
        return [0,1].slice(0,n);
    }
    let fib = fibrec(n - 1);
    fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
    return fib;
}
// console.log(fibrec(90));

function deepDup(array){
    if (Array.isArray(array) !== true){
        return array;
    }
    return array.map((ele) => {
        return deepDup(ele);
    });
}
// const arr2 = [1, [2, 2, [3, 3, 3]]]
// const duped = deepDup(arr2);
// console.log(arr2 === duped);

function bsearch(nums, target){
    if (nums.length === 0){
        return -1;
    }
    const mid = Math.floor(nums.length/2);
    const end = nums[nums.length - 1];
    if (target === nums[mid]){
        return mid;
    } else if (target > nums[mid]){
        const right = nums.slice(mid + 1);
        const bright = bsearch(right, target);
        return (bright + mid + 1);
    } else {
        const left = nums.slice(0, mid);
        return bsearch(left, target);
    }
}

console.log(bsearch([1,2,3,4,5,6], 5));