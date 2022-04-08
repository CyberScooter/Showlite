<script>
	import { onMount } from 'svelte';
	export let cover_size;
	import StarRating from 'svelte-star-rating';
	import {goto} from '$app/navigation' 

	export let data;
	export let onMoviePage;


</script>

{#if cover_size === 'large'}
<div class="block">
<div>
	<div 
		class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		
	>
		<div on:click={goto(`/movie/${data.id}`)}>
			<img
				src="https://image.tmdb.org/t/p/w185{data.posterUrl}"
				alt="/film-poster-placeholder.png"
				class="object-cover object-center w-96 min-w-full min-h-full h-full shadow-lg align-top max-h-xs max-w-xs"
			/>
		</div>

	</div>
	<h3
		class="block text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900 my-2"
	>	
		{data.title}
	</h3>
	<div>
		{#if !onMoviePage}
			<StarRating rating={data.rating} config={{ size: 18}} />
		{/if}
	</div>
</div>
</div>
{:else if cover_size === 'small'}
<div class="block w-48 h-120">
	<div 
		class="absolute cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		on:click={goto(`/movie/${data.id}`)}
	>
		<img
			src="https://image.tmdb.org/t/p/w185{data.posterUrl}"
			alt="/film-poster-placeholder.png"
			class="object-cover object-center w-120 h-120 h-full shadow-lg"
		/>

	</div>
	<div class="break-words text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900 my-3">
		{data.title}
	</div>
	<div >
		{#if !onMoviePage}
		<StarRating rating={data.rating} config={{ size: 18}} />
		{/if}
	</div>
</div>

{/if}
