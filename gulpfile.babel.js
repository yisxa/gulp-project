import gulp from 'gulp';
// Step 0: import package from the node modules
import browserSync from 'browser-sync';
import path from 'path';
import del from 'del';

// for scripts task
import concat from 'gulp-concat';
import sourcemaps from 'gulp-sourcemaps';
import babel from 'gulp-babel';
import uglify from 'gulp-uglify';
import rename from 'gulp-rename';




// Step 1: lets a create a browser-sync object
const server = browserSync.create();

// Step 2: defines a variable for BrowserLoading the html files from base directory
export const serve = (done) => {
	server.init({
		notify : false, // disable the browser sync connected notification
		// proxy: "http://localhost/ecom-php", // either by proxy url or
		server: { // from base directory url
            baseDir: "./src",
            browser: "google chrome"
        }
	});
	done();
}

// Step 3: reload the browser if any change is detected
export const reload = (done) => {
	server.reload();
	done();
}

export const clean = () => del(['dist']);

// for coping other files into our project directory
export const copy = () => {
	return gulp.src('src/**/*')
			.pipe(gulp.dest('dist'));
}

// Step 4: for automatically detecting our files change we can use watch
export const watch = () => {
 // if a changed is detected then it will refresh the page
	gulp.watch('src/assets/styles/**/*.css', reload);
	gulp.watch('src/index.html', reload);
	gulp.watch('src/assets/scripts/**/*.js', reload);
} // now run 'gulp watch' to watch the task and ctrl+c to terminate the task



// now we can refactor our code a little bit by creating a object
// const paths = {
// 	styles: {
// 		src: ['src/assets/styles/*.*/*.css'], // we can pass multiple file in an array to process
// 		dest: 'dist/assets/styles'
// 	},
//
// 	script: {
// 		src: ['src/assets/scripts/*.*/*.js'],
// 		dest: 'dist/assets/scripts'
// 	},
//
// 	img: { //images source and dest with an object
// 		src: 'src/assets/images/**/*.{jpg,jpeg,png,svg,gif}',
// 		dest: 'dist/assets/images'
//
// 	},
//
// 	copyfiles: { // copying files linke fonts etc other than js, css directory and its content
// 		src: ['src/**/*', 'src/assets', 'src/assets/**/*','src/assets/{imgages,scripts,styles}/**/*'],
// 		dest: 'dist'
//
// 	}
// }


// Step 2: defines a variable for BrowserLoading the html files from base directory
export const serve1 = (done) => {
	server.init({
		notify : false, // disable the browser sync connected notification
		// proxy: "http://localhost/ecom-php", // either by proxy url or
		server: { // from base directory url
            baseDir: "./dist",
            browser: "google chrome"
        }
	});
	done();
}

// General steps scripts task for bundling and minifying
// A.Packages needed:
// 1.gulp
// 2.gulp-sourcemaps
// 3.gulp-babel
// 4.gulp-concat
// 5.gulp-uglify
// 6.gulp-rename
//
// B. import packageName(choose anything meaningful to the Packages) from 'package';
// package is the exact name in the package.json file
//
// C.Define task as follows:
// export const taskName(choose anything meaningful to the packagr) = () =>{ }
// if it contains a return statement and if it does not contain any return statement us
// (done) =>{
// 	done();
// }
//
// D.Piping order:
// 1.src()
// 2.sourcemaps.init()
// 3.babel()
// 4.concat()
// 5.sourcemaps.write()
// 6.uglify()
// 7.rename()
// 8.dest()
//
// E. calling the task by
// export const finaltaskName = gulp.series(a, b, gulp.parallel(c,d));
//
// F. Run the task in the terminal as:
// gulp finaltaskName

export const scripts = () => {
  return gulp.src(['src/js/js.js', 'src/js/js1.js', 'src/js/js2.js', 'src/js/js3.js'])
              .pipe(sourcemaps.init())
              .pipe(babel())
              .pipe(concat('bundle.js'))
              .pipe(sourcemaps.write())
              .pipe(uglify())
              .pipe(rename({ extname: '.min.js' }))
              .pipe(gulp.dest('./bundle/'));
}

export const finalDist = gulp.series(clean, gulp.parallel(scripts, copy), serve, watch);



// Step 4: for automatically detecting our files change we can use watch
export const watch1 = () => {
 // if a changed is detected then it will refresh the page
	gulp.watch('dist/assets/styles/**/*.css', reload);
	gulp.watch('dist/index.html', reload);
	gulp.watch('dist/assets/scripts/**/*.js', reload);
} // now run 'gulp watch' to watch the task and ctrl+c to terminate the task

export const dev = gulp.series(serve, watch); // run gulp dev for development environment
export const build = gulp.series(clean, copy, serve1, watch1);
export default dev;

// Step 5: run gulp detectChange for loading the task
// export const detectChange = gulp.series(serve, watch);

//default defines the ease of access: only run gulp and enjoy the task
// export default detectChange;
