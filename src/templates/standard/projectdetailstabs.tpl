<div class="headline">
  <a href="javascript:void(0);" id="projectdetailstab_toggle" class="win_block" onclick = "toggleBlock('projectdetailstab');"></a>

  <div class="wintools">
    <div class = "progress" id = "progress" style = "display:none;">
      <img src = "templates/standard/images/symbols/loader-cal.gif" />
    </div>
  </div>
  <h2>
    <img src="./templates/standard/images/symbols/projects.png" alt="" />{#projectdetails#}
  </h2>
</div>
  
<div  id ="projectdetailstab" class="block_in_wrapper">
  
  <ul id="tabs_example_one" class="subsection_tabs">  
    <li class="tab"><a href="#phase">{#phase#}</a></li>  
    <li class="tab"><a href="#finance">{#finance#}</a></li>
    <li class="tab"><a href="#sample">{#sample#}</a></li>
    <li class="tab"><a href="#teammember">{#teammember#}</a></li>
    <li class="tab"><a href="#task">{#task#}</a></li>
    <li class="tab"><a href="#ecn">{#ecn#}</a></li>
    <li class="tab"><a href="#quality">{#quality#}</a></li>
    <li class="tab"><a href="#order">{#order#}</a></li>
  </ul>
  
  <div id="phase">{include file="phasetab.tpl"}</div>
  <div id="finance">{include file="financetab.tpl"}</div>
  <div id="sample">{include file="sampletab.tpl"}</div>
  <div id="teammember">{include file="teammembertab.tpl"}</div>
  <div id="task">{include file="tasktab.tpl"}</div>
  <div id="ecn">{include file="ecntab.tpl"}</div>
  <div id="quality">{include file="qualitytab.tpl"}</div>
  <div id="order">{include file="ordertab.tpl"}</div>
  
  
</div>
  
<script type="text/javascript">
  var __tabs=new Control.Tabs('tabs_example_one');
  __tabs.first();
  
</script>