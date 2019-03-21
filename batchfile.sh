node --version
npm --version
npx --version
npx mkdirp gulp-project && cd gulp-project
npm init --yes
npm  install -g gulp
npm  install -g gulp-cli
npm install --save-dev gulp gulp-cli
gulp --version
#touch gulpfile.js
touch gulpfile.babel.js
# writing configuration in gulpfile
cat <<EOT >> gulpfile.babel.js
// gulp file default configuration pattern
// function defaultTask(done){
//     console.log("cool");
//     done();
// }
//exports.default = defaultTask;
const { src, dest } = require('gulp');
const babel = require('gulp-babel');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');

exports.default = function() {
  return src('src/*.js')
    .pipe(babel())
    .pipe(src('vendor/*.js'))
    .pipe(dest('dist/'))
    .pipe(uglify())
    .pipe(rename({ extname: '.min.js' }))
    .pipe(dest('dist/'));
}
EOT

npm install --save-dev  babel babel-cli
npm install babel-preset-env --save-dev
npm install --save-dev @babel/register
npm install --save-dev @babel/core
npm install gulp-babel gulp-uglify gulp-rename --save-dev

npx mkdirp src vendor && cd src
npx mkdirp js css  && touch index.js index.html
#writing on index.html
cat <<EOT >> index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Gulp automation for task Runner</title>
  <!-- favicon -->
  <link rel="shortcut icon" href="img/favicon.ico">

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
  <!-- normalize.css -->
  <link rel="stylesheet" href="css/normalize.css">
  <!-- fontawesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">

  <!-- bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">

  <!-- animate CSS -->
  <link rel="stylesheet" href="css/animate.min.css">

  <!-- magnific-popup CSS -->
  <link rel="stylesheet" href="css/magnific-popup.css">

  <!-- owl carousel CSS -->
  <link rel="stylesheet" href="css/owl.carousel.min.css">

  <!-- main customed style CSS -->
  <link rel="stylesheet" href="css/style.css">

  <!-- responsive CSS -->
  <link rel="stylesheet" href="css/responsive.css">

<!-- modernizr javascript for html shim/shiv -->
  <script src="js/modernizr.js"></script>
</head>
<body>

  <h1>Welcome to Gulp Automation</h1>
  <p>How gulp automation is configured with gulp@4 + babel@6 + webpack@4 + deployment + production</p>


  <script src="js/jquery.min.js"></script>
  <script src="js/script.js"></script>
</body>
</html>

EOT


#writing on index.js
cat <<EOT >> index.js
// ES6
const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const divisibleByThrreeES6 = array.filter(v => v % 3 === 0);
console.log(divisibleByThrreeES6); // [3, 6, 9, 12, 15]
EOT
cd css && touch style.css responsive.css
cat <<EOT >> style.css
background-color: gray;
EOT

cd .. && cd js && touch script.js

cat <<EOT >> script.js
alert("Welcome to gulp automation task!");
EOT

cd ../../ && cd vendor && touch download.js

# writing on download.js
cat <<EOT >> download.js
let filesDownload = require('fs');
let https = require('https');

let normalizeUrl = "https://necolas.github.io/normalize.css/8.0.1/normalize.css";
let jQueryUrl = "https://code.jquery.com/jquery-3.3.1.min.js";
let modernizrUrl = "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js";
let bootstrapUrl = "https://raw.githubusercontent.com/twbs/bootstrap/master/dist/css/bootstrap.min.css";
let fontAwesomeUrl = "https://use.fontawesome.com/releases/v5.8.0/fontawesome-free-5.8.0-web.zip";
let animateCSSUrl = "https://raw.githubusercontent.com/daneden/animate.css/master/animate.min.css";
let magnificPopupUrl = "https://raw.githubusercontent.com/dimsemenov/Magnific-Popup/master/dist/magnific-popup.css";
let owlCarouselUrl2 = "https://raw.githubusercontent.com/OwlCarousel2/OwlCarousel2/develop/dist/owl.carousel.min.js";

let owlCarouselUrl3 = "https://raw.githubusercontent.com/OwlCarousel2/OwlCarousel2/develop/dist/assets/owl.carousel.min.css";

let downFileOwlCarousel3 = filesDownload.createWriteStream("owl.carousel.min.css");

let request9 = https.get(owlCarouselUrl3, function(response){
  response.pipe(downFileOwlCarousel3);
});


let downFileNormalize = filesDownload.createWriteStream("normalize.css");
let downFileJquery = filesDownload.createWriteStream("jquery.min.js");
let downFileModernizr = filesDownload.createWriteStream("modernizr.js");
let downFileBootstrap = filesDownload.createWriteStream("bootstrap.min.css");
let downFileFontAwesome = filesDownload.createWriteStream("fontawesome-free-5.8.0-web.zip");
let downFileAnimateCSS = filesDownload.createWriteStream("animate.min.css");
let downFileMagnificPopup = filesDownload.createWriteStream("magnific-popup.css");

let downFileOwlCarousel2 = filesDownload.createWriteStream("owl.carousel.min.js");

let request3 = https.get(bootstrapUrl, function(response){
  response.pipe(downFileBootstrap);
});

let request = https.get(normalizeUrl, function(response){
  response.pipe(downFileNormalize);
});

let request1 = https.get(jQueryUrl, function(response){
  response.pipe(downFileJquery);
});

let request2 = https.get(modernizrUrl, function(response){
  response.pipe(downFileModernizr);
});

let request4 = https.get(fontAwesomeUrl, function(response){
  response.pipe(downFileFontAwesome);
});
let request5 = https.get(animateCSSUrl, function(response){
  response.pipe(downFileAnimateCSS);
});
let request6 = https.get(magnificPopupUrl, function(response){
  response.pipe(downFileMagnificPopup);
});
let request8 = https.get(owlCarouselUrl2, function(response){
  response.pipe(downFileOwlCarousel2);
});
EOT
# running the download.js file in node
node download.js
#copying files to the apropriate folder
cp normalize.css ../src/css
cp modernizr.js ../src/js
cp jquery.min.js ../src/js
cp animate.min.css ../src/css
cp magnific-popup.css ../src/css

unzip fontawesome-free-5.8.0-web.zip 

# renaming fontawesome-free-5.8.0-web directory to fontawesome-5.8.0
mv -f fontawesome-free-5.8.0-web fontawesome-5.8.0

#copying the all.min.css to the current location renaming to font-awesome.min.css
cp fontawesome-5.8.0/css/all.min.css font-awesome.min.css 

#moving the font-awesome.min.css to css directory
mv font-awesome.min.css ../src/css

#git clone https://github.com/twbs/bootstrap.git
npm install bootstrap
#unzip bootstrap-4.0.0.zip
#copying bootstrap files to css directory
cp bootstrap.min.css ../src/css

cp owl.carousel.min.css ../src/css
cp owl.carousel.min.js ../src/js

#deleting the directories 
rm -ivrf fontawesome-5.8.0

# change to project directory and 
#open the current directory in the atom editor
#open new bash shell
cd .. && atom . && bash 
