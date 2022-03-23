<script>
    import StarRating from 'svelte-star-rating';

</script>

<div class="px-5 py-5 shadow-xl mb-10 border-2 rounded border-blue-300">
    <h1 class="text-2xl mb-4 text-gray-600">Review Title</h1>
    <h1 class="text-xl mb-4 text-gray-600">
        Username &middot; created_at &middot; updated_at
    </h1>
    <StarRating rating={2} config={{ size: 18, showText: true }} />

    <div class="relative flex py-2 items-center">
        <div class="flex-grow border-t border-gray-400" />
        <div class="flex-grow border-t border-gray-400" />
    </div>

    <p class="text-xl mb-4 text-gray-600">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Volutpat blandit aliquam etiam erat.
        Pretium fusce id velit ut tortor pretium viverra suspendisse. Tempor commodo ullamcorper
        a lacus vestibulum. Magna fermentum iaculis eu non diam phasellus vestibulum lorem. Mi
        in nulla posuere sollicitudin aliquam ultrices sagittis orci. Arcu dui vivamus arcu
        felis bibendum ut tristique et. Libero id faucibus nisl tincidunt eget nullam. Nibh
        mauris cursus mattis molestie a iaculis at. Placerat in egestas erat imperdiet sed. Nisl
        vel pretium lectus quam id leo in vitae turpis.
    </p>
</div>