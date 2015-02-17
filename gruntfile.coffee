module.exports = (grunt) ->

  grunt.initConfig
  
    less:
      bootstrap:
        options:
          paths: 'bower_components/bootstrap/less'
        files: '.tmp/bootstrap.css': '_styles/bootstrap.less'
      main:
        files: '.tmp/main.css': '_styles/main.less'

    cssmin:
      combine:
        options:
          keepSpecialComments: 0
        files:
          'dist/lib/the.css': [
            '.tmp/bootstrap.css'
            '.tmp/main.css'
          ]

    assemble:
      pages:
        options:
          flatten: true
          layout: '_templates/default.hbs'
        files:
          'dist/.': ['_pages/*.hbs']

    imagemin:
      dynamic:
        options:
          cache: false
        files: [
          expand: true
          cwd: '_images/'
          src: ['**/*.{png,jpg,gif}']
          dest: 'dist/img/'
        ]

    copy:
      bootstrap:
        cwd: 'bower_components/bootstrap/dist/fonts/'
        src: '*'
        dest: 'dist/fonts/'
        expand: true
        filter: 'isFile'
      files:
        cwd: 'files/'
        src: '*'
        dest: 'dist/'
        expand: true
        # filter: 'isFile'

  grunt.registerTask 'default', ['assemble', 'less', 'cssmin', 'imagemin', 'copy']
  grunt.registerTask 'style', ['less', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'assemble'
