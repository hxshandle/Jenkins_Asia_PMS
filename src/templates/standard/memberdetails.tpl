{config_load file=lng.conf section = "strings" scope="global" }
<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#membername#}</th>
      <th>{#title#}</th>
      <th>{#location#}</th>
      <th>{#email#}</th>
      <th>{#phone#}</th>
    <tr>
  {section name = member loop = $memberTab}
     {if $smarty.section.member.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center">{$memberTab[member].name}</td>
      <td  align  = "center">{$memberTab[member].title}</td>
      <td  align  = "center">{$memberTab[member].location}</td>
      <td  align  = "center">{$memberTab[member].email}</td>
      <td  align  = "center">
          {$memberTab[member].tel1}
          {if $memberTab[member].tel1!=null&&$memberTab[member].tel2!=null}/{/if}
          {$memberTab[member].tel2}
      </td>
      <td align  = "center">
        <a class="tool_del" href="javascript:void(0);"onclick="delMember({$memberTab[member].user},{$memberTab[member].project});"></a>
      </td>
    </tr>
  {/section}
</table>
  
