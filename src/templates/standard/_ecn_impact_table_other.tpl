<!-- ecn impact table other -->
<table class="ecn-impact-table-other ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    <th class="long-text">{#other_description#}</th>
    <th class="long-text">{#disposition#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        <td>{$row.other_description}</td>
        <td>{$row.other_disposition}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>