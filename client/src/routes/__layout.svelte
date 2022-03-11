<script context="module">
	import AuthStore from "$lib/stores/auth";
	let capturing = false;
	import { setContext } from "svelte";
  </script>

<script>
	import '../app.css';
	import Navbar from '../components/navbar.svelte';
	

	import { session } from "$app/stores";

	setContext("store", new AuthStore(session));

	console.log($session);
</script>

<Navbar />
<slot />
