<script>
	import MovieCard from '../../components/MovieCard.svelte';
	import CommentBox from '../../components/CommentBox.svelte';
	import Pagination from '../../components/pagination.svelte'
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { getContext } from "svelte";
	import { page as pageProperties } from '$app/stores';
	import http from '$lib/http'

	const auth = getContext("store");
	const getAuth = auth.state;

	let form = {
		title: '',
		review: '',
		rating: 0
	}
	let selectedRating = 0;
	let rows = [{
		title: "Review 1",
		username: "Test1",
		rating: 0,
		comment: "akfpaodkfpadf",
		created_at: Date.now()
	},
	{
		title: "Review 2",
		username: "Test2",
		rating: 4,
		comment: "akfpaodkfpadf",
		created_at: Date.now()
	},
	{
		title: "Review 3",
		username: "Test3",
		rating: 3,
		comment: "akfpaodkfpadf",
		created_at: Date.now()
	}]
	let page = 0;
	let error;

	onMount(() => {
		console.log($pageProperties.params.slug);
	})

	async function load(p) {
		const data = await http(fetch)(`watchlist/getWatchlist?pageNum=${p+1}&limit=6`);

		if(data.error){
			error = data.error
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

	async function addToWatchlist(){
		console.log("ran");
		const data = await http(fetch)("watchlist/addToWatchlist", "POST", {
			movieID: $pageProperties.params.slug
		});

		console.log(data)

		if(data.error){
			return
		}else {
			goto("/watchlist")
		}
		
	}

	function addComment(){
		let el = {
			title: form.title,
			username: getAuth.user.username,
			created_at: Date.now(),
			rating: form.rating,
			comment: form.comment
		}	
		if(rows.length == 5){
			rows = [el]
			load(page+1)
			history.pushState("#review-"+rows.length, '', "#review-"+rows.length)
			return
		}
		rows = rows.concat(el)

		history.pushState("#review-"+rows.length, '', "#review-"+rows.length)

	}
	
	let movie = {
		title: 'Test',
		rating: 4,
		cover_url: ''
	};
</script>

<svelte:head>
	<title>Showlite: Movie Title</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-cyan-500 to-blue-500 h-auto">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 h-auto"
	>
	{#if !!!error}
		<div class="ml-20 mr-20">
			<h1 class="text-5xl mt-10 mb-5">Movie Title</h1>
			<!-- (rating, name, description, cover_url, year, created_at, updated_at) -->
			<div class="flex text-xl">
				<!-- <div class="hidden ...">01</div> -->
				<div class="mr-4">created_at</div>
				<div class="mr-4">&middot;</div>
				<div class="mr-4">updated_at</div>
				<div class="mr-4">&middot;</div>
				<div class="mr-4">genre</div>
			</div>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="flex grid grid-cols-12">
				<div class="col-span-3">
					<MovieCard cover_size={'large'} data={movie} />
				</div>

				<div on:click={addToWatchlist} class="cursor-pointer col-span-1">
					<img src="/watchlist-button.png" alt="Add to watchlist"  class="flex" />
				</div>

				<div class="col-span-8 text-xl">
					<h1>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Cursus vitae congue mauris rhoncus aenean
						vel. Sed lectus vestibulum mattis ullamcorper velit. Tempor commodo ullamcorper a lacus
						vestibulum sed arcu non odio. A scelerisque purus semper eget duis at tellus at urna.
						Sociis natoque penatibus et magnis dis parturient. Ut porttitor leo a diam sollicitudin
						tempor id. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus. Integer
						vitae justo eget magna fermentum iaculis eu non. Massa id neque aliquam vestibulum morbi
						blandit. Egestas erat imperdiet sed euismod nisi porta. Varius duis at consectetur lorem
						donec massa sapien faucibus et. Ultrices eros in cursus turpis massa tincidunt dui ut.
						Ac tortor vitae purus faucibus.
					</h1>
				</div>
			</div>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<!-- Check if User is logged in first before submission -->
			<div class="">
				<h1 class="font-bold text-2xl">Submit a Review for Movie Title</h1>
			</div>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="flex">
				<form action="" class="w-full p-4" on:submit|preventDefault={() => addComment()}>
					<div class="mb-5">
						<label for="title" class="text-lg text-gray-600">Review Title</label>
						<input
							class="w-full h-10 p-2 border rounded focus:outline-none focus:ring-gray-300 focus:ring-1"
							name="comment"
							placeholder=""
						/>
					</div>
					<div class="mb-5">
						<label for="rating" class="text-lg text-gray-600">Rate this movie</label>
						<select bind:value={selectedRating} >
							<option value="0" selected>0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<div class="mb-2">
						<label for="comment" class="text-lg text-gray-600">Add a comment</label>
						<textarea
							class="w-full h-20 p-2 border rounded focus:outline-none focus:ring-gray-300 focus:ring-1"
							name="comment"
							placeholder=""
						/>
					</div>
					<button class="px-3 py-2 text-sm text-blue-100 bg-blue-600 rounded">Submit</button>
				</form>
			</div>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="">
				<h1 class="font-bold text-2xl">User Reviews</h1>
			</div>

			<div class="relative flex py-5 items-center mb-5">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="relative flex py-3 items-center">
				<Pagination {page} on:pageChange={onPageChange}/>
			</div>

			<!-- Load User Reviews here -->
			<div class="grid col-1">
				{#each rows as row, index}
					<CommentBox data={row} ind={index+1}/>
				{/each}
				
			</div>
		</div>
	{:else}
		<h1>{error}</h1>
	{/if}
	</div>
</div>
