<script context="module">
	/** @type {import('./[slug]').Load} */
	export async function load({ params, fetch }) {

        if (params.slug === 'favicon.png') {
            return { redirect: '/', status: 302 };
        }

		const data = await http(fetch)(`movies/${params.slug}`);
		const comments = await http(fetch)(`reviews/get?page=1&movieID=${params.slug}`)

		console.log(comments);

		if(data.error || comments.error){
			return {
				props: {
					error: comments.error ? comments.error : data.error
				}
			}
		}

		return {
			props: {
				movieInfo: data,
				rating: data.rating,
				rows: comments
			}
		};
	}
  </script>


<script>
	import MovieCard from '../../components/MovieCard.svelte';
	import CommentBox from '../../components/CommentBox.svelte';
	import Pagination from '../../components/Pagination.svelte'
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import StarRating from 'svelte-star-rating';
	import { getContext } from "svelte";
	import { page as pageProperties } from '$app/stores';
	import http from '$lib/http'

	const auth = getContext("store");
	const getAuth = auth.state;

	export let movieInfo = {}
	let form = {
		title: '',
		comment: '',
	}
	let selectedRating = 0;
	export let rows = []
	let page = 0;
	export let error;
	export let rating = 0;
	let serverError;
	let success;
	
	async function load(p) {
		const data = await http(fetch)(`reviews/get?page=${p+1}&movieID=${$pageProperties.params.slug}`);

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
		const data = await http(fetch)("watchlist/add", "POST", {
			movieID: $pageProperties.params.slug
		});

		if(data.error){
			serverError = data.error
		}else {
			goto("/watchlist")
		}
		
	}

	async function addComment(){
		if(!!form.title && !!form.comment){
			let el = {
				title: form.title,
				username: $getAuth.user.username,
				created_at: Date.now(),
				rating: selectedRating,
				comment: form.comment
			}	

			const data = await http(fetch)("reviews/add", "POST", {
				movie_id: $pageProperties.params.slug,
				rating: el.rating,
				comment: el.comment,
				title: el.title
			});

			if(data.error){
				serverError = data.error
				return
			}

			el = {... el, id: data.id, rating: parseInt(el.rating) }
			if(data.newRating != 0){
				rating = parseInt(data.newRating)
			}

			if(rows.length == 5){
				load(page+1)
				return
			}
			
			let temp = rows
			temp.unshift(el)
			rows = temp

			form.title= ""
			form.comment= ""
			selectedRating = 0

			success = "Review added"
		}

	}

	async function removeComment(id){
		const data = await http(fetch)("reviews/delete", "POST", {
			review_id: id,
			movie_id: $pageProperties.params.slug
		});

		if(data.error){
			serverError = data.error
			return
		}

		rows = rows.filter(comment => comment.id != id)

		if(rows.length == 0 && page != 0){
			page = page - 1
			load(page)
		}

		rating = parseInt(data.newRating)
	}

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
	{#if movieInfo != undefined}
		<div class="ml-20 mr-20">
			<h1 class="text-5xl mt-10 mb-5">{movieInfo.title}</h1>

			<!-- (rating, name, description, cover_url, year, created_at, updated_at) -->
			<div class="flex text-xl">
				<!-- <div class="hidden ...">01</div> -->
				<div class="mr-4">Year released: {new Date(movieInfo.releaseDate).getFullYear()}</div>
			</div>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="flex grid lg:grid-cols-2 md:lg:grid-cols-2 sm:lg:grid-cols-2">
				<div class="place-items-center">
					<MovieCard cover_size={'large'} data={movieInfo} onMoviePage={true} />
					<StarRating rating={rating} config={{ size: 18}} />
					{#if $getAuth.authenticated}
						<span on:click={addToWatchlist} class="cursor-pointer ">
							<img src="/watchlist-button.png" alt="Add to watchlist"  class="m-0" width="100" height="100"/>
						</span>
					{/if}
				</div>

				<div class="col-span-8 text-xl">
					<h1>
						{movieInfo.description}
					</h1>
				</div>


				{#if !!serverError}
					<p class="text-red-600 font-bold">{serverError}</p>
				{/if}

			</div>


			{#if $getAuth.authenticated}

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<!-- Check if User is logged in first before submission -->

			<div class="">
				<h1 class="font-bold text-2xl">Submit a Review for {movieInfo.title}</h1>
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
								bind:value={form.title}
								placeholder="Enter title"
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
								bind:value={form.comment}
								placeholder="Enter comment"
							/>
						</div>
						<button class="px-3 py-2 text-sm text-blue-100 bg-blue-600 rounded">Submit</button>
					</form>
				</div>

			{#if success}
				<p class="text-green-600 font-bold">{success}</p>
			{/if}

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>
			{/if}


			<div class="">
				<h1 class="font-bold text-2xl">User Reviews</h1>
			</div>

			<div class="relative flex items-center mb-3">
				<div class="flex-grow border-t border-gray-400" />
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<div class="relative flex py-3 items-center">
				<Pagination {page} on:pageChange={onPageChange}/>
			</div>

			<!-- Load User Reviews here -->
			<div class="grid col-1">
				{#each rows as row, index}
					<CommentBox on:remove={() => removeComment(row.id)} showDelete={$getAuth.user.username == row.username} data={row} ind={index+1}/>
				{/each}
			</div>
		</div>
	{:else}
		<h1>{error}</h1>
	{/if}
	</div>
</div>
