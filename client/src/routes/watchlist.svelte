<script>
	import MovieInfo from '../components/movie_info.svelte';
	import Pagination from '../components/pagination.svelte';
</script>

<svelte:head>
	<title>Showlite: Your Watchlist</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-sky-500 to-indigo-500 h-auto">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 h-screen"
	>
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10">Your Watchlist Movies</h1>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<!-- <span class="flex-shrink mx-4 text-gray-400">Content</span> -->
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="grid grid-cols-2">
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
			</div>

			<Pagination margin_top={'10'}/>

		</div>
	</div>
</div>
