import axios from 'axios';
import Cookie from 'js-cookie';

function requestHandler(f, access_token) {
	let headers = { 'Content-Type': 'application/json' };
	if (access_token) {
		headers['authorization'] = `Bearer ${access_token}`;
	} else if (Cookie.get('access_token')) {
		headers['authorization'] = `Bearer ${Cookie.get('access_token')}`;
	}
	return async function (route, method, data) {
		let server = route.split('/')[0];
		let baseURL = '';
		if (server == 'auth') {
			baseURL= 'http://localhost:5000/'
			if(route.split("/")[1] == "data"){
				baseURL= 'http://localhost:5000/'
				// baseURL = 'http://auth-server:5000/'
			}
		}else if (server == "watchlist"){
			// baseURL = 'http://watchlist-server:5003/'
			baseURL = 'http://localhost:5003/'
		} else if(server == "reviews"){
			baseURL = 'http://reviews-server:5002/'
		} else {
			baseURL = 'http://movies-server:5001/'
		}


		console.log(`${baseURL}${route}`);
		// console.log(Cookie.get('access_token'));

		return (
			await f(`${baseURL}${route}`, {
				method: method || 'GET',
				...(() => {
					if (data) {
						return { body: JSON.stringify(data) };
					}
					return {};
				})(),
				headers: { ...headers }
			})
		).json();
	};
}
export default requestHandler;
