import pre from 'svelte-preprocess';
import autoPrefixer from 'autoprefixer';
import adapter from '@sveltejs/adapter-node';

const preprocess = pre({
	postcss: {
		plugins: [autoPrefixer]
	},
	scss: {
		includePaths: ['./src']
		// prependData: ``,
	}
});

export default {
	kit: {
		// By default, `npm run build` will create a standard Node app.
		// You can create optimized builds for different platforms by
		// specifying a different adapter
		adapter: adapter({
			host: '0.0.0.0',
			port: '3000',
			out: 'dist',
			envPrefix: {
				port: '3000'
			}
		}),
		vite: {
			ssr: {},

			css: {
				preprocessorOptions: {
					scss: {}
				}
			}
		}
	},
	preprocess: preprocess
};
