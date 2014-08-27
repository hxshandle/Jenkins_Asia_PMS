function selectDocument(listEl){
  var url = "managedocument.php?action=selectDocuments";
  var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
  window.__documentListEl = listEl;
}

function onAddOrderSelProjectChange(val){
  var theUrl = "manageprojectajax.php?action=getProjectSubInfo&&id="+val.value;
    new Ajax.Request(theUrl, {
            method: 'get',
            onSuccess:function(payload) {
              if (payload.responseText != ""){
                var data = eval("("+payload.responseText+")");
                refreshQualityAndECN(data);
              }
            }
        });
}

function refreshQualityAndECN(data){
  var qualityIssueNote = document.getElementById('qualityIssueNote');
  var opts = qualityIssueNote.options;
  _buildSelOpts(opts,data.qualitys);

  var ECNNote = document.getElementById('ECNNote');
  var opts = ECNNote.options;
  _buildSelOpts(opts,data.ecns);

}

function _buildSelOpts(opts,data){
  data = data || [];
  opts.length = 0;
  var dataRow;
  for ( var i=0;i<data.length;i++){
    dataRow = data[i];
    opts.add(new Option(dataRow.name,""+dataRow.id));
  }
}

function setSelectedDocuments(documents){
  var el = $(window.__documentListEl);
  var val = [];
  for (var i = 0 ; i < documents.length; i++){
    var d = documents[i];
    var liEl = document.createElement("li");
    el.appendChild(liEl);
    liEl.innerHTML = d[1]+":"+d[2];
    val.push(d[0]+":"+d[1]+":"+d[2]);
  }
  $("files").value = val.join(",");

}

function resetDocuments(){
  $("documentList").innerHTML = "";
  $("files").value = "";
}
