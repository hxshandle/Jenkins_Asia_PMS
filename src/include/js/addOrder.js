function selectDocument(){
  var url = "managedocument.php?action=selectDocuments";
  var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
}

function setSelectedDocuments(documents){
  var el = $("documentList");
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
