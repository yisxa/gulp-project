# Webpack4 + Babel7 + Gulp4 configuration

All in one New ES6 configuration for Babel7 Webpack4 and Gulp4 with new series and parallel

## General steps scripts task for bundling and minifying

### A. Packages needed:
* 1.gulp
* 2.gulp-sourcemaps
* 3.gulp-babel
* 4.gulp-concat
* 5.gulp-uglify
* 6.gulp-rename

### B. import packageName(choose anything meaningful to the package) from 'pacakge';

package is the exact name in the package.json file

### C. Define task as follows:
` export const taskName(choose anything meaningful to the package) = () =>{ } `

if it contains a return statement and

if it does not contain any return statement then use the following

` (done) =>{
	done();
} `

### D. Piping order:

* 1.src()
* 2.sourcemaps.init()
* 3.babel()
* 4.concat()
* 5.sourcemaps.write()
* 6.uglify()
* 7.rename()
* 8.dest()

### E. calling the task by

` export const finaltaskName = gulp.series(a, b, gulp.parallel(c,d));
`
### F. Run the task in the terminal as:
`` gulp finaltaskName ``


##Predures:

### A:

` npm install --save-dev gulp-sourcemaps gulp-babel gulp-uglify gulp-rename gulp-concat `

### B:

` import concat from 'gulp-concat';
import sourcemaps from 'gulp-sourcemaps';
import babel from 'gulp-babel';
import uglify from 'gulp-uglify';
import rename from 'gulp-rename';

`

### C and D:

` export const scripts = () => {
  return gulp.src(['src/js/js.js', 'src/js/js1.js', 'src/js/js2.js', 'src/js/js3.js',])
              .pipe(sourcemaps.init())
              .pipe(babel())
              .pipe(concat('bundle.js'))
              .pipe(sourcemaps.write())
              .pipe(uglify())
              .pipe(rename({extname: '.min.js'}))
              .pipe(gulp.dest('dist'));
} `

### E:

` export const finalDist = gulp.series(clean, gulp.parallel(scripts, copy), serve, watch); `

### F:

`` gulp finalDist ``

## Here is the package.json file for simplicity

` {
  "name": "gulp-project",
  "version": "1.0.0",
  "description": "gulp4 webpack4 and babel7 automation",
  "main": "index.js",
  "dependencies": {
    "bootstrap": "^4.3.1",
    "jquery": "^3.3.1",
    "popper.js": "^1.14.7"
  },
  "devDependencies": {
    "@babel/cli": "^7.2.3",
    "@babel/core": "^7.4.0",
    "@babel/preset-env": "^7.4.2",
    "@babel/register": "^7.4.0",
    "babel-loader": "^8.0.5",
    "browser-sync": "^2.26.3",
    "css-loader": "^2.1.1",
    "del": "^4.0.0",
    "eslint": "^5.15.3",
    "eslint-plugin-standard": "^4.0.0",
    "gulp": "^4.0.0",
    "gulp-babel": "^8.0.0",
    "gulp-cli": "^2.0.1",
    "gulp-concat": "^2.6.1",
    "gulp-rename": "^1.4.0",
    "gulp-sourcemaps": "^2.6.5",
    "gulp-uglify": "^3.0.2",
    "html-loader": "^0.5.5",
    "html-webpack-plugin": "^3.2.0",
    "mini-css-extract-plugin": "^0.5.0",
    "path": "^0.12.7",
    "webpack": "^4.29.6",
    "webpack-cli": "^3.3.0",
    "webpack-dev-server": "^3.2.1"
  },
  "scripts": {
    "es5": "babel src/index.js --out-dir conToES5",
    "lint": "eslint ./src/index.js --fix",
    "start": "webpack-dev-server --mode development --open",
    "dev": "webpack --mode development ./app/index.js --output ./devWebpack/bundle.js --watch",
    "build": "webpack --mode production ./app/index.js --output ./distWebpack/bundle.js --watch"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/yisxa/gulp-project.git"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/yisxa/gulp-project/issues"
  },
  "homepage": "https://github.com/yisxa/gulp-project#readme"
}

`
