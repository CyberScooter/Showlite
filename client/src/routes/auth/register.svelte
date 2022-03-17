<<<<<<< HEAD
<script>
	function submit() {
		console.log('User pressed submit button');
=======
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
		if(retypePassword != form.password){
			let res = await auth.loginUser(form);

			if (res?.error) {
				error = res.error;
			}else {
				goto("/");
			}
		}
>>>>>>> 37b4d8820766a5b9365754f0a233e3d1b7656f6f
	}
</script>

<svelte:head>
<<<<<<< HEAD
	<title>Showlite: Register</title>
=======
	<title>Showlite: Login</title>
>>>>>>> 37b4d8820766a5b9365754f0a233e3d1b7656f6f
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<<<<<<< HEAD
<div class="bg-gradient-to-r from-purple-500 to-pink-500 h-auto">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-90 h-screen"
	>
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10">Register a new Showlite Account</h1>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<!-- <span class="flex-shrink mx-4 text-gray-400">Content</span> -->
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<form on:submit|preventDefault={submit}>
				<div class="mb-6 mt-10">
					<label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
						>Email</label
					>
					<input
						type="email"
						id="email"
						class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder="name@flowbite.com"
						required
					/>
				</div>

				<div class="mb-6 mt-10">
					<label
						for="username"
						class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Username</label
					>
					<input
						type="username"
						id="username"
						class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						placeholder=""
						required
					/>
				</div>

				<div class="mb-6">
					<label
						for="password"
						class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Password</label
					>
					<input
						type="password"
						id="password"
						class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						required
					/>
				</div>

				<div class="mb-6">
					<label
						for="password-confirmation"
						class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
						>Confirm password</label
					>
					<input
						type="password"
						id="password-confirmation"
						class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
						required
					/>
				</div>

				<button
					type="submit"
					class="text-white bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
					>Register</button
				>
			</form>
=======
<div class="h-14 bg-gradient-to-r from-cyan-500 to-blue-500 h-screen">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-90 h-screen"
	>
		<div class="ml-20 mr-20 mt-20">
        <form on:submit|preventDefault={registerHandler} class="px-8 pt-6 pb-8 mb-4">
          <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
              Username
            </label>
            <input bind:value={form.username} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="username" type="text" placeholder="Enter Password">
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
            <label class="block text-gray-700 text-sm font-bold mb-2" for="retype-password">
              Retype password
            </label>
            <input bind:value={retypePassword} class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="******************">
          </div>
          <div class="flex items-center justify-between">
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
              Register
            </button>
          </div>
        </form>
		{error}
        <p class="text-center text-gray-500 text-xs">
          &copy;2022 Showlite. All rights reserved.
        </p>
>>>>>>> 37b4d8820766a5b9365754f0a233e3d1b7656f6f
		</div>
	</div>
</div>
