{*latest version*}
{if $odd == 0}
  <tr class="color-a">
{else}
  <tr class="color-b">
{/if}
    {if $smarty.session.userRole == "1"}
    <td style="width:130px">
      <a class="butn_link" href="#" onclick='deletelatestument({$latest.ID})'>{#delete#}</a>
      <a class="butn_link" href="#" onclick='editlatestument({$latest.ID})'>{#edit#}</a>
    </td>
    {/if}
    <td style="height:auto">
      <div class="toggle-in">
        <span class="acc-toggle" style="height:20px;" onclick="javascript:accord_1.activate($$('#documentsTable .accordion_toggle')[{$idx}]);toggleAccordeon('documentTable',this);"></span>
        <a href="{$latest.download_url}" target="blank"><div>{$latest.name}</div></a>
      </div>
    </td>
    <td>{$latest.document_no}</td>
    <td>{$latest.revision}</td>
    <td>{$latest.project_name}</td>
    <td>{$latest.description}</td>
    <td>{$latest.order_name}</td>
    <td>{$latest.quality_name}</td>
    <td>{$latest.insert_date}</td>
</tr>
