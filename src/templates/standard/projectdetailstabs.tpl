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
    {if $smarty.session.userRole == 1 || $smarty.session.userRole == 3 || $isProjectLeader}  
      <li class="tab"><a href="#tabfinance">{#finance#}</a></li>
    {/if}
    {if $smarty.session.userRole <=5}
    <li class="tab"><a href="#tabsample">{#sample#}</a></li>
    {/if}
    <li class="tab"><a href="#tabteammember">{#teammember#}</a></li>
    {if $smarty.session.userRole <=5}
    <li class="tab"><a href="#tabecn">{#ecn#}</a></li>
    {/if}
    {if $smarty.session.userRole ==1  || $smarty.session.userRole ==3 || $smarty.session.userRole ==6 || $smarty.session.userRole ==7}
      <li class="tab"><a href="#tabquality">{#quality#}</a></li>
      <li class="tab"><a href="#taborder">{#order#}</a></li>
    {elseif $smarty.session.userRole == 4 and $isProjectLeader}
      <li class="tab"><a href="#tabquality">{#quality#}</a></li>
      <li class="tab"><a href="#taborder">{#order#}</a></li>
    {/if}
    
    {if $smarty.session.userRole ==1 || $smarty.session.userRole ==3 || $smarty.session.userRole ==8 || $smarty.session.userRole ==9}
      <li class="tab"><a href="#tabpurchase">{#purchase#}</a></li>
    {/if}
    
  </ul>
  
  <div id="tabphase">{include file="phasetab.tpl"}</div>
  {if $smarty.session.userRole == 1 || $smarty.session.userRole == 3 || $isProjectLeader}
    <div id="tabfinance">{include file="financetab.tpl"}</div>
  {/if}
  {if $smarty.session.userRole <=5}
  <div id="tabsample">{include file="sampletab.tpl"}</div>
  {/if}
  <div id="tabteammember">{include file="teammembertab.tpl"}</div>
  {if $smarty.session.userRole <=5}
    <div id="tabecn">{include file="ecntab.tpl"}</div>
  {/if}
  {if $smarty.session.userRole ==1 || $smarty.session.userRole ==3 || $smarty.session.userRole ==6 || $smarty.session.userRole ==7}
    <div id="tabquality">{include file="qualitytab.tpl"}</div>
    <div id="taborder">{include file="ordertab.tpl"}</div>
  {elseif $smarty.session.userRole == 4 and $isProjectLeader}
    <div id="tabquality">{include file="qualitytab.tpl"}</div>
    <div id="taborder">{include file="ordertab.tpl"}</div>
  {/if}

  {if $smarty.session.userRole ==1 || $smarty.session.userRole ==3 || $smarty.session.userRole ==8 || $smarty.session.userRole ==9}
  <div id="tabpurchase">{include file="purchasetab.tpl"}</div>
  {/if}
  
</div>
<div class="content-spacer"></div>
  
<script type="text/javascript">
  var __tabs=new Control.Tabs('tabs_example_one');
  __tabs.first();
  
</script>