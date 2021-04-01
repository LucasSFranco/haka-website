const path = require('path');

module.exports = {
	devServer: {
		historyApiFallback: true
	},
	module: {
		rules: [
			{
				test: /\.imba$/,
				loader: 'imba/loader',
			}
		]
	},
	resolve: {
		extensions: [".imba", ".js", ".json", ".css"],
		alias: {
			'@': path.resolve('src'),
			'#': path.resolve('src/components'),
			'app': path.resolve('src/app'),
			'svgs': path.resolve('src/svgs'),
			'server': path.resolve('src/server')
		}
	},
	entry: "./src/App.imba",
	output: { 
		publicPath: "/",
		path: __dirname + '/dist', 
		filename: "client.js" 
	}
}