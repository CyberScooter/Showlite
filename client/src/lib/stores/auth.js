import { derived, writable } from 'svelte/store';
import http from '$lib/http';
import Cookie from 'js-cookie';

export default class AuthStore {
	state = {
		access_token: '',
		user: {},
		authenticated: false
	};

	constructor(state) {
		this.state = state;
	}

	logoutUser() {}

	async loginUser(form) {
		const data = await http(fetch)('user/login', 'POST', form);

		console.log(data);

		if (!data.error) {
			return this.setAuth({... data, authenticated: true});
		} else {
			return { error: data.error };
		}
	}

	async registerUser(form) {
		const data = await http(fetch)('user/register', 'POST', form);

		if (!data.error) {
			return this.setAuth({... data, authenticated: true});
		} else {
			return { error: data.error };
		}
	}

	async setAuth({ username, email, token, authenticated }) {
		await this.state.update((value) => {
			return { ...value, user: { username, email }, authenticated };
		});

		Cookie.set('access_token', token, {
			expires: new Date(new Date().setDate(new Date().getDate() + 7))
		});
	}

	logout(){
		if(!!Cookie.get("access_token")){
			Cookie.remove('access_token')
		}

		return this.setAuth({username: '', email: '', token: '', authenticated: false})
	}
}
