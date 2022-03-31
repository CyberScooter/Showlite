<script>
	import { onMount } from 'svelte';
	export let cover_size;
	import StarRating from 'svelte-star-rating';

	export let data;
</script>

{#if cover_size === 'large'}
	<div class="flex flex-shrink-0 relative w-full sm:w-auto">
		<img
			src="/film-poster-placeholder.png"
			alt="Movie Cover"
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
						{data.title}
					</h3>
				</div>
			</div>
		</div>
	</div>
{:else if cover_size === 'small'}
	<div class="flex flex-shrink-0 relative w-full sm:w-auto">
		<img
			src="/film-poster-placeholder.png"
			alt="Movie Cover"
			class="object-cover object-center w-48 h-full shadow-lg"
		/>
		<div class="absolute w-48 h-full p-4">
			<div class="flex h-full items-end pb-6 flex-wrap pt-36">
				<div class="w-full">
					<StarRating rating={data.rating} config={{ size: 30, showText: true }} />
				</div>

				<div>
					<h3
						class="text-xl lg:text-sm font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
						{data.title}
					</h3>
				</div>
			</div>
		</div>
	</div>
{/if}
