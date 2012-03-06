<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phasename#}</label>
  <input id="phase"></input>
 </div>
<table cellpadding=0 cellspacing=0 id="deliverableItemTable" style="width:100%">
  <tbody id ="deliverableItemTbody">
  <tr>
    <th>{#name#}</th>
    <th>{#startDate#}</th>
    <th>{#ended#}</th>
    <th></th>
  </tr>
  <tr><td><input value = ""></input></td><td><input value = ""></input></td><td><input value = ""></input></td><td><a class="tool_del" href="javascript:void(0);"onclick="delDeliverableItem(this);"></a></td></tr>
  </tbody>
</table>
<div style="margin:10px 0 0 0">
<button id="dlgBtnSavePhase" onclick="savePhase();">{#save#}</button>
<button id="dlgBtnAddPhase" onclick="addDeliverableItem();">{#addDeliverableItem#}</button>
<div>

{literal}
  <script type="text/javascript">
    
    function delDeliverableItem(arg){
      var b = $(arg);
      b.parentNode.parentNode.remove();
    }
    function addDeliverableItem(){
      var templateStr= '<tr><td><input value = ""></input></td><td><input value = ""></input></td><td><input value = ""></input></td><td><a class="tool_del" href="javascript:void(0);"onclick="delDeliverableItem(this);"></a></td></tr>';
      var tRoot = $("deliverableItemTbody");
      tRoot.insert(templateStr);  
    }
      
    function savePhase(){
    }
      
      
      var theCal = new calendar({$theM},{$theY});
			theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			theCal.relateTo = "end";
			theCal.dateFormat = "{$settings.dateformat}";
			theCal.getDatepicker("add_project");  
      
  </script>
{/literal}