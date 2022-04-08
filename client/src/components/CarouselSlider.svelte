<script>

	import MovieCard from './MovieCard.svelte';
	export let type;
	export let watchlist;
	export let topMovies;

	let defaultTransform = 0;
	let slider;

	function goNext() {
		defaultTransform = defaultTransform - 398;
		if (Math.abs(defaultTransform) >= slider.scrollWidth / 1.7) defaultTransform = 0;
		slider.style.transform = 'translateX(' + defaultTransform + 'px)';
	}

	function goPrev() {
		if (Math.abs(defaultTransform) === 0) defaultTransform = 0;
		else defaultTransform = defaultTransform + 398;
		slider.style.transform = 'translateX(' + defaultTransform + 'px)';
	}

</script>

<div class="flex items-center justify-center w-full h-full py-24 sm:py-8 px-4">
	<div class="w-full relative flex items-center justify-center">
		<button
			aria-label="slide backward"
			class="absolute z-30 left-0 ml-10 focus:outline-none focus:bg-gray-400 focus:ring-2 focus:ring-offset-2 focus:ring-gray-400 cursor-pointer"
			id="prev"
			on:click={goPrev}
		>
			<div style="background: #000000; border-radius: 0.6rem; display: inline-block;">
				<!-- Left Arrow White -->
				<svg width="48px" height="48px" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 24 24" style="enable-background:new 0 0 24 24;" xml:space="preserve">
					<title>Arrow Left</title>
					<style type="text/css">
						.arrow-left--white {
							fill-rule: evenodd;
							clip-rule: evenodd;
							fill: #FFFFFF;
						}
					</style>
					<g>
						<polygon class="arrow-left--white" points="16,16.6 11.4,12 16,7.4 14.6,6 8.6,12 14.6,18 	" />
					</g>
				</svg>
			</div>
		</button>
		<div class="w-full h-full mx-auto overflow-x-hidden overflow-y-hidden">
			<div
				id="slider"
				class="h-full flex gap-14 items-center transition ease-out duration-700"
				bind:this={slider}
			>
				{#if type == 'TopMovies'}
					{#each topMovies as movie}
						<MovieCard cover_size={'large'} data={movie}/>
					{/each}
					
				{:else if type == 'Watchlist'}
					{#each watchlist as movie}
						<MovieCard cover_size={'small'} data={movie}/>
					{/each}
				{/if}
				
			</div>
		</div>

		<button
			aria-label="slide forward"
			class="absolute z-30 right-0 mr-10 focus:outline-none focus:bg-gray-400 focus:ring-2 focus:ring-offset-2 focus:ring-gray-400"
			id="next"
			on:click={goNext}
		>
			<div style="background: #000000; border-radius: 0.6rem; display: inline-block;">
				<!-- Right Arrow White -->
				<svg width="48px" height="48px" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 24 24" style="enable-background:new 0 0 24 24;" xml:space="preserve">
					<title>Arrow Right</title>
					<style type="text/css">
						.arrow-right--white {
							fill-rule: evenodd;
							clip-rule: evenodd;
							fill: #FFFFFF;
						}
					</style>
					<g>
						<polygon class="arrow-right--white" points="9,16.6 13.3,12 9,7.4 10.3,6 16,12 10.3,18 	" />
					</g>
				</svg>
			</div>
		</button>
	</div>
</div>
