<script>
    import MovieInfo from '../components/MovieInfo.svelte';
	import Pagination from '../components/Pagination.svelte';
</script>

<svelte:head>
	<title>Showlite: Browse Movies</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-sky-500 to-indigo-500 h-auto">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 h-auto"
	>
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10">Browse Movies</h1>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<!-- <span class="flex-shrink mx-4 text-gray-400">Content</span> -->
				<div class="flex-grow border-t border-gray-400" />
			</div>

            <div class="mb-2">
                <h1><span class="font-bold">Filter by: </span>Release Date | User Rating | Popularity | A-Z </h1>
            </div>

			

            <div class="flex grid grid-rows-6">
                <MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
				<MovieInfo/>
             
             
              
            </div>

			<div class="mb-3"><Pagination  margin_top={'20'} /></div>
		</div>
	</div>
</div>
