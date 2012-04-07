{include file="header.tpl" jsload = "ajax"}
{include file="tabsmenue-project.tpl" calendartab = "active"}
<div id="content-left">
<div id="content-left-in">
<div class="miles">
  <h1>{$project.name|truncate:45:"...":true}<span>/ {#resourceCal#}</span></h1>
  <div class="content-spacer"></div>
  <div class="headline">
    <a href="javascript:void(0);" id="cal_toggle" class="win_block" onclick = "toggleBlock('cal');"></a>
    <h2><img src="./templates/standard/images/symbols/miles.png" alt="" />{#resourceCal#}</h2>
      <div class="wintools">
        <div class = "progress" id = "progress" style = "display:none;">
        <img src = "templates/standard/images/symbols/loader-cal.gif" />
        </div>
    </div>
  </div>
  <div class="block">
    <div style="margin:10px 0">
      {#selectUser#}
      <select id = "user" name  ="user" onchange="getResourceCal(this);">
          <option value="-1">{#chooseone#}</option>
        {section name=user loop = $users}
          <option value="{$users[user].user}">{$users[user].name}</option>
        {/section}
      </select>
    </div>
    <div id ="thecal" class='bigcal' style="height:500px;"></div>
  </div>

</div> {*Miles END*}
<div class="content-spacer"></div>
</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
<script>
{literal}
function getResourceCal(arg){
  if(arg.value==-1){
    return;
  }
{/literal}
  changeshow('resourcecalendar.php?action=getcal&&userId='+arg.value+'&&id={$project.ID}','thecal','progress');
{literal}
}
{/literal}


{literal}
function getResourceCalByMonth(year,month){
{/literal}
  var userId = $("user").value;
  changeshow('resourcecalendar.php?action=getcal&&y='+year+'&&m='+month+'&&userId='+userId+'&&id={$project.ID}','thecal','progress');
{literal}
}
{/literal}
</script>