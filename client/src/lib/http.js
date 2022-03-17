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
			baseURL = 'http://localhost:5000';
		}

		return (
			await f(`${baseURL}/${route}`, {
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
