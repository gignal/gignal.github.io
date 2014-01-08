module.exports = (grunt) ->

  grunt.initConfig

    uglify:
      components:
        options:
          mangle: false
          compress: true
        files:
          'lib/the.js': [
            '_scripts/jquery-1.7.2.js'
            # '_scripts/jquery.pngFix.js'
            '_scripts/jquery-ui.js'
            # '_scripts/jquery.lightbox.js'
            # '_scripts/jquery.simplemodal.js'
            # '_scripts/jquery.example.min.js'
            # '_scripts/jquery.validate.js'
            # '_scripts/jquery.colorbox.js'
            '_scripts/main.js'
            '_scripts/hp.js'
          ]

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'lib/the.css': [
            '_styles/jquery-ui.css'
            # '_styles/jquery.lightbox.css'
            # '_styles/colorbox.css'
            '_styles/main.css'
          ]

    assemble:
      options:
        flatten: true
        layoutdir: '_templates'
      pages:
        options:
          layout: 'default.hbs'
        files:
          '.': [
            '_pages/*.hbs'
          ]

  grunt.registerTask 'default', ['assemble', 'cssmin', 'uglify']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'assemble'
