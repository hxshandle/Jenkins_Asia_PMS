<!-- ecn impact table process -->
<table class="ecn-impact-table-process ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    <th>{#process_number#}</th>
    <th class="long-text">{#process_description#}</th>
    <th>{#document_attach#}</th>
    <th>{#remark_or_other#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        <td>{$row.process_number}</td>
        <td>{$row.process_description}</td>
        <td>Dco.....</td>
        <td>{$row.remark_or_other}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>