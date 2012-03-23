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
    <li class="tab"><a href="#tabphase">{#phase#}</a></li>  
    <li class="tab"><a href="#tabfinance">{#finance#}</a></li>
    <li class="tab"><a href="#tabsample">{#sample#}</a></li>
    <li class="tab"><a href="#tabteammember">{#teammember#}</a></li>
    <li class="tab"><a href="#tabtask">{#task#}</a></li>
    <li class="tab"><a href="#tabecn">{#ecn#}</a></li>
    <li class="tab"><a href="#tabquality">{#quality#}</a></li>
    <li class="tab"><a href="#taborder">{#order#}</a></li>
    <li class="tab"><a href="#tabpurchase">{#purchase#}</a></li>
  </ul>
  
  <div id="tabphase">{include file="phasetab.tpl"}</div>
  <div id="tabfinance">{include file="financetab.tpl"}</div>
  <div id="tabsample">{include file="sampletab.tpl"}</div>
  <div id="tabteammember">{include file="teammembertab.tpl"}</div>
  <div id="tabtask">{include file="tasktab.tpl"}</div>
  <div id="tabecn">{include file="ecntab.tpl"}</div>
  <div id="tabquality">{include file="qualitytab.tpl"}</div>
  <div id="taborder">{include file="ordertab.tpl"}</div>
  <div id="tabpurchase">{include file="purchasetab.tpl"}</div>
  
</div>
<div class="content-spacer"></div>
  
<script type="text/javascript">
  var __tabs=new Control.Tabs('tabs_example_one');
  __tabs.first();
  
</script>