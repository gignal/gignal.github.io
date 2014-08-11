module.exports = (grunt) ->

  grunt.initConfig
  
    less:
      bootstrap:
        options:
          paths: 'bower_components/bootstrap/less'
        files: '_styles/bootstrap.css': '_styles/bootstrap.less'
      main:
        files: '_styles/main.css': '_styles/main.less'

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'lib/the.css': [
            '_styles/bootstrap.css'
            '_styles/main.css'
          ]

    assemble:
      pages:
        options:
          flatten: true
          layout: '_templates/default.hbs'
        files:
          '.': ['_pages/*.hbs']

    imagemin:
      dynamic:
        options:
          cache: false
        files: [
          expand: true
          cwd: '_images/'
          src: ['**/*.{png,jpg,gif}']
          dest: 'img/'
        ]
        
  grunt.registerTask 'default', ['assemble', 'less', 'cssmin', 'imagemin']
  grunt.registerTask 'style', ['less', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'assemble'
