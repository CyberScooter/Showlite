<script>
	import CarouselSlider from '../components/carousel_slider.svelte';
</script>

<svelte:head>
	<title>Showlite: Movie Reviews</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="h-14 bg-gradient-to-r from-cyan-500 to-blue-500 h-screen">
	<div class="container mx-auto shadow-xl border-2 border-white shadow-2xl bg-white h-screen">
		<!-- <h1>Welcome to SvelteKit</h1>
            <p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p> -->
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10 mb-10">Top Movies</h1>

			<CarouselSlider />

			<!-- <div class="grid grid-rows-1 grid-flow-col gap-4">
				<MovieCard />
				<MovieCard />
				<MovieCard />			
			</div>
			 -->

			<h1 class="text-3xl font-bold mt-10">Your Favourites</h1>

			<h1 class="text-3xl font-bold mt-10">Recommended</h1>
		</div>
	</div>
</div>
