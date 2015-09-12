
function filterOrder(param){
  var theUrl = "manageorder.php?action=filterOrder";
  var thePost = param || "";
  new Ajax.Request(theUrl, {
          method: 'post',
          postBody:thePost,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("orderTableContainer").innerHTML=payload.responseText;
            }
          }
      });    
}

function _buildOrderFilterParam(){
  var project = document.getElementById("criteriaProject").value;
  var order = document.getElementById("criteriaOrder").value;
  var customer = "-1";
  if(document.getElementById("criteriaCustomer")){
    customer = document.getElementById("criteriaCustomer").value;
  }
  var ret = "";
  ret = "projectId="+project+"&orderId="+order+"&customerName="+customer;
  return ret;
}

  function showOrderDlg(ctx){
    var dlg = new Control.Modal("priceOrderDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function priceOrderDlg(id){
    var orderId = id;
    var theUrl = "manageprojectajax.php?action=priceOrder&id="+orderId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText != ""){ 
             showOrderDlg(payload.responseText);
             }else{
                 alert("faild");
                }
            }
            });  
  }


  function updateOrderPrice(id) {
    var orderId = id;
    var theUrl = "manageprojectajax.php?action=saveOrder&id="+orderId;
    var _data = {
      orderId:id,
      endTime:$("newEndTime").value,
      currencyInner:$('targetFOBCurrencyInner').value,
      published:$('publishedFlag').value,
      currencyExt:$('targetFOBCurrencyExt').value,
      innerCost:$('newInnerCost').value,
      externalCost:$('newExternalCost').value
    };
   var _thePost = "&orderId="+id;
   _thePost +="&endTime="+$("newEndTime").value;
   _thePost +="&currencyInner="+$("targetFOBCurrencyInner").value;
   _thePost +="&published="+$("publishedFlag").value;
   _thePost +="&currencyExt="+$("targetFOBCurrencyExt").value;
   _thePost +="&innerCost="+$("newInnerCost").value;
   _thePost +="&externalCost="+$("newExternalCost").value;

   new Ajax.Request(theUrl,{
    method:'post',
    postBody:_thePost,
    onSuccess:function(payload){
      if(payload.responseText == "Ok"){
        refreshOrder();
        Control.Modal.close();
      }else{
        alert('Save Failed');
      }
    }
   });
  }

function refreshOrder(){
  filterOrder(_buildOrderFilterParam());  
}

function onOrderCriteriaProjectChange(el){
  filterOrder(_buildOrderFilterParam());
}

function onOrderCriteriaCustomerChange(el){
  filterOrder(_buildOrderFilterParam());
}

function onOrderCriteriaOrderChange(el){
  filterOrder(_buildOrderFilterParam());
}

function editOrderDlg(id){
  var url = "manageorder.php?action=editOrderDlg&oId="+id;
  window.open(url,'','height=500,width=600,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
}

function showOrderSubInfo(id){
  var url = "manageorder.php?action=showOrderSubInfo&oId="+id;
  window.open(url,'','height=500,width=600,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
}