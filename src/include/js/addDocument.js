var g_lastProjectId = -1;
function afterUploadFile(fileId){
  var el = document.getElementById('fileId');
  el.value =""+fileId;
}

function onSelProjectChange(evt){
  var val = evt.value;
  switch(val){
    case "-1":
      g_lastProjectId = val;
      _clearProjectSubInfo();
      window.__swfu.setButtonDisabled(true);
      break;
    default:
      g_lastProjectId = val;
      getProjectSubInfo(val);
      window.__swfu.setButtonDisabled(false);
      window.__swfu.setPostParams({id:val,"userId":__userId});
      break;
  }
}
function getProjectSubInfo(id){
    var theUrl = "manageprojectajax.php?action=getProjectSubInfo&&id="+id;
    new Ajax.Request(theUrl, {
            method: 'get',
            onSuccess:function(payload) {
              if (payload.responseText != ""){
                var data = eval("("+payload.responseText+")");
                refreshProjectSubInfo(data);
              }
            }
        });    
}

function _clearProjectSubInfo(){
  var taskSel = document.getElementById('task');
  var opts = taskSel.options;
  opts.length = 0;
  opts.add(new Option(unescape(MSGS.chooseone),"-1"));
  
  var orderSel = document.getElementById('order');
  orderSel.options.length = 0;
  orderSel.options.add(new Option(unescape(MSGS.chooseone),"-1"));
}

function refreshProjectSubInfo(data){
  //refresh task
  var taskSel = document.getElementById('task');
  var opts = taskSel.options;
  _buildSelOpts(opts,data.tasks);

  //refresh order
  var orderSel = document.getElementById('order');
  opts = orderSel.options;
  _buildSelOpts(opts,data.orders);

  //refresh quality
  var qualitySel = document.getElementById('quality');
  opts = qualitySel.options;
  _buildSelOpts(opts,data.qualitys);
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

function onCriteriaProjectChange(el){
  var val = el.value;
}

function onCriteriaCustomerChange(el){
  var val = el.value;
}

function onCriteriaOrderChange(el){
  var val = el.value;
}

(function(){

  function disableUploadButton(){
    if(window.__swfu && window.__swfu.setButtonDisabled){
      window.__swfu.setButtonDisabled(true);
      var el = document.getElementById("form_adddocument");
      el.style.display="none";
    }else{
       setTimeout(disableUploadButton,500);
    }
  }
  setTimeout(disableUploadButton,500);


})();
