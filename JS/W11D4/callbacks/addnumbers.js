const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});



function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("What's your number?", function(numStr) {
      const num = parseInt(numStr);
      sum += num;
      console.log("Partial sum: " + sum);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else {
      completionCallback(sum);
    }
  }
    addNumbers(0, 3, function (sum) {
      console.log("Total Sum: " + sum);
    reader.close();
    });