<script>
	import CarouselSlider from '../components/CarouselSlider.svelte';
</script>

<svelte:head>
	<title>Showlite: Movie Reviews</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-cyan-500 to-blue-500 h-auto">
	<div class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 h-auto">
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10">Top Movies</h1>
			<CarouselSlider cover_size={'large'}/>
		
<<<<<<< HEAD
			<h1 class="text-3xl font-bold mt-10">Popular Additions to Watchlist</h1>
			<CarouselSlider cover_size={'small'}/>

			<h1 class="text-3xl font-bold mt-10">Recommended</h1>
=======
			<h1 class="text-3xl font-bold mt-10">Watchlist</h1>
>>>>>>> 37b4d8820766a5b9365754f0a233e3d1b7656f6f
			<CarouselSlider cover_size={'small'}/>

		</div>
	</div>
</div>
