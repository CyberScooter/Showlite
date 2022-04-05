<script>
  import { createEventDispatcher } from "svelte";
  const dispatch = createEventDispatcher();

  export let page;

  export let labels = {
    first: "First",
    // last: "Last",
    next: "Next",
    previous: "Previous"
  };

  function onChange(page) {
    dispatch("pageChange", {page});

  }
</script>

<style>
  .active {
    background-color: rgb(150, 150, 235);
    color: white;
  }

  ul {
    flex: 1;
    float: right;
    list-style: none;
  }

  li {
    float: left;
  }

  button {
    background: transparent;
    border: 1px solid #ccc;
    padding: 5px 10px;
    margin-left: 3px;
    float: left;
    cursor: pointer;
  }
</style>

<ul>
  <li>
    <button disabled={page === 0} on:click={() => onChange(0)}>
      {labels.first}
    </button>
  </li>
  <li>
    <button disabled={page === 0} on:click={() => onChange(page - 1)}>
      {labels.previous}
    </button>
  </li>
  <li>
    <button
      on:click={() => onChange(page + 1)}>
      {labels.next}
    </button>
  </li>
  <!-- <li>
    <button  on:click={e => onChange(e, "end")}>
      {labels.last}
    </button>
  </li> -->
</ul>