{config_load file=lng.conf section = "strings" scope="global" }
<table id="documentsTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
  <thead>
    <tr>
      <th class="b">{#chooseone#}</th>
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
    {section name=doc loop=$documents}
        {if $smarty.section.doc.index % 2 == 0}
          <tr class="color-a">
        {else}
          <tr class ="color-b">
        {/if}
        
            <td><input type="checkbox" value="{$documents[doc].ID}" docName="{$documents[doc].name}" docVer = "{$documents[doc].revision}" docNo="{$documents[doc].document_no}" onchange='autoFullNewDocForm(this,"{$documents[doc].name}","{$documents[doc].document_no}","{$documents[doc].project}","{$documents[doc].order}","{$documents[doc].quality}","{$documents[doc].visibility}")'></input></td>
            <td>{$documents[doc].name}</td>
            <td>{$documents[doc].document_no}</td>
            <td>{$documents[doc].revision}</td>
            <td>{$documents[doc].project_name}</td>
            <td>{$documents[doc].description}</td>
            <td>{$documents[doc].order_name}</td>
            <td>{$documents[doc].quality_name}</td>
            <td>{$documents[doc].insert_date}</td>
          </tr>
    {/section}
  </tbody>
</table>