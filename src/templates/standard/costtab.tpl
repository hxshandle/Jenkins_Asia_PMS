<div class="phaseMenualBar">
  {if $editBaseInfo}
    <button id="btnAddFinance" onclick="showAddCostDlg();">{#addphase#}</button>
   {/if}
</div>

<div class="costList" id="costList">
  {include file = "costtable.tpl"}
</div>
<div id = "editFinanceDlg"></div>

{literal}
<script type="text/javascript">
                               
  function reloadFinance(){
    var theUrl = "manageprojectajax.php?action=reloadfinance&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("costList").innerHTML=payload.responseText;
            var accord_cost = new accordion('cost-table');
          }
        }
      });
  }
    
  function delFinance(id){
    var financeId = id;
    var theUrl = "manageprojectajax.php?action=delfinance&id="+financeId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadFinance();
        }else{
          alert("del faild");
        }
      }
    });
  }


  function showAddCostDlg(){
    var url = "managecost.php?action=editform&projectId="+__projectId;
    var win = window.open(url,'','height=500,width=760,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
  }

                 
</script>
{/literal}