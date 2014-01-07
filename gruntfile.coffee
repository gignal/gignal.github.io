module.exports = (grunt) ->

  grunt.initConfig

    # uglify:
    #   components:
    #     options:
    #       mangle: false
    #       compress: true
    #     files:
    #       'parse/public/lib/components.min.js': [
    #           'bower_components/bootstrap/dist/js/bootstrap.min.js'
    #       ]

    # less:
    #   bootstrap:
    #     options:
    #       compress: true
    #       paths: ['bower_components/bootstrap/less']
    #     files:
    #       'parse/public/lib/bootstrap.min.css': ['bower_components/bootstrap/less/bootstrap.less']

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'lib/the.css': [
          ]

    watch:
      scripts:
        files: ['scripts/*.coffee']
        tasks: ['coffee']
      jst:
        files: ['scripts/*.html']
        tasks: ['jst']

  grunt.registerTask 'default', ['uglify', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'