<!-- ecn impact table other -->
<table class="ecn-impact-table-other ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    {if $canDel==true}
      <th>Action</th>
    {/if}
    <th class="long-text">{#other_description#}</th>
    <th class="long-text">{#disposition#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        {if $canDel}
          <td><a href="javascript:void(0)" onclick="delEcnImpact({$row.ID},'ecn_impact_other',this)">Delete<i class="fa fa-close"></i></a></td>
        {/if}
        <td>{$row.other_description}</td>
        <td>{$row.other_disposition}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>