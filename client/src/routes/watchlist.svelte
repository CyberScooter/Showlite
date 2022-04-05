<script context="module">
	export const load = async ({ session, fetch }) => {
		if (!session.authenticated) {
			return {
				redirect: "/",
				status: 302,
			};
		}
		return {}
	};
</script>

<script>
	import { onMount } from 'svelte';
	import Pagination from '../components/Pagination.svelte';
	import http from "$lib/http";
	import MovieInfoWatchlist from '../components/MovieInfoWatchlist.svelte';
	let serverError; 
	let page = 0;

	let rows = []

	onMount(async ()=> {
		const data = await http(fetch)(`watchlist/getWatchlist?pageNum=${page+1}&limit=6`);
		if(data.error){
			serverError = data.error
			return
		}

		rows = data
	})

	async function load(p) {
		const data = await http(fetch)(`watchlist/getWatchlist?pageNum=${p+1}&limit=6`);

		if(data.error){
			serverError = data.error
			return
		}

		if(data.length == 0){
			page = p - 1
		}else{
			rows = data
		}
  	}

	async function removeFromWatchlist({detail}){
		const data = await http(fetch)("watchlist/removeFromWatchlist", "POST", {
			movieID: detail.id
		});

		if(data.error){
			serverError = data.error
			return
		}

		rows = rows.filter(movie => movie.id != detail.id)

		if(rows.length == 0 && page != 0){
			page = page - 1
			load(page)
		}
	}

	function onPageChange({detail}) {
		load(detail.page);
			page = detail.page;
  	}

</script>

<svelte:head>
	<title>Showlite: Your Watchlist</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-sky-500 to-indigo-500 min-h-screen">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80"
	>

		<div class="ml-20 mr-20">
			<h1 class="text-3x1 font-bold mt-10">Your Watchlist Movies</h1>

			<div class="relative flex py-5 items-center">

				<div class="flex-grow border-t border-gray-400" />
				<!-- <span class="flex-shrink mx-4 text-gray-400">Content</span> -->
				<div class="flex-grow border-t border-gray-400" />

			</div>
			{#if !serverError}
			<div class="relative flex py-3 items-center">
				<Pagination {page} on:pageChange={onPageChange}/>
			</div>

			<div class="grid grid-cols-2">
				{#each rows as row}
					<MovieInfoWatchlist on:remove={removeFromWatchlist} data={row}/>
				{/each}

			</div>

			{:else}
				<h1  class="text-3x1 font-bold mb-10 auto">Internal server error</h1>
			{/if}

		</div>
	</div>
</div>
