{include file="header.tpl" jsload = "ajax"}
{include file="tabsmenue-project.tpl" calendartab = "active"}
<div id="content-left">
<div id="content-left-in">
<div class="miles">
  <h1>{$project.name|truncate:45:"...":true}<span>/ {#gantt#}</span></h1>
  <div class="content-spacer"></div>
  <div class="headline">
    <a href="javascript:void(0);" id="cal_toggle" class="win_block" onclick = "toggleBlock('cal');"></a>
    <h2><img src="./templates/standard/images/symbols/miles.png" alt="" />{#gantt#}</h2>
      <div class="wintools">
        <div class = "progress" id = "progress" style = "display:none;">
        <img src = "templates/standard/images/symbols/loader-cal.gif" />
        </div>
    </div>
  </div>
  <div class="block">
    <div id ="thecal" class='bigcal' style="height:500px;"></div>
  </div>

</div> {*Miles END*}
<div class="content-spacer"></div>
</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
<script>
changeshow('resourcecalendar.php?action=getcal','thecal','progress');
</script>