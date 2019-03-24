"use strict";

// ES6
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
var divisibleBy3ES6 = array.filter(function (v) {
  return v % 3 === 0;
});
console.log(divisibleBy3ES6); // [3, 6, 9, 12, 15]

var arr = [1, 4, 9];
var squareRoots = arr.map(function (num) {
  return Math.sqrt(num);
});
console.log(squareRoots);