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
    {section name=doc loop=$documents}
        {if $smarty.section.doc.index % 2 == 0}
          <tr class="color-a">
        {else}
          <tr class ="color-b">
        {/if}
            {if $smarty.session.userRole == "1"}
            <td style="width:130px">
              <a class="butn_link" href="#" onclick='deleteDocument({$documents[doc].ID})'>{#delete#}</a>
              <a class="butn_link" href="#" onclick='editDocument({$documents[doc].ID})'>{#edit#}</a>
            </td>
            {/if}
            <td><a href="{$documents[doc].download_url}" target="blank">{$documents[doc].name}</a></td>
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
</div>
