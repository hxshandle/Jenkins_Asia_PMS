<!-- ecn impact table part -->
<table class="ecn-impact-table-part ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    {if $canDel==true}
      <th>Action</th>
    {/if}
    <th>{#part_number#}</th>
    <th>{#quantity_in_store#}</th>
    <th class="long-text">{#part_description#}</th>
    <th>{#cost_per_part#}</th>
    <th>{#disposition#}</th>
    <th class="long-text">{#remark_or_other#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        {if $canDel}
          <td><a href="javascript:void(0)" onclick="delEcnImpact({$row.ID},'ecn_impact_part',this)">Delete<i class="fa fa-close"></i></a></td>
        {/if}
        <td>{$row.part_number}</td>
        <td>{$row.quantity_in_store}</td>
        <td>{$row.part_description}</td>
        <td>{$row.cost_per_part}</td>
        <td>{$row.disposition_type|regex_replace:"/_/":" "|upper}</td>
        <td>{$row.remark_or_other}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>
