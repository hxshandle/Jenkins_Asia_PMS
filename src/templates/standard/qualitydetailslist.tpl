{config_load file=lng.conf section = "strings" scope="global" }
<div>
  <table>
    <thead>
      <tr>
        <th class="e">{#rejectDesc#}</th>
        <th class="3">{#quantity#}</th>
        <th class="e">{#requiredDesc#}</th>
        <th class="e">{#shortTermVerified#}</th>
        <th class="e">{#longTermVerified#}</th>

      </tr>
    </thead>
    {section name=item loop=$details}
      {if $smarty.section.item.index % 2 == 0}
      <tr class="color-a">
      {else}
      <tr class="color-b">
      {/if}
        <td> 
          <div class="toggle-in">
            <span class="acc-toggle" onclick="javascript:accord_qualityDetails.activate($$('#block_details .accordion_toggle')[{$smarty.section.item.index}]);toggleAccordeon('accord_qualityDetails',this);"></span>
              <a href="javascript:void(0);" onclick='showDetailsInfo({$details[item].ID})'>{$details[item].reject_desc}</a>
          </div>
        </td>
        <td> {$details[item].quantity}
        </td>
        <td> {$details[item].required_desc}</td>
        <td> {if $details[item].short_term_verified == 0 }{#no#}{else}{#yes#}{/if}</td>
        <td> {if $details[item].long_term_verified == 0 }{#no#}{else}{#yes#}{/if}</td>
      </tr>
      <tr class="acc">
        <td colspan="6">
          <div class="accordion_toggle"></div>
          <div class="accordion_content">
            <div class="acc-in">
                {foreach from=$details[item].files item=file}
                  <a href="{$file.datei}" target="blank">{$file.name}</a>
                {/foreach}
            </div>
          </div>
        </td>
      </tr>
    {/section}
  </table>
</div>