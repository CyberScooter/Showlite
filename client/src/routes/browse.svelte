<script>
    import MovieInfo from '../components/MovieInfo.svelte';
	import Pagination from '../components/pagination.svelte';

	let rows = [{
		title: "Test1",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		cover_url: '',
		description: 'Test description'
	},
	{
		title: "Test2",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},
	{
		title: "Test3",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},
	{
		title: "Test4",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	},{
		title: "Test5",
		year: 2010,
		rating: 3,	
		genre: ['Action'],
		description: 'Test description'
	}]

	
	let page = 0;

	async function load(_page) {
		// const data = await getData(_page, pageSize, text, sorting);
		const data = [{id: "yes"}, {id: "no"}]
		// rows = data.rows;
		rows = data
		// rowsCount = data.rowsCount
		// rowsCount = data.length;
  	}

	function onPageChange(event) {
		console.log(event.detail.page);
		load(event.detail.page);
			page = event.detail.page;
  	}

	function filter(event) {

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

            <div class="mb-2">
                <h1><span class="font-bold">Filter by: </span><a href="#" on:click={() => filter("Release Date")}>Release Date</a> | <a href="#" on:click={() => filter("User Rating")}>User Rating</a> | <a href="#" on:click={() => filter("popularity")}>Popularity</a> | <a href="#" on:click={() => filter("alphabet")}>A-Z</a> </h1>
            </div>

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
