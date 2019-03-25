// ES6
const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
const divisibleBy3ES6 = array.filter(v => v % 3 === 0);
console.log(divisibleBy3ES6); // [3, 6, 9, 12, 15]

let arr = [1, 4, 9];
let squareRoots = arr.map((num) =>Math.sqrt(num));
console.log(squareRoots)
