function sum() {
    let totalSum = 0
    for (let i = 0; i < arguments.length; i++) {
        totalSum += arguments[i]
    };
    return totalSum;
}

function sum2(...nums) {
  let totalSum = 0
  for (let i = 0; i < nums.length; i++) {
    totalSum += nums[i]
  };
  return totalSum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function (context, ...binded) {
  return (...callArgs) => {
    return this.apply(context, binded.concat(callArgs));
  };
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

// // Function.prototype.myBind = function (context) {
// //   return () => this.apply(context);
// // };

function curriedSum(numArgs) {
  const numbers = []
  function _curriedSum(num){
    numbers.push(num);
    if (numbers.length === numArgs) {
      let totalSum = 0;
      numbers.forEach((n) => {totalSum += n})
      return totalSum
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const sum3 = curriedSum(4);
// console.log(sum3(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs) {
   const args = [];
   const func = this;
   function _curriedFn(arg) {
     args.push(arg);
     if (args.length === numArgs) {
       return func.apply(null, args); 
     } else {
       return _curriedFn;
     }
   }
   return _curriedFn;
};


function showArguments() {
  console.log(`${arguments.length}`);
};

Function.prototype.curry1 = function (numArgs) {
  const args = [];
  const func = this;
  function _curriedFn(num) {
    args.push(num);
    if (args.length === numArgs) {
     // return func.call(null, ...args);
      console.log(this)
      return this(...args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};


function showArguments() {
  console.log(`${arguments.length}`);
};






// const sum3 = [1,2,3,4].curry();
// console.log(sum3); // => 56


Function.prototype.curry2 = function (nArg) {
  const argArray = [];
  const _curriedFn = (arg) => {
    argArray.push(arg);
    if (argArray.length === nArg) {
      // spreading the array into individual arguments
      return this(...argArray);
    } else {
      return _curriedFn;
    }
  };
  return _curriedFn;
};

console.log(showArguments.curry2(3)(1)(2)(3));