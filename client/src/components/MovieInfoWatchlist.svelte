<script>
	import StarRating from 'svelte-star-rating';
	import { createEventDispatcher } from "svelte";
	import {goto} from '$app/navigation' 
	const dispatch = createEventDispatcher()

	export let data

	const small_config = {
		size: 18,
		showText: true
	};
</script>

<div class="grid grid-cols-6 mb-4">
	<div class="col-span-2 auto-cols-min mr-5">
		<img
			src="{data.posterUrl != undefined ? `https://image.tmdb.org/t/p/w185${data.posterUrl}` : null}"
			alt="Movie Cover"
			class="object-cover object-center w-48 h-238 mr-0"
			height="300"
			width="400"
		/>

		<button 
			class="bg-red-500 hover:bg-red-500 text-white font-bold py-2 px-2 rounded mt-3"
			on:click={() => 
				dispatch("remove" , {
					id: data.id
				})
			}
		>
			Remove
		</button>
		  
		  
	</div>

	<div class="col-span-2 leading-10">
		<h1 class="text-2xl font-bold cursor-pointer" on:click={() => goto(`/movie/${data.id}`)}>{data.title}</h1>
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
