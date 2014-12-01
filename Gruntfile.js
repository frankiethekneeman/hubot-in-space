'use strict';

module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-mocha-cov');
  grunt.loadNpmTasks('grunt-release');

  grunt.initConfig({
    mochaTest: {
      test: {
        options: {
          reporter: 'spec',
          require: 'coffee-script'
        },
        src: ['test/**/*.coffee']
      }
    },
    
    mochacov: {
      options: {
        //coveralls: true,
        reporter: 'mocha-lcov-reporter',
        require: [
          'coffee-script',
          'mocha-lcov-reporter'
        ]
      },
      all: ['test/*.coffee']
    },
    release: {
      options: {
        tagName: 'v<%= version %>',
        commitMessage: 'Prepared to release <%= version %>.'
      }
    },
    watch: {
      files: ['Gruntfile.js', 'test/**/*.coffee'],
      tasks: ['test']
    }
  });

  grunt.event.on('watch', function(action, filepath, target) {
    grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
  });

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.registerTask('test', ['mochaTest']);
  grunt.registerTask('test:watch', ['watch']);
  grunt.registerTask('default', ['mochacov']);
};
