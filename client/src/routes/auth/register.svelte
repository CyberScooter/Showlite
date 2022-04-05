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
	let retypePassword= ''
	let error = ''

	async function registerHandler() {
		if(retypePassword == form.password){

			let res = await auth.registerUser(form);

			if (res?.error) {
				error = res.error;
			}else {
				goto("/");
			}
		}else {
			error = "Password doesn't match"
		}
	}
</script>

<svelte:head>
	<title>Showlite: Register</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-cyan-500 to-blue-500 min-h-screen">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-90 pb-5 rounded-b-lg"
	>
		<div class="ml-20 mr-20 mt-20">
        <form on:submit|preventDefault={registerHandler}>
		  <h1 class="text-2xl font-bold mb-5"> Create a new account</h1>
          <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
              Username
            </label>
            <input bind:value={form.username} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="username" type="text" placeholder="Enter Username">
          </div>
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
		  <div class="mb-6">
            <label class="block text-gray-700 text-sm font-bold" for="retype-password">
              Retype password
            </label>
            <input bind:value={retypePassword} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="******************">
          </div>
		  <div class="my-4 text-red-600">
			{error}
		  </div>
          <div class="flex items-center justify-between">
            <button class="mb-3 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
              Register
            </button>
          </div>

        </form>
        <p class="text-center text-gray-500 text-xs">
          &copy;2022 Showlite. All rights reserved.
        </p>
		</div>
	</div>
</div>
