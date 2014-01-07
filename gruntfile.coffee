module.exports = (grunt) ->

  grunt.initConfig

    uglify:
      components:
        options:
          mangle: false
          compress: true
        files:
          'lib/components.min.js': [
            # 'bower_components/bootstrap/dist/js/bootstrap.min.js'
            'common/scripts/jquery-1.7.2.js'
            'common/scripts/jquery.pngFix.js'
            'common/scripts/jquery-ui.js'
            'common/scripts/jquery.lightbox.js'
            'common/scripts/jquery.simplemodal.js'
            'scripts/jquery.example.min.js'
            'common/scripts/jquery.validate.js'
            'scripts/jquery.colorbox.js'
            'scripts/main.js'
            'scripts/hp.js'
          ]

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
            'common/styles/jquery-ui.css'
            'common/styles/jquery.lightbox.css'
            'styles/colorbox.css'
            'styles/main.css'
          ]

  grunt.registerTask 'default', ['cssmin', 'uglify']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
