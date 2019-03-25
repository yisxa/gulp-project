// ES6
import style from "../src/css/normalize.css";
import style1 from "../src/css/1.css";
import style2 from "../src/css/2.css";
import style3 from "./main.css";
import script from "../src/js/js.js";
const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
const divisibleBy3ES6 = array.filter(v => v % 3 === 0);
alert(divisibleBy3ES6); // [3, 6, 9, 12, 15]

let arr = [1, 4, 9];
let squareRoots = arr.map((num) =>Math.sqrt(num));
alert(squareRoots)
