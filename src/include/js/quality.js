
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

function _buildQualityFilterParam(){
  var project = document.getElementById("criteriaProject").value;
  var customer = document.getElementById("criteriaCustomer").value;
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

function _buildSelOpts(opts,data){
  data = data || [];
  opts.length = 0;
  opts.add(new Option(unescape(MSGS.chooseone),"-1"));
  var dataRow;
  for ( var i=0;i<data.length;i++){
    dataRow = data[i];
    opts.add(new Option(dataRow.name,""+dataRow.id));
  }
}
