<svelte:head>
	<title>Showlite: About</title>
	<meta name="robots" content="noindex nofollow" />
	<html lang="en" />
</svelte:head>

<div class="bg-gradient-to-r from-yellow-500 to-pink-500 h-auto">
	<div
		class="container mx-auto shadow-xl border-2 border-transparent shadow-2xl bg-white bg-opacity-80 h-screen"
	>
		<div class="ml-20 mr-20">
			<h1 class="text-3xl font-bold mt-10">About Us</h1>

			<div class="relative flex py-5 items-center">
				<div class="flex-grow border-t border-gray-400" />
				<!-- <span class="flex-shrink mx-4 text-gray-400">Content</span> -->
				<div class="flex-grow border-t border-gray-400" />
			</div>

			<p class="font-bold text-3xl mb-4">COM3014 GROUP 6</p>

			<p class="text-xl mb-6">
				<span>Showlite</span> is a fictious company that provides a full-stack website using microservices
				architecture for an online database of movie related information. Users may rate and comment
				on different movies in the database using the review system, where movie recommendations, popularity, and genres will be shown.
			</p>

            <p class="text-xl mb-6">Technologies being used in this project include Svelte front-end, Python and Express.js microservices each with a PostgreSQL database. Finally an api-gateway to connect the frontend with the appropriate microservices.</p>

            <p class="text-xl mb-6">This project was made for COM3014 Coursework 2 and for movie lovers 💕.</p>

			<p class="mb-4 text-2xl italic">Front-end made possible by:</p>

			<div class="ml-5 text-xl">
				<ul class="list-disc">
					<li>Andy Lee</li>
					<li>Hrithik Udae Lacximicant</li>
				</ul>
			</div>

			<p class="font-bold text-3xl mt-4">Credits</p>
			<p class="mb-4 text-2xl italic">Dataset used is publicly available on Kaggle, Link:</p>
			<a target="_blank" class="text-blue-600 font-bold mt-4" href="https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=links.csv">https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=links.csv</a>

		</div>
	</div>
</div>
