"use strict";

// ES6
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
var divisibleByThrreeES6 = array.filter(function (v) {
  return v % 3 === 0;
});
console.log(divisibleByThrreeES6); // [3, 6, 9, 12, 15]