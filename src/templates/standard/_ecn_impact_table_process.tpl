<!-- ecn impact table process -->
<table class="ecn-impact-table-process ecn-impact-table" cellpadding="0" cellspacing="0">
  <thead>
    {if $canDel==true}
      <th>Action</th>
    {/if}
    <th>{#process_number#}</th>
    <th class="long-text">{#process_description#}</th>
    <th>{#document_attach#}</th>
    <th>{#remark_or_other#}</th>
    <th>{#disposition_cost#}</th>
  </thead>
  <tbody>
    {foreach from=$data item=row}
      <tr>
        {if $canDel}
          <td><a href="javascript:void(0)" onclick="delEcnImpact({$row.ID},'ecn_impact_process',this)">Delete<i class="fa fa-close"></i></a></td>
        {/if}
        <td>{$row.process_number}</td>
        <td>{$row.process_description}</td>
        <td>
          <!-- attachment -->
          {foreach from=$row.attachments item=doc}
            <input type="hidden" name="documentid" value="{$doc.document_id}">
            <a class="download_link" href="{$doc.datei}" title="{$doc.name}"><span class="document_no">{$doc.document_no} : {$doc.revision}</span></a>
            <br/>
          {/foreach}
        </td>
        <td>{$row.remark_or_other}</td>
        <td>{$row.disposition_cost}</td>
      </tr>
    {/foreach}
  </tbody>
</table>