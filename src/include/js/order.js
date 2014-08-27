
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