<script context="module">
	export const load = async ({ session }) => {
	  if (!session.authenticated) {
		return {
		  redirect: "/",
		  status: 302,
		};
	  } 
	  return {};
	};
</script>

<script>
	import MovieInfo from '../components/MovieInfo.svelte';
	import Pagination from '../components/Pagination.svelte';

	let rows = [{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		cover_url: '',
		description: 'Test description'
	},
	{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},
	{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action', 'Drama'],
		description: 'Test description'
	},
	{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},
	{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	}]

	let rowsCount = 0

	let buttons = [-2,-1,0,1,2]
	let count = 20
	let pageSize = 6
	let page = 0;

	async function load(_page) {
		// const data = await getData(_page, pageSize, text, sorting);
		const data = [{title: "yes"}, {id: "no"}]
		// rows = data.rows;
		rows = data
		// rowsCount = data.rowsCount
		rowsCount = data.length;
  	}

	function onPageChange(event) {
		console.log(event.detail.page);
		load(event.detail.page);
			page = event.detail.page;
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
			<div class="relative flex py-3 items-center">
				<Pagination {buttons} {count} {pageSize} {page} on:pageChange={onPageChange}/>
			</div>

			<div class="grid grid-cols-2">
				{#each rows as row}
					<MovieInfo data={row}/>
				{/each}
			</div>

		</div>
	</div>
</div>
