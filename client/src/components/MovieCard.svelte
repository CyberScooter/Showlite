<script>
	import { onMount } from 'svelte';
	export let cover_size;
	import StarRating from 'svelte-star-rating';
	import {goto} from '$app/navigation' 

	export let data;
</script>

{#if cover_size === 'large'}
<div>
	<div 
		class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		
	>
		<div on:click={goto(`/movie/${data.id}`)}>
			<img
				src="https://image.tmdb.org/t/p/w185/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg"
				alt="/film-poster-placeholder.png"
				class="object-cover object-center w-96 h-full"
			/>
		</div>


		<!-- <div class="absolute w-96 h-full p-6">
			<div class="flex h-full items-end pb-6 flex-wrap pt-96">

				<div>

				</div>
			</div>
		</div> -->
	</div>
	<h3
		class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900 my-2"
	>	
		{data.name}
	</h3>
	<div class="w-full">
		<StarRating rating={data.rating} config={{ size: 18 }} />
	</div>
</div>
{:else if cover_size === 'small'}
<div class="block">
	<div 
		class="absolute cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		on:click={goto(`/movie/${data.id}`)}
	>
		<img
			src="https://image.tmdb.org/t/p/w185{data.cover_url}"
			alt="/film-poster-placeholder.png"
			class="object-cover object-center w-48 h-full shadow-lg"
		/>


		<!-- <div class="w-48 h-full p-4">
			<div class="flex h-full items-end pb-6 flex-wrap pt-36">

				<div>
					<h3
						class="text-xl lg:text-sm font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
					</h3>
				</div>
			</div>

		</div> -->


	</div>
	<div class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900 my-3">
		{data.name}
	</div>
	<div >
		<StarRating rating={data.rating} config={{ size: 18}} />
	</div>
</div>

{/if}
