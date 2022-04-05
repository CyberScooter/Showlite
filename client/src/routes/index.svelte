<script>
	import CarouselSlider from '../components/CarouselSlider.svelte';
	import http from "$lib/http"
	import { onMount, getContext } from 'svelte';

	const auth = getContext("store");
  	const getAuth = auth.state;
	
	$: getAuth
	let canvasSetting = "h-screen";


	let topMovies = [{
		name: "Test",
		rating: 4,
		cover_url: ''
	},
	{
		name: "Test2",
		rating: 4,
		cover_url: ''
	},
	{
		name: "Test3",
		rating: 3,
		cover_url: ''
	},
	{
		name: "Test4",
		rating: 2,
		cover_url: ''
	},
	{
		name: "Test5",
		rating: 2,
		cover_url: ''
	}]

	let watchlist = []

	onMount(async () => {
		if($getAuth.authenticated){
			canvasSetting = "h-max"
			const data = await http(fetch)(`watchlist/getWatchlist?pageNum=1&limit=50`);

			if(data.error){
				return
			}
			watchlist = data
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
