<!-- ecn impact table documentation -->
<table class="ecn-impact-table-documentation ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    <th>{#document_number#}</th>
    <th class="long-text">{#document_description#}</th>
    <th>{#document_attach#}</th>
    <th>{#remark_or_other#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        <td>{$row.document_number}</td>
        <td>{$row.document_description}</td>
        <td>Dco.....</td>
        <td>{$row.remark_or_other}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>