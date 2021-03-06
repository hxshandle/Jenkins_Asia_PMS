<!-- ecn impact table tool -->
<table class="ecn-impact-table-tool ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    {if $canDel==true}
      <th>Action</th>
    {/if}
    <th>{#tool_number#}</th>
    <th class="long-text">{#tool_description#}</th>
    <th>{#disposition#}</th>
    <th class="long-text">{#remark_or_other#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        {if $canDel}
          <td><a href="javascript:void(0)" onclick="delEcnImpact({$row.ID},'ecn_impact_tool',this)">Delete<i class="fa fa-close"></i></a></td>
        {/if}
        <td>{$row.tool_number}</td>
        <td>{$row.tool_description}</td>
        <td>{$row.disposition_type|regex_replace:"/_/":" "|upper}</td>
        <td>{$row.remark_or_other}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>