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
        <td> <a href="javascript:void(0);" onclick='showDetailsInfo({$details[item].ID})'>{$details[item].reject_desc}</a></td>
        <td> {$details[item].quantity}</td>
        <td> {$details[item].required_desc}</td>
        <td> {if $details[item].short_term_verified == 0 }{#no#}{else}{#yes#}{/if}</td>
        <td> {if $details[item].long_term_verified == 0 }{#no#}{else}{#yes#}{/if}</td>
      </tr>
    {/section}
  </table>
</div>