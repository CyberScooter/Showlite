<script>
	import { onMount } from 'svelte';
	export let cover_size;
	import StarRating from 'svelte-star-rating';
	import {goto} from '$app/navigation' 

	export let data;
</script>

{#if cover_size === 'large'}
	<div 
		class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		on:click={goto(`/movie/${data.id}`)}
	>
		<img
			src="https://image.tmdb.org/t/p/w185/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg"
			alt="/film-poster-placeholder.png"
			class="object-cover object-center w-96 h-full"
		/>

		<div class="absolute w-96 h-full p-6">
			<div class="flex h-full items-end pb-6 flex-wrap pt-96">
				<div class="w-full">
					<StarRating rating={data.rating} config={{ size: 18, showText: true }} />
				</div>

				<div>
					<h3
						class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
						{data.name}
					</h3>
				</div>
			</div>
		</div>
	</div>
{:else if cover_size === 'small'}
	<div 
		class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto"
		on:click={goto(`/movie/${data.id}`)}
	>
		<img
			src="https://image.tmdb.org/t/p/w185{data.cover_url}"
			alt="/film-poster-placeholder.png"
			class="object-cover object-center w-48 h-full shadow-lg"
		/>

		<div class="absolute w-48 h-full p-4">
			<div class="flex h-full items-end pb-6 flex-wrap pt-36">
				<div >
					<StarRating rating={data.rating} config={{ size: 30, showText: true }} />
				</div>
				<div>
					<h3
						class="text-xl lg:text-sm font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
						<!-- {data.name} -->
					</h3>
				</div>
			</div>
		</div>

	</div>
{/if}
