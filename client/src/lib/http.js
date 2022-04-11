import axios from 'axios';
import Cookie from 'js-cookie';
import { browser } from '$app/env';

function requestHandler(f, access_token) {
	let headers = { 'Content-Type': 'application/json' };
	if (access_token) {
		headers['authorization'] = `Bearer ${access_token}`;
	} else if (Cookie.get('access_token')) {
		headers['authorization'] = `Bearer ${Cookie.get('access_token')}`;
	}
	return async function (route, method, data) {
		// let server = route.split('/')[0];
		let baseURL = browser ? 'http://localhost:5010/' : 'http://api-gateway:5010/'


		// if (server == 'user') {
		// 	if(route.split("/")[1] == "data"){
		// 		// baseURL= 'http://localhost:5010/'
		// 		baseURL = 'http://api-gateway:5010/'
		// 	}
		// }

		// console.log(`${baseURL}${route}`);
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
