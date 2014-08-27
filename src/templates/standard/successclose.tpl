
<script>
  {if $callback}
  {literal}
  (function(){
  {/literal}
  window.opener.{$callback}();
  {literal}
  })();
  {/literal}
  {/if}
</script>

{literal}
<script>
  (function(){
    window.close();  
  })();
  
</script>
{/literal}