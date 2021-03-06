
{config_load file=lng.conf section = "strings" scope="global" }
<table id="acc_msgs" cellpadding="0" cellspacing="0" border="0">
<thead>
  <tr>
    <th class="a"></th>
    <th class="b">{#actionNo#}</th>
    <th class="b">{#project#}</th>
    <th class="ce">{#customerComplianceNo#}</th>
    <th class="ce" style="text-align:right">{#issueDate#}&nbsp;&nbsp;</th>
    <th class="de">{#status#}</th>
  </tr>
</thead>

<tfoot>
  <tr>
    <td colspan="6"></td>
  </tr>
</tfoot>

{section name=quality loop=$qualitys}

{*Color-Mix*}
{if $smarty.section.quality.index % 2 == 0}
<tbody class="color-a" id="q_{$qualitys[quality].ID}">
{else}
<tbody class="color-b" id="q_{$qualitys[quality].ID}">
{/if}
  <tr id="quality-data-row-{$qualitys[quality].ID}">
    <td>
      {if $smarty.session.userRole == "1"}
      <a class="butn_link" href="#" onclick='deleteQuality("{$qualitys[quality].ID}")'>{#delete#}</a>
      {/if}
    </td>
    <td>
      <div class="toggle-in">
      <span class="acc-toggle" onclick="javascript:accord_quality.activate($$('#block_msgs .accordion_toggle')[{$smarty.section.quality.index}]);toggleAccordeon('accord_quality',this);"></span>
        <a href="javascript:void(0);" title="{$qualitys[quality].action_no}" onclick='openEditQualityDlg("{$qualitys[quality].ID}")'>{$qualitys[quality].action_no|truncate:35:"...":true}</a>
      </div>
    </td>
    <td>
      {$qualitys[quality].project_name|truncate:35:"...":true}
    </td>
    <td>
      {$qualitys[quality].quality_no|truncate:35:"...":true}
    </td>
    <td style="text-align:right">
        {$qualitys[quality].issue_date|truncate:"10":""}
      &nbsp;
    </td>
    <td>
      {$qualitys[quality].status}
      &nbsp;
    </td>
  </tr>

  <tr class="acc">
    <td colspan="6">
      <div class="accordion_toggle"></div>
      <div class="accordion_content">
        <div class="acc-in">
            {$qualitys[quality].action_no}
        </div>
      </div>
    </td>
  </tr>
</tbody>
{/section}

</table>