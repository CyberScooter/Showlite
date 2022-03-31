<script>
    import StarRating from 'svelte-star-rating';
    export let data;
    export let ind;

</script>

<div class="px-5 py-5 shadow-xl mb-10 border-2 rounded border-blue-300">
    <h1 class="text-2xl mb-4 text-gray-600">{data.title}</h1>
    <h1 class="text-xl mb-4 text-gray-600">
        {data.username} &middot; {new Date(data.created_at)}
    </h1>
    <StarRating rating={data.rating} config={{ size: 18, showText: true }} />

    <div class="relative flex py-2 items-center">
        <div class="flex-grow border-t border-gray-400" />
        <div class="flex-grow border-t border-gray-400" />
    </div>

    <p id="review-{ind}"class="text-xl mb-4 text-gray-600">
        {data.comment}
    </p>
</div>