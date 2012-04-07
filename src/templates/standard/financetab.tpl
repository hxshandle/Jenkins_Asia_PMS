<div class="phaseMenualBar">
  {if $editBaseInfo}
    <button id="btnAddFinance">{#addphase#}</button>
   {/if}
</div>
<div id="addFinanceDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addfinance.tpl" title="add finance"}
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
    
    
  function showFinanceDlg(ctx){
    var dlg = new Control.Modal("editFinanceDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function showEditFinanceDlg(id){
    var financeId = id;
    var theUrl = "manageprojectajax.php?action=editFinance&id="+financeId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          showFinanceDlg(payload.responseText);
        }else{
          alert("faild");
        }
      }
    });  
  }

        
     //修改页面的保存js
    function editFinance(financeId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=saveFinance&projectId="+__projectId;
      thePost +="&financeId="+financeId;
      var jstargetFOBCurrencyInner = $("targetFOBCurrencyInner").value;
      thePost +="&currencyInner="+jstargetFOBCurrencyInner;
      var jsnewExternalCost = $("newExternalCost").value;    
      thePost +="&externalCost="+jsnewExternalCost;    
      var jsnewInnerCost = $("newInnerCost").value;   
      thePost +="&innerCost="+jsnewInnerCost;   
      var jstargetFOBCurrencyExt = $("targetFOBCurrencyExt").value;
      thePost +="&currencyExt="+jstargetFOBCurrencyExt;
      var jspublishedFlag = $("publishedFlag").value;
      thePost +="&publishedFlag="+jspublishedFlag;          
      var jsapprovedFlag = $("approvedFlag").value;
      thePost +="&approvedFlag="+jsapprovedFlag;                    
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            reloadFinance();
            Control.Modal.close();
          }
        }
      });
    }             
</script>
{/literal}