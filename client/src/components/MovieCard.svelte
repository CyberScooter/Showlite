<script>
	export let cover_size;
	import StarRating from 'svelte-star-rating';

	const small_config = {
		size: 18,
		showText: true,
	};

	const large_config = {
		size: 30,
		showText: true,
	};
</script>

{#if cover_size === 'large'}
	<div class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto">
		<img
			src="static/film-poster-placeholder.png"
			alt="Movie Cover"
			class="object-cover object-center w-96 h-full"
		/>
		<div class="bg-gray-800 bg-opacity-30 absolute w-96 h-full p-6">
			<h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">
				Movie #
			</h2>

			<div class="flex h-full items-end pb-6 flex-wrap pt-96">
				<div class="w-full">
					<StarRating rating={Number((Math.random() * 5).toFixed(2))} config={large_config} />
				</div>

				<div>
					<h3
						class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
						Movie Title
					</h3>
				</div>
			</div>
		</div>
	</div>
{:else if cover_size === 'small'}
	<div class="cursor-pointer flex flex-shrink-0 relative w-full sm:w-auto">
		<img
			src="static/film-poster-placeholder.png"
			alt="Movie Cover"
			class="object-cover object-center w-48 h-full"
		/>
		<div class="bg-gray-800 bg-opacity-30 absolute w-48 h-full p-4">
			<h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">
				Movie #
			</h2>

			<div class="flex h-full items-end pb-6 flex-wrap pt-36">
				<div class="w-full">
					<StarRating rating={Number((Math.random() * 5).toFixed(2))} config={small_config} />
				</div>

				<div>
					<h3
						class="text-xl lg:text-sm font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900"
					>
						Movie Title
					</h3>
				</div>
			</div>
		</div>
	</div>
{/if}
