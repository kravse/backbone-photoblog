
# -----------------------------------------------------------------
#
# Simple HTTP Server, in one line:
# python -m SimpleHTTPServer
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
#  Setup
# -----------------------------------------------------------------

defaultTasks    = ['scripts', 'styles', 'images', 'templates']
jade            = require('jade')
gulp 			      = require('gulp')
uglify          = require('gulp-uglify')
minify          = require('gulp-minify-css')
plugins 		    = require('gulp-load-plugins')()
bower           = require('main-bower-files')
nib             = require('nib')

# --------------------------------------
# Handlers
# --------------------------------------

errorHandler = (error) ->
  console.log('Task Error: ', error)

serverHandler = () ->
  console.log('Started Server...')

templateHandler = (error) ->
  console.log('Template Error: ', error) if error

fileHandler = (error) ->
  console.log('File Error: ', error) if error

# -----------------------------------------------------------------
#  Paths
# -----------------------------------------------------------------

paths           =
  src             :
    default       : './src/'
    scripts       : './src/scripts/**/*.coffee'
    styles        : './src/styles/styles.styl'
    favicon       : './src/favicon.ico'
    images        : './src/images/**/*.{gif,png,jpeg,jpg}'
    templates     : ['./src/**/*.jade', '!./src/pages/*.jade']
    foundation    :
      javascript  : './bower_components/foundation/js/foundation.js'
      css         : './bower_components/foundation/css/foundation.css'
    backbone      :
      javascript  : './bower_components/backbone/backbone.js'
    underscore    :
      javascript  : './bower_components/underscore/underscore-min.js'
  build           :
    scripts       : './www/scripts/'
    styles        : './www/styles/'
    images        : './www/images/'
    templates     : './www/'
  watch           :
    scripts       : './src/**/*.{js,coffee}'
    styles        : './src/**/*.styl'
    templates     : './src/**/*.jade'


# -----------------------------------------------------------------
#  Defaults
# -----------------------------------------------------------------

gulp.task('default', defaultTasks)

# --------------------------------------
# Styles Task
# --------------------------------------

gulp.task 'styles', () ->

  # Define
  libs  = gulp.src(paths.src.foundation.css)
  main  = gulp.src(paths.src.styles).pipe(plugins.stylus(use: [nib()]))


  # Create Libs
  libs
    .pipe(minify({keepBreaks:false}))
    .pipe(plugins.rename('libs.min.css'))
    .on('error', errorHandler)
    .pipe(gulp.dest(paths.build.styles))
    .pipe(plugins.livereload( auto: false ))

  # Create Main
  main
    .pipe(minify({keepBreaks:false}))
    .pipe(plugins.rename('main.min.css'))
    .on('error', errorHandler)
    .pipe(gulp.dest(paths.build.styles))
    .pipe(plugins.livereload( auto: false ))

gulp.src('./src/php/**/*', {base: './src/'})
    .pipe(gulp.dest('./www/'))

gulp.src('./src/favicon.ico', {base: './src/'})
    .pipe(gulp.dest('./www/'))

gulp.src('./src/upload/**/*', {base: './src/'})
    .pipe(gulp.dest('./www/'))

# --------------------------------------
# Templates Task
# --------------------------------------

gulp.task 'templates', () ->

  gulp.src(paths.src.templates)
    .on('error', errorHandler)
    .pipe(plugins.jade({ pretty: true }))
    .pipe(gulp.dest(paths.build.templates))

# -----------------------------------------------------------------
#  Scripts Task
# -----------------------------------------------------------------

gulp.task 'scripts', () ->
  # Libraries
  files = bower()
  files = files.concat([paths.src.foundation.javascript, paths.src.backbone.javascript, paths.src.underscore.javascript])

  gulp.src(files)
    .pipe(plugins.concat('libs.min.js'))
    .on('error', errorHandler)
    .pipe(uglify(auto: false))
    .pipe(gulp.dest(paths.build.scripts))
    .pipe(plugins.livereload( auto: false ))

  # Main Scripts
  gulp.src(paths.src.scripts)
    .pipe(plugins.concat('main.min.js'))
    .pipe(plugins.coffee( bare: true ))
    .on('error', errorHandler)
    # .pipe(uglify(auto:false))
    .pipe(gulp.dest(paths.build.scripts))
    .pipe(plugins.livereload( auto: false ))

# --------------------------------------
# Images Task
# --------------------------------------

gulp.task 'images', () ->

  gulp.src(paths.src.images)
    .pipe(plugins.imagemin())
    .on('error', errorHandler)
    .pipe(gulp.dest(paths.build.images))

# -----------------------------------------------------------------
#  Watch Task
# -----------------------------------------------------------------

gulp.task 'watch', () ->

  # Livereload
  plugins.livereload.listen()

  # Watch Files & Kick-off Tasks
  gulp.watch(paths.watch.templates, ['templates']).on('error', errorHandler)
  gulp.watch(paths.watch.images, ['images']).on('error', errorHandler)
  gulp.watch(paths.watch.styles, ['styles']).on('error', errorHandler)
  gulp.watch(paths.watch.scripts, ['scripts']).on('error', errorHandler)

