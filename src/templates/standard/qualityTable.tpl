
{config_load file=lng.conf section = "strings" scope="global" }
<table id="acc_msgs" cellpadding="0" cellspacing="0" border="0">
<thead>
  <tr>
    <th class="a"></th>
    <th class="b">{#actionNo#}</th>
    <th class="ce" style="text-align:right">{#issueDate#}&nbsp;&nbsp;</th>
    <th class="de">{#acknowledgeBy#}</th>
    <th class="e">{#lotQuantity#}</th>
    <th class="tools"></th>
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
  <tr>
    <td>

    </td>
    <td>
      <div class="toggle-in">
      <span class="acc-toggle" onclick="javascript:accord_quality.activate($$('#block_msgs .accordion_toggle')[{$smarty.section.quality.index}]);toggleAccordeon('accord_quality',this);"></span>
        <a href="javascript:void(0);" title="{$qualitys[quality].action_no}" onclick='showQualityDetails("{$qualitys[quality].ID}")'>{$qualitys[quality].action_no|truncate:35:"...":true}</a>
      </div>
    </td>
    <td style="text-align:right">
        {$qualitys[quality].issue_date|truncate:"10":""}
      &nbsp;
    </td>
    <td>
      {$qualitys[quality].acknowledge_by}
      &nbsp;
    </td>
    <td>{$qualitys[quality].lot_quantity}</td>
    <td class="tools">
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