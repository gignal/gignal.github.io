module.exports = (grunt) ->

  grunt.initConfig

    uglify:
      components:
        options:
          # mangle: false
          compress: true
          wrap: true
        files:
          'lib/index.js': [
            'bower_components/zeptojs/src/zepto.js'
            'bower_components/zeptojs/src/event.js'
            '_scripts/index.js'
          ]

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
      options:
        flatten: true
        layoutdir: '_templates'
      pages:
        options:
          layout: 'default.hbs'
        files:
          '.': '_pages/*.hbs'

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

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'assemble'
