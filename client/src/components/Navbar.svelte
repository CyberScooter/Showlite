<script>
  import { goto } from '$app/navigation';
  import Cookie from 'js-cookie';
  import http from "$lib/http";
  import { getContext, onMount } from "svelte";
  const auth = getContext("store");
  const getAuth = auth.state;
  let search;
  let serverError;

  async function searchMovie() {
		const data = await http(fetch)(`movies/search?page=1&size=1&query=${search}`);

		if(data.error){
			serverError = data.error
		}

    if(data.length > 0){
      goto(`/movie/${data[0].id}`)
    }

  }

  async function logoutHandler(){
		auth.logout();

    goto("/")
  }
</script>

<nav class="bg-slate-800 border-gray-200 px-2 sm:px-4 py-2.5 bg-gray-800">
    <div class="container flex flex-wrap justify-between items-center mx-auto">
      <a href="/" class="flex items-center">
          <img src="/favicon.svg" class="mr-3 h-6 sm:h-10" alt="Showlite Logo" />
          <span class="self-center text-2xl font-semibold whitespace-nowrap text-white">Showlite</span>
      </a>

      <button data-collapse-toggle="mobile-menu" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 text-gray-400 hover:bg-gray-700 focus:ring-gray-600" aria-controls="mobile-menu-2" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
        <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
      </button>

      <div class="flex order-second">
        <div class="hidden relative mr-3 md:mr-0 md:block w-max-fit">
          <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
          </div>
          <form on:submit|preventDefault={() => searchMovie()} >
            <input type="text" bind:value={search} class="block p-2 pr-80 pl-10 text-gray-900 bg-gray-50 rounded-lg border border-gray-300 sm:text-sm focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search Showlite">
          </form>
        </div>
    </div>
      
      <div class="hidden w-full md:block md:w-auto" id="mobile-menu">
        <ul class="flex flex-col mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium">
          <li>
            <p on:click={() => goto("/")} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 border-b border-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700" aria-current="page">Home</p>
          </li>
          <li>
            <p on:click={() => goto("/about")} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">About</p>
          </li>
          <li>
            <p on:click={() => goto("/movies")} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Browse</p>
          </li>
          {#if $getAuth.authenticated}
            <li>
              <p on:click={() => goto("/watchlist")} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 border-b border-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Watchlist</p>
            </li>
            <li>
              <p on:click={logoutHandler} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ">Logout</p>
            </li>
          {:else}
            <li>
              <p on:click={() => goto("/auth/login")} class="cursor-pointer block py-2 pr-4 pl-3 text-gray-100 border-b border-gray-100 hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Login</p>
            </li>
          {/if}
          

        </ul>
      </div>
    </div>
  </nav>

  