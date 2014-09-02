module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    # Watch task
    watch:
      coffeescript:
        files: ["lib/*.coffee"]
        tasks: ["coffee:compile", "uglify:js"]
    # CoffeeScript task
    coffee:
      compile:
        expand: true,
        flatten: true,
        cwd: "lib",
        src: ["*.coffee"],
        dest: "dist/js",
        ext: ".js"
    # Minify JS
    uglify:
      js:
        files:
          "dist/js/FollowMouse.min.js": "dist/js/FollowMouse.js"

  # Load tasks
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-uglify"

  # Register tasks
  grunt.registerTask "default", ["watch"]
