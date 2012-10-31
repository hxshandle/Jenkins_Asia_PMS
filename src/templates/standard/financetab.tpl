<div class="phaseMenualBar">
  {if $editBaseInfo}
    <button id="btnAddFinance" onclick="showAddFinanceDlg();">{#addphase#}</button>
   {/if}
</div>

<div class="financeList" id="financeList">
  {include file = "financedetails.tpl"}
</div>
<div id = "editFinanceDlg"></div>

{literal}
<script type="text/javascript">

    
    
  if(!window.__addFinanceDlgContent){
    window.__addFinanceDlgContent=$("addFinanceDlg").innerHTML;
    $("addFinanceDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddFinance",{
                                "contents":window.__addFinanceDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
                               
  function reloadFinance(){
    var theUrl = "manageprojectajax.php?action=reloadfinance&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("financeList").innerHTML=payload.responseText;
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


  function showAddFinanceDlg(){
    var url = "managefinance.php?action=showAddFinanceDlg";
    var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
  }
                 
</script>
{/literal}