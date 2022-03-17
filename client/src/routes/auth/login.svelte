<script context="module">
	export const load = async ({ session }) => {
	  if (session.authenticated) {
		return {
		  redirect: "/",
		  status: 302,
		};
	  } 
	  return {};
	};
</script>

<script>
	import { getContext, onMount } from "svelte";
	import http from "$lib/http";
	import {goto} from '$app/navigation' 
	const auth = getContext("store");
	let form = {
		email: '',
		password: ''
	}
	let error = ''

	async function loginHandler(e) {
		e.preventDefault();
		let res = await auth.loginUser(form);

		
		if (res?.error) {
			error = res.error;
		}else {
			goto("/");
		}
	}
</script>

<svelte:head>
	<title>Showlite: Login</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="h-14 bg-gradient-to-r from-cyan-500 to-blue-500 h-screen">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-90 h-screen"
	>
		<div class="ml-20 mr-20 mt-20">
        <form on:submit|preventDefault={loginHandler} class="px-8 pt-6 pb-8 mb-4">
		  <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
              Email
            </label>
            <input bind:value={form.email} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email" type="email" placeholder="Enter Email">
          </div>
          <div>
            <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
              Password
            </label>
            <input bind:value={form.password} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="******************">
          </div>
		  <div class="flex items-start mb-6">
			<div class="text-sm">
				<a href='#' on:click|preventDefault={() => {goto('/auth/register')}}>Don't have an account, click here to register</a>
			</div>
			</div>
			<button
				type="submit"
				class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
				>Login</button
			>
        </form>
		{error}
        <p class="text-center text-gray-500 text-xs">
          &copy;2022 Showlite. All rights reserved.
        </p>
		</div>
	</div>
</div>

