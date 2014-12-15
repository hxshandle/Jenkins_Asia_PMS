


function onSelProjectChange(p){
  getProjectOrders(p.value);
  getProjectNumber(p.value);
  getProjectDeliverable(p.value);
  getProjectNotifyList(p.value);
}

function onSelORderChange(p){
  getOrderQualities(p.value);
}

function getProjectNotifyList(id){
  var theUrl = "manageprojectajax.php?action=getProjectNotifyGroupedList&ulstyle=nothing&id="+id;
  new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess:function(payload) {
          if (payload.responseText != ""){
            var $ = jQuery;
            var _notify_html = payload.responseText;
            var _approve_html = _notify_html.replace(/name="notify\[\]"/g,'name="approved_by" required ');
            _approve_html = _approve_html.replace(/type="checkbox/g,'type="radio');
            $('#notify-outer').empty().html(_notify_html);
            $('#approved_by-outer').empty().html(_approve_html);
          }
        }
    }); 
}


function _buildECNFilterParam(){
  var project = document.getElementById("criteriaProject").value;
  var order = document.getElementById("criteriaOrder").value;
  var customer = document.getElementById("criteriaCustomer").value;
  var ret = "";
  ret = "projectId="+project+"&orderId="+order+"&customerName="+customer;
  return ret;
}

function onCriteriaProjectChange(p){
  filterEcn(_buildECNFilterParam());
}
function onCriteriaOrderChange(p){
  filterEcn(_buildECNFilterParam());
}

function onCriteriaCustomerChange(p){
  filterEcn(_buildECNFilterParam());
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


function submitAction(arg1,arg2){
  $("operation").value = arg2;
  $("ecnId").value = arg1;
  $("f1").submit();
}


function filterEcn(param){
  var theUrl = "manageecn.php?action=filterECN";
  var thePost = param || "";
  new Ajax.Request(theUrl, {
          method: 'post',
          postBody:thePost,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("ecnTableContainer").innerHTML=payload.responseText;
            }
          }
      });    
}

function getOrderQualities(id){
  var theUrl = "manageprojectajax.php?action=getOrderQualities&&id="+id;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var data = eval("("+payload.responseText+")");
              var opts = $("selQuality").options;
              _buildSelOpts(opts,data);
            }
          }
      }); 
}

function getProjectOrders(id){
  var theUrl = "manageprojectajax.php?action=getProjectOrders&&id="+id;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var data = eval("("+payload.responseText+")");
              var opts = $("selOrder").options;
              _buildSelOpts(opts,data);
            }
          }
      }); 
}

function getProjectNumber(id){
  var theUrl = "manageprojectajax.php?action=getProjectNumber&&id="+id;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var val = payload.responseText+'-ECN-';
              $('newEcnName').value = val;
            }
          }
      }); 
}


function getProjectDeliverable(id){
  var theUrl = "manageprojectajax.php?action=getProjectDeliverable&&id="+id;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var data = eval("("+payload.responseText+")");
              var opts = $("targetFOBDeliverable").options;
              _buildSelOpts(opts,data);
            }
          }
      });    
}



function uploadECNFile(id){
  var url = "managedocument.php?action=selectDocuments&ecnId="+id;
  var win = window.open(url,'','height=500,width=1100,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
}

function setSelectedDocuments(documents){
  var el = $("documentList");
  if(!el){
    return;
  }
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

var impactSequence = 0;

function addECNImpact(){
  var $ = jQuery;
  var templateId = $('#impactType').val() +'-tpl';
  var tpl = $('#'+templateId).clone(true);
  //process template
  tpl.removeAttr('id');
  impactSequence++;
  $( "[name*='sequence']",tpl).each(function(idx,el){
    var $el = $(el); 
    var name = $el.attr('name');
    var newName = name.replace('sequence',""+impactSequence); 
    $el.attr('name',newName);
  });
  var el = $('<li></li>').append(tpl);
  $('#impact-list').prepend(el);
}


function removeECNImpact(el){
  var $ = jQuery;
  var confirmDel = window.confirm("Are you sure to delete it?");
  if(!confirmDel){
    return;
  }
  var $t = $(el);
  $t.parents('.ecn-impact-row').remove();
}

var _fileTarget = null;
function ecnImpactFileAttached(selDocuments){
  var $ = jQuery;
  for (var i = 0; i < selDocuments.length; i++) {
    var d = selDocuments[i];
    //0:id
    //1:name
    //2:vision
    //3:doc_no
    if(_fileTarget){
      var uploadLink = $(_fileTarget);
      var targetUl = uploadLink.siblings('ul');
      var idx = targetUl.data('index');
      var name = uploadLink.attr('name')+"["+(idx++)+"]";
      targetUl.data('index',idx);
      $("<li></li>")
      .append($("<input>").attr("name",name).attr('value',d[0]).attr('type','hidden'))
      .append($("<label></label>").text(d[1]+" : "+d[2]))
      .appendTo(targetUl);
    }
  };
}

function ecnImpactAttachDocument(el){
  var $ = jQuery;
  _fileTarget = el;
  J.uploadDocument("ecnImpactFileAttached");
}

function ecnImpactRecacluateCost(){
  var $ = jQuery;
  var total = 0;
  $('#impact-list [name*="disposition_cost"]').each(function(idx,el){
    total += Number(el.value);
  });
  $('#totalDispositionCost').text(total);
}