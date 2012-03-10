<?php /* Smarty version 2.6.19, created on 2012-03-10 13:59:25
         compiled from addphase.tpl */ ?>
<div class="dlgRow">
  <label style="margin:0 50px 0 0"><?php echo $this->_config[0]['vars']['phasename']; ?>
</label>
  <input id="newPhaseName"></input>
 </div>
<table cellpadding=0 cellspacing=0 id="deliverableItemTable" style="width:100%">
  <tbody id ="deliverableItemTbody">
  <tr>
    <th><?php echo $this->_config[0]['vars']['name']; ?>
</th>
    <th><?php echo $this->_config[0]['vars']['startDate']; ?>
</th>
    <th><?php echo $this->_config[0]['vars']['ended']; ?>
</th>
    <th></th>
  </tr>
  </tbody>
</table>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSavePhase" onclick="savePhase();"><?php echo $this->_config[0]['vars']['save']; ?>
</button>
<button id="dlgBtnAddPhase" onclick="addDeliverableItem();"><?php echo $this->_config[0]['vars']['addDeliverableItem']; ?>
</button>
</div>
<script>
  var __projectId= <?php echo $this->_tpl_vars['project']['ID']; ?>
;
</script>

<?php echo '
  <script type="text/javascript">
    
    function delDeliverableItem(arg){
      var b = $(arg);
      b.parentNode.parentNode.remove();
    }
    function addDeliverableItem(){
      var templateStr= \'<tr class="newDeliverableItem"><td><input value = ""></input></td><td><input value = ""></input></td><td><input value = ""></input></td><td><a class="tool_del" href="javascript:void(0);"onclick="delDeliverableItem(this);"></a></td></tr>\';
      var tRoot = $("deliverableItemTbody");
      tRoot.insert(templateStr);  
    }
      
    function savePhase(){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addPhase&projectId="+__projectId;
      var phaseName = $("newPhaseName").value;
      thePost +="&phaseName="+phaseName;
      var newItems =$$("tr.newDeliverableItem");
      var newItemsStr="";
      newItems.each(function(tr){
        var children=tr.childElements();
        newItemsStr +=""+children[0].firstChild.value+":"+children[1].firstChild.value+":"+children[2].firstChild.value+","
      });
      thePost +="&newDeliverableItems="+ newItemsStr.substr(0,newItemsStr.length-1);
      new Ajax.Request(theUrl, {
		  method: \'post\',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            alert("ok");
            Control.Modal.close();
          }
        }
      });
    }
      
      
  </script>
'; ?>