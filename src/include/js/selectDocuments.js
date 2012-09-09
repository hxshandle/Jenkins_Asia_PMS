function filterSelDocument(param){
  var theUrl = "managedocument.php?action=filterDocument";
  var thePost = param || "";
  new Ajax.Request(theUrl, {
          method: 'post',
          postBody:thePost,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("documentTableContainer").innerHTML=payload.responseText;
            }
          }
      });    
}
function _buildSelFilterParam(){
  var project = document.getElementById("criteriaProject").value;
  var order = document.getElementById("criteriaOrder").value;
  var customer = document.getElementById("criteriaCustomer").value;
  var ret = "";
  ret = "isSelectedTable=1&projectId="+project+"&orderId="+order+"&customerName="+customer;
  return ret;
}
function onSelCriteriaProjectChange(el){
  filterSelDocument(_buildSelFilterParam());
}

function onSelCriteriaCustomerChange(el){
  filterSelDocument(_buildSelFilterParam());
}

function onSelCriteriaOrderChange(el){
  filterSelDocument(_buildSelFilterParam());
}

function getSelectedDocuments(){
  var chks = $$("input");
  var selDocuments = [];
  for (var i = 0 ; i < chks.length; i++){
    var item = chks[i];
    if(item.checked){
      var docName = item.getAttribute("docName");
      var docVer = item.getAttribute("docVer");
      var d = [item.value,docName,docVer];
      selDocuments.push(d);
    }
  }
  if(selDocuments.length === 0){
    alert("Please select a document");
  }else{
    window.opener.setSelectedDocuments(selDocuments);
    window.close();
  }
}
