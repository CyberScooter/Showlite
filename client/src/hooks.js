import * as cookie from 'cookie';
import http from '$lib/http';

export const handle = async ({ event, resolve }) => {
	event.locals.access_token = cookie.parse(event.request.headers.get('cookie') || '')[
		'access_token'
	];

	const response = await resolve(event);
	return response;
};

/** @type {import('@sveltejs/kit').GetSession} */
export async function getSession(req) {
	const context = req.locals;
	let data = {};

	// @ts-ignore
	let authenticated = !!context.access_token ? true : false;

	// @ts-ignore
	if (!!context.access_token) data = await http(fetch, context.access_token)('user/data');

	let initSession = {
		user: !!data ? data : {},
		// access_token: context.access_token,
		authenticated
	};

	return initSession;
}
