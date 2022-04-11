<script>
    import MovieInfo from '../components/MovieInfo.svelte';
	import Pagination from '../components/Pagination.svelte';
	import http from "$lib/http";
	import { onMount } from 'svelte';
	let serverError;

	let rows = []

	let page = 0;

	onMount( async () => {
		const data = await http(fetch)(`movies/get?page=${page+1}&size=10`);

		if(data.error){
			serverError = data.error
			return
		}

		rows = data
	})

	async function load(p) {
		const data = await http(fetch)(`movies/get?page=${p+1}&size=10`);

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

	function onPageChange({detail}) {
		load(detail.page);
			page = detail.page;
  	}

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

            <!-- <div class="mb-2">
                <h1><span class="font-bold">Filter by: </span><a href="#" on:click={() => filter("Release Date")}>Release Date</a> | <a href="#" on:click={() => filter("User Rating")}>User Rating</a> | <a href="#" on:click={() => filter("popularity")}>Popularity</a> | <a href="#" on:click={() => filter("alphabet")}>A-Z</a> </h1>
            </div> -->

			<div class="relative flex py-3 items-center">
				<Pagination {page} on:pageChange={onPageChange}/>
			</div>
			

            <div class="flex grid grid-rows-5">
				{#each rows as row}
					<MovieInfo data={row}/>
				{/each}
             
              
            </div>

			<!-- <div class="mb-3"><Pagination  margin_top={'20'} /></div> -->
		</div>
	</div>
</div>
