{config_load file=lng.conf section = "strings" scope="global" }
{*Document table*}
<div class="documentTableWrapper">
<table id="ecntablele" cellspacing="0" cellpadding="0" border="0" style="width:1200px">
  <thead>
    <tr>   
      <th>{#operate#}</th>
      <th>{#ecnname#}</th>
      <th>{#projectname#}</th>
      <th>{#order#}</th>
      <th>{#quality#}</th>
      <th>{#createby#}</th>
      <th>{#status#}</th>
      <th>{#createtime#}</th>
  </thead>
  <tbody id="ecnTBody">
  {section name = ecn loop = $ecntable}
    {if $smarty.section.ecn.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td>
          {if $ecntable[ecn].status == "1"}
            {if $smarty.session.userRole == 3 || $smarty.session.userRole == 1}
              <a class="butn_link" onclick="javascript:submitAction('{$ecntable[ecn].ID}','approve');return false;">{#approve#}</a>
              <a class="butn_link" onclick="javascript:submitAction('{$ecntable[ecn].ID}','reject');return false;">{#reject#}</a>
            {/if}
          {/if}
          {if $ecntable[ecn].status == 1}
            {if $smarty.session.userid == $ecntable[ecn].submitter || $smarty.session.userRole == 3 || $smarty.session.userRole == 1}
              <a class="butn_link" onclick="javascript:uploadECNFile({$ecntable[ecn].ID});return false;">{#upload#}</a>
            {/if}
          {/if}
          

      </td>
      <td  align  = "center"><a href="#" onclick="openUploadECNFile({$ecntable[ecn].ID})">{$ecntable[ecn].name}</a></td>
      <td  align  = "center">{$ecntable[ecn].projectName}</td>
      <td  align  = "center">{$ecntable[ecn].orderName}</td>
      <td  align  = "center">{$ecntable[ecn].qualityName}</td>
      <td  align  = "center">{$ecntable[ecn].submit_by}</td>
      <td  align  = "center">{dispstatus statusId =$ecntable[ecn].status}</td>
      <td  align  = "center">{$ecntable[ecn].submit_time}</td>
    </tr>
  {/section}
  </tbody>
</table>
</div>
<script>
{literal}
  function openUploadECNFile(id){
    var url = "manageecn.php?action=viewUploadFile&id="+id;
    var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');

  }
{/literal}
</script>