
function filterQuality(param){
  var theUrl = "managequality.php?action=filterQuality";
  var thePost = param || "";
  new Ajax.Request(theUrl, {
          method: 'post',
          postBody:thePost,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("qualityTable").innerHTML=payload.responseText;
            }
          }
      });    
}


function updateFileId(id){
  alert(id);
}

function _buildQualityFilterParam(){
  var project = document.getElementById("criteriaProject").value;
  var customer = "-1";
  if(document.getElementById("criteriaCustomer")){
    customer = document.getElementById("criteriaCustomer").value;
  }
  var ret = "";
  ret = "projectId="+project+"&customerName="+customer;
  return ret;
}


function onCriteriaProjectChange(el){
  filterQuality(_buildQualityFilterParam());
}

function onCriteriaCustomerChange(el){
  filterQuality(_buildQualityFilterParam());
}


function onAddDetailsProjectChange(p){
  var pId = p.value;
  var theUrl = "managequality.php?action=getProjectQuality";
  var thePost = "id="+pId;
  new Ajax.Request(theUrl, {
          method: 'post',
          postBody:thePost,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var data = eval("("+payload.responseText+")");
              var opts = $("quality").options;
              _buildSelOpts(opts,data);
            }
          }
      });
}

function _buildSelOpts(opts,data,needChoose){
  data = data || [];
  opts.length = 0;
  needChoose = needChoose == undefined ? true : needChoose;
  if(needChoose){
    opts.add(new Option(unescape(MSGS.chooseone),"-1"));  
  }
  var dataRow;
  for ( var i=0;i<data.length;i++){
    dataRow = data[i];
    opts.add(new Option(dataRow.name,""+dataRow.id));
  }
}


function openEditQualityDlg(id){
  var url = "managequality.php?action=showEditDlg&id="+id;
  var win = window.open(url,'','height=500,width=800,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
}

function onAddQualitySelProjectChange(el){
  var val = el.value;
  if(val == "-1"){
    $("notify").options.length = 0;
    $('qualityNo').value='';
    return;
  }

  var theUrl = "manageprojectajax.php?action=getProjectNotifyList&id="+val;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var data = eval("("+payload.responseText+")");
              var opts = $("notify").options;
              _buildSelOpts(opts,data,false);
            }
          }
      });

  var theUrl = "manageprojectajax.php?action=getProjectNumber&id="+val;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              $('actionNo').value=payload.responseText+'-SCA-';
            }
          }
      });

}