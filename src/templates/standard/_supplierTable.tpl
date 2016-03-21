{config_load file=lng.conf section = "strings" scope="global" }
{*Document table*}
<div class="supplierTableWrapper">
<table id="supplierTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
  <thead>
    <tr>
      <th class="b tx">{#supplier_name#}</th>
      <th class="b tx">{#jenkins_username#}</th>
      <th class="b tx">{#address#}</th>

    </tr>
  </thead>
  <tbody id="documentTBody">
    {section name=upplier loop=$suppliers}
        {if $smarty.section.index % 2 == 0}
          <tr class="color-a">
        {else}
          <tr class ="color-b">
        {/if}
            <td><a href="/managesupplier.php?action=show&id={$suppliers[upplier].ID}">{$suppliers[upplier].name}</a></td>
            <td>{$suppliers[upplier].name}</td>
            <td>{$suppliers[upplier].address}</td>

          </tr>
    {/section}
  </tbody>
</table>
</div>
