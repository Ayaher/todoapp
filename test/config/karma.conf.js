module.exports = function (config) {
	'use strict';

	config.set({
		basePath: '../../',
		frameworks: ['jasmine', '@angular/cli'],
		plugins: [
			require('karma-jasmine'),
			require('karma-chrome-launcher'),
			require('karma-jasmine-html-reporter'),
			require('karma-coverage-istanbul-reporter'),
			require('@angular/cli/plugins/karma')
		],
		customLaunchers: {
			ChromeHeadlessCI: {
				base: 'ChromeHeadless',
				flags: ['--no-sandbox']
			}
		},
		client:{
			clearContext: false // leave Jasmine Spec Runner output visible in browser
		},
		files: [
			'node_modules/angular/angular.js',
			'node_modules/angular-route/angular-route.js',
			'node_modules/angular-resource/angular-resource.js',
			'node_modules/angular-mocks/angular-mocks.js',
			'js/**/*.js',
			'test/unit/**/*.js'
		],
		preprocessors: {
			'./src/test.ts': ['@angular/cli']
		},
		mime: {
			'text/x-typescript': ['ts','tsx']
		},
		coverageIstanbulReporter: {
			reports: [ 'html', 'lcovonly' ],
			fixWebpackSourcePaths: true
		},
		angularCli: {
			environment: 'dev'
		},
		reporters: config.angularCli && config.angularCli.codeCoverage
				? ['progress', 'coverage-istanbul']
				: ['progress', 'kjhtml'],
		port: 9876,
		colors: true,
		logLevel: config.LOG_INFO,
		autoWatch: true,
		singleRun: false,
		browsers: ['ChromeHeadlessCI'],
		singleRun: false,
		browserNoActivityTimeout: 60000
	});
};
