{config_load file=lng.conf section = "strings" scope="global" }
{*Document table*}
<div class="documentTableWrapper">
<table id="documentsTable" cellspacing="0" cellpadding="0" border="0" style="width:1400px">
  <thead>
    <tr>
      {if $smarty.session.userRole == "1"}
      <th><Action/th>
      {/if}
      <th class="b tx">{#documentName#}</th>
      <th class="b tx">{#documentNo#}</th>
      <th class="b tx" style='width:80px'>{#revision#}</th>
      <th class="b tx">{#project#}</th>
      <th class="b tx">{#description#}</th>
      <th class="b tx">{#order#}</th>
      <th class="b tx">{#quality#}</th>
      <th class="b tx">{#uploadDate#}</th>
    </tr>
  </thead>
  <tbody id="documentTBody">
    {foreach from=$groupedDocuments key=k item=v name=foo}
      {if $smarty.foreach.foo.index %2 ==0}
        {include file='_documentsTable.tpl' odd=0 latest=$v.latest old=$v.old idx=$smarty.foreach.foo.index}
      {else}
        {include file='_documentsTable.tpl' odd=1 latest=$v.latest old=$v.old idx=$smarty.foreach.foo.index}
      {/if}
    {/foreach}
  </tbody>
</table>
</div>
{literal}
  <script type = "text/javascript">
    var accord_1 = new accordion('acc_1');
  </script>
{/literal}
