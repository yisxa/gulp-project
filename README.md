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

# Gulp copy

General steps scripts task for bundling and minifying
A.Packages needed:
1.gulp
2.gulp-copy
3.through2


B. import packageName(choose anything meaningful to the Packages) from 'package';
package is the exact name in the package.json file

C.Define task as follows:
export const taskName(choose anything meaningful to the packagr) = () =>{ }
if it contains a return statement and if it does not contain any return statement us
(done) =>{
	done();
}

D.Piping order:
1.src()
2.sourcemaps.init()
3.babel()
4.concat()
5.sourcemaps.write()
6.uglify()
7.rename()
8.dest()

E. calling the task by
export const finaltaskName = gulp.series(a, b, gulp.parallel(c,d));

F. Run the task in the terminal as:
gulp finaltaskName
