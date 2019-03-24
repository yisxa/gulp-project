
import gulp from 'gulp';
// Step 0: import package from the node modules
import browserSync from 'browser-sync';

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

// Step 4: for automatically detecting our files change we can use watch
export const watch = () => {
 // if a changed is detected then it will refresh the page
	gulp.watch('src/assets/css/**/*.css', reload);
	gulp.watch('src/index.html', reload);
	gulp.watch('src/assets/js/**/*.js', reload);
} // now run 'gulp watch' to watch the task and ctrl+c to terminate the task

// Step 5: run gulp detectChange for loading the task
export const detectChange = gulp.series(serve, watch);

//export default detectChange;
