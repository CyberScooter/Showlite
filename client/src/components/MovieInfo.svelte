<script>
	import StarRating from 'svelte-star-rating';
	import { createEventDispatcher } from "svelte";
	import {goto} from '$app/navigation' 

	export let data

	const small_config = {
		size: 18,
		showText: true
	};
</script>

<div class="grid grid-cols-6 mb-4">
	<div class="col-span-1 auto-cols-min mr-5" on:click={ () => goto(`/movie/${data.id}`)}>
		<img
			src="{data.posterUrl != undefined ? `https://image.tmdb.org/t/p/w185${data.posterUrl}` : null}"
			alt="Movie Cover"
			class="cursor-pointer  object-cover object-center w-48 h-238 mr-0"
		/>
		  
	</div>

	<div class="col-span-2 leading-10">
		<h1 class="cursor-pointer text-2xl font-bold" on:click={ () => goto(`/movie/${data.id}`)}>{data.title}</h1>
		<h1>{new Date(data.releaseDate).getFullYear()}</h1>
		<StarRating rating={data.rating} config={small_config} />
		<p
			style="display: -webkit-box !important;
        -webkit-line-clamp: 8;
        -webkit-box-orient: vertical;
        white-space: normal;"
			class="leading-5 truncate"
		>
			{data.description}
		</p>
	</div>
</div>
