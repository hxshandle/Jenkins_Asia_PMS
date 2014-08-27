function selectDocument(ul,ipt){
  var url = "managedocument.php?action=selectDocuments";
  var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
  window.__currentFileUl = ul;
  window.__currentFileIpt = ipt;
}

function setSelectedDocuments(documents){
  var el = $(window.__currentFileUl);
  var val = [];
  el.innerHTML="";
  for (var i = 0 ; i < documents.length; i++){
    var d = documents[i];
    var liEl = document.createElement("li");
    el.appendChild(liEl);
    liEl.innerHTML = d[1]+":"+d[2];
    val.push(d[0]+":"+d[1]+":"+d[2]);
  }
  $(window.__currentFileIpt).value = val.join(",");
}

function resetDocuments(ul,ipt){
  $(ul).innerHTML = "";
  $(ipt).value = "";
}