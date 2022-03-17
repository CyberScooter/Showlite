<script>
	import StarRating from 'svelte-star-rating';

	const small_config = {
		size: 18,
		showText: true
	};
</script>

<div class="grid grid-cols-3 m-4">
	<div class="col-span-1 auto-cols-min">
		<img
			src="static/film-poster-placeholder.png"
			alt="Movie Cover"
			class="object-cover object-center w-48 h-238"
		/>
	</div>

	<div class="col-span-2 leading-10">
		<h1 class="text-2xl font-bold">Movie Title</h1>
		<h1>Movie Year | Duration | Age Restriction | Genre</h1>
		<StarRating rating={Number((Math.random() * 5).toFixed(2))} config={small_config} />
		<p
			style="display: -webkit-box !important;
        -webkit-line-clamp: 8;
        -webkit-box-orient: vertical;
        white-space: normal;"
			class="leading-5 truncate"
		>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at volutpat ex. Morbi sit amet
			risus et dui cursus semper sit amet ut sem. Morbi pretium elementum lorem, ut bibendum tortor
			facilisis eu. Cras quis sapien sit amet risus ullamcorper convallis. Proin interdum malesuada
			ultrices. Aliquam bibendum hendrerit augue, ut maximus velit eleifend facilisis. Aliquam non
			dolor egestas, fermentum justo nec, pellentesque felis. Vivamus rutrum ipsum sit amet
			vulputate mattis. Fusce dignissim fringilla ultricies. Suspendisse molestie eu massa at
			consectetur.
		</p>
	</div>
</div>
