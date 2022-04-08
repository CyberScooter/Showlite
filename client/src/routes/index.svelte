<script>
	import CarouselSlider from '../components/CarouselSlider.svelte';
	import http from "$lib/http"
	import { onMount, getContext } from 'svelte';

	const auth = getContext("store");
  	const getAuth = auth.state;
	
	$: getAuth
	let canvasSetting = "h-screen";


	let topMovies = []

	let watchlist = []

	onMount(async () => {
		const data = await http(fetch)(`movies/top-rated`);

		if(data.error){
			return
		}
		topMovies = data
		
		if($getAuth.authenticated){
			canvasSetting = "h-max"
			const data = await http(fetch)(`watchlist/get?pageNum=1&limit=50`);

			if(data.error){
				return
			}
			watchlist = data.movies
		}

	})
</script>

<svelte:head>
	<title>Showlite: Movie Reviews</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-cyan-500 to-blue-500 min-h-screen">
	<div class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 rounded-b-lg">
		<div class="ml-20 mr-20 pb-20">
			<h1 class="text-3xl font-bold mt-10">Top Movies</h1>
			<CarouselSlider {topMovies} type={'TopMovies'}/>

			{#if $getAuth.authenticated}
				<h1 class="text-3xl font-bold mt-10">Watchlist</h1>
				<CarouselSlider {watchlist} type={'Watchlist'}/>
			{/if}
		</div>
	</div>
</div>
