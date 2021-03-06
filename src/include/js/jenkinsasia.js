// global jquery function

jQuery(function(){
  var $ = jQuery;
  $('input.numeric').numeric();
});

var J = {};

J.validationAddTask=function(form,errCss){
  var ret = true;
  var startDate = $("tips_startDate").innerHTML.substr(6);
  var endDate = $("tips_endDate").innerHTML.substr(6);
  var deliverStartDate = new Date(Date.parse(startDate));
  var deliverEndDate = new Date(Date.parse(endDate));
  var taskStartDate = new Date(Date.parse(document.getElementsByName("start")[0].value));
  var taskEndDate = new Date(Date.parse(document.getElementsByName("end")[0].value));
  ret = taskStartDate >= deliverStartDate && taskStartDate <= deliverEndDate && taskEndDate >= deliverStartDate && taskEndDate <= deliverEndDate && taskEndDate > taskStartDate
  // for quick add task which will without deliverable item
  var deliverableItem = jQuery('#deliverableItems').val();
  if("-1" == deliverableItem){
      ret = true;
  }
  if(!ret){
    $(document.getElementsByName("start")[0].id).addClassName("hiErrorField");
    $(document.getElementsByName("end")[0].id).addClassName("hiErrorField");
  }
  
  
  if(ret){
    //check assigned task
    var chkAssigned =  $$('input[name="assigned[]"]');  
    var hasChecked = false;
    var len = chkAssigned.size();
    for (var i = 0; i < len; i++ ){
      var item = chkAssigned[i];
      if(item.checked){
        hasChecked = true;
        break;
      }
    }
    if(!hasChecked){
      $$("#chk-list-assigned")[0].addClassName("hiErrorField");
    }
    ret = hasChecked;
  }
  if(ret){
    ret = validateCompleteForm(form,errCss);
  }else{
    validateCompleteForm(form,errCss);
  }
  return ret;
}

J.approveProject=function(projectId){
  document.submitForm.action="manageproject.php?action=approveProject&id="+projectId;
  document.submitForm.method="POST";
  document.submitForm.submit();
}

J.rejectProject=function(projectId){
  document.submitForm.action="manageproject.php?action=rejectProject&id="+projectId;
  document.submitForm.method="POST";
  document.submitForm.submit();
}

J.showSystemMsg=function(msg,isWarning){
  var _str = '<span class="info_in_green">'+msg+'</span>';
  $("systemmsg").innerHTML=_str;
  systemMsg('systemmsg');
}
J.testFunc=function(scope){
  scope.blur();
}

J.onUploadSuccess = function(file, serverData, responseReceived){
  var fileId = serverData;
  if($("fileId")){
    $("fileId").value = fileId;  
  }
  if(this["JcallBackFunc"]){
    this["JcallBackFunc"].call(this,fileId);
  }
  uploadSuccess.call(this,file,serverData);
}

J.EmptyFunction = function(){}

J.bindDatePicker = function(){}

J.openWindow = function(url){
  var win = window.open(url,'','height=500,width=760,scrollbars=yes,toolbar=no,titlebar=no,location=no,status=no,menubar=no');
  return win;
}
J.refresh = function(){
  window.location .href =window.location .href;
}
J.addSelectedDocument = function(docs,refElement,dispElement){
  var doc = docs[0];
  
  $(refElement).value=doc[0];//document ID
  var dispEl = $(dispElement);
  if(dispEl.tagName == "UL"){
    var liEl = document.createElement("li");
    dispEl.appendChild(liEl);
    liEl.innerHTML = doc[3];
  }else{
    $(dispElement).value=doc[3];// document NO  
  }
  
}
J.selectDocument = function(refElement,dispElement){
  var url = "managedocument.php?action=selectDocuments";
  url +="&callBack=J.addSelectedDocument";
  url +="&refElement="+refElement;
  url +="&dispElement="+dispElement;
  var _win = J.openWindow(url);
  _win.focus();
}

J.uploadDocument = function(callback){
  var url = "managedocument.php?action=selectDocuments";
  url +="&callBack="+callback;
  var _win = J.openWindow(url);
  _win.focus();
}
J.resetDocument = function(refElement,dispElement){
  $("#"+dispElement).innerHTML = "";
  $("#"+refElement).value = "";
}

J.delTableRow = function(url,el){
  if(window.confirm("Are you sure to delete the data?")){
    new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText == "true"){
              while(el && el.tagName.toLowerCase() !== "tr"){
                el=el.parentNode;
              }
              el.parentNode.removeChild(el);
            }
          }
    });
  }
}


J.initSwfUploader=function(url,param,btnHolder,cancelBtnId,callBackFunc,queueCompleteHandler,progressHoder){
    cancelBtnId = cancelBtnId || "btnCancel";
    btnHolder = btnHolder || "spanButtonPlaceHolder";
    queueCompleteHandler = queueCompleteHandler || queueComplete;
    progressHoder = progressHoder || "fsUploadProgress";
    var settings = {
      flash_url : "include/swfupload/swfupload.swf",
      flash9_url : "include/swfupload/swfupload_fp9.swf",
      upload_url: url,
      post_params: param,
      file_size_limit : "2000 MB",
      file_types : "*.*",
      file_types_description : "All Files",
      file_upload_limit : 100,
      file_queue_limit : 0,
      custom_settings : {
        progressTarget : progressHoder,
        cancelButtonId : cancelBtnId
      },
      debug: false,

      // Button settings
      button_image_url: "templates/standard/images/TestImageNoText_65x29.png",
      button_cursor:-2,
      button_width: "65",
      button_height: "29",
      button_placeholder_id: btnHolder,
      button_text: '<span class="butn_link">'+MSGS.upload+'</span>',
      button_text_style: ".theFont { font-size: 14; }",
      button_text_left_padding: 12,
      button_text_top_padding: 3,
      
      // The event handler functions are defined in handlers.js
      swfupload_preload_handler : preLoad,
      swfupload_load_failed_handler : loadFailed,
      file_queued_handler : fileQueued,
      file_queue_error_handler : fileQueueError,
      file_dialog_complete_handler : fileDialogComplete,
      upload_start_handler : uploadStart,
      upload_progress_handler : uploadProgress,
      upload_error_handler : uploadError,
      upload_success_handler : J.onUploadSuccess,
      upload_complete_handler : uploadComplete,
      queue_complete_handler : queueCompleteHandler  // Queue plugin event
    };
    
    var handler = new SWFUpload(settings);
    if(callBackFunc){
      handler['JcallBackFunc']=callBackFunc;
    }
    return handler;
  }

J.hideLoading = function(){
  var mask = $('j-mask-overlay');
  mask.style.display="none";
}
J.showLoading = function(){
  var mask = $('j-mask-overlay');
  if(!mask){
    var el = document.createElement('div');
    document.body.appendChild(el);
    var loadingText = document.createElement('div')
    el.appendChild(loadingText);
    loadingText.id="j-loading-text";
    loadingText.innerHTML = "Loading...";
    el.id = "j-mask-overlay";
    mask = el;
  }
  mask.style.display="block";
}

J.modeDialog = null;
J.showModeDialog = function(ctx){
  J.hideLoading();
  J.modeDialog = new Control.Modal("mode-dialog",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   J.modeDialog.open();
}

J.updateDeliverableItemDate = function(){
  J.modeDialog.close();
  J.showLoading();
  var startDate = $('newStartDate').value;
  var endDate = $('newEndDate').value;
  var deliverableId = $('updateDeliverableItemId').value;
  var url = "manageprojectajax.php?action=updateDeliverableItemDate&deliverableId="+J.editDeliverableItemDateId;
  var postData = "deliverableId="+deliverableId+"&start_date="+startDate+"&end_date="+endDate;
  new Ajax.Request(url, {
          method: 'post',
          postBody:postData,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var jsonObj = eval("("+payload.responseText+")");
              $("tips_startDate").innerHTML = " > "+jsonObj['startDate'];
              $("tips_endDate").innerHTML = " < "+jsonObj['endDate'];
            }else{
              alert("save faild");
            }
            J.hideLoading();
          }
      });  
}

J.saveNewDeliverableItem = function(){
  J.modeDialog.close();
  J.showLoading();
  var projectId = $('projectId').value;
  var phaseId = $("phaseId").value;
  var dName = $('deliverableName').value;
  var startDate = $('newStartDate').value;
  var endDate = $('newEndDate').value;
  var url = "manageprojectajax.php?action=addDeliverableItem"
  var postData ="projectId="+projectId+"&phaseId="+phaseId+"&start_date="+startDate+"&end_date="+endDate+"&deliverableName="+dName;
  new Ajax.Request(url, {
          method: 'post',
          postBody:postData,
          onSuccess:function(payload) {
            if (payload.responseText != "fail"){
             var jsonObj = eval("("+payload.responseText+")");
             var sel = $("deliverableItems");
             sel.options[sel.options.length] = new Option(jsonObj.name,jsonObj.id);
            }else{
              alert("save faild");
            }
            J.hideLoading();
          }
      });  
}

J.addNewDeliverableItem = function(){
  J.showLoading();
   var url = "manageprojectajax.php?action=getAddDeliverableItemDateForm&projectId="+__projectId;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              J.showModeDialog(payload.responseText);
            }
          }
      }); 
}


J.canEditDeliverableItemDate = false;
J.editDeliverableItemDateId = null;
J.editDeliverableItemDate = function(){
  if(!J.canEditDeliverableItemDate){
    alert("Please select a Deliverable Items");
    return;
  }
  J.showLoading();
  var url = "manageprojectajax.php?action=getEditDeliverableItemDateForm&deliverableId="+J.editDeliverableItemDateId;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              J.showModeDialog(payload.responseText);
            }
          }
      }); 
  
}
/**
  @param id the select id
  @param jsonData [{id:1,name:'abc'}]
  @param hasDefaultOption if True will add "please select" option

*/
J.buildSelectByJSON = function (id,jsonData,hasDefaultOption){
  var selector = $(id);
  if(selector){
    selector.innerHTML = "";
    var h = [];
    if(hasDefaultOption){
      h.push('<option value="-1" >Please choose</option>');
    }
    for(var i = 0 ; i < jsonData.length ; i++){
      var option = jsonData[i];
      h.push('<option value="'+option.id+'">');
      h.push(option.name);
      h.push('</option>');
    }
    selector.innerHTML=h.join('');
  }
}



function onDeskTopCustomerChange(val){
  var v = encodeURIComponent(val.value);
  var theUrl = "manageprojectajax.php?action=filterProjectsByCustomerName&customer="+v;
  var $ = jQuery;
  $('.project-row').hide();
  var _customerName = val.value.toUpperCase();
  $('.project-row[customer="'+_customerName+'"]').show();
  if(val.value == -1){
    $('.project-row').show();
  }
  /*new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("desktop-project-table").innerHTML=payload.responseText;
            }
          }
      }); */
}

// index.tpl -> _getProjects4HomePage
function _getProjects4HomePage(){
  var $ = jQuery;
  return pData = _.map($('.project-row'),function(row){
      var el = $(row);
      var pName = el.data('projectName');
      var pNo = el.data('projectNo');
      var pId = el.data('projectId');
      return {
          value:pName+" ( "+ pNo +" )",
          data:pName+" ( "+ pNo +" )",
          projectId:pId
      }
    });
}

// supplier.tpl
function _getSuppliers4SupplierPage(){
  var $ = jQuery;
  return pData = _.map($('.supplier-row'),function(row){
      var el = $(row);
      var pName = $('a',el).text();
      var pId = el.attr('supplierid');
      return {
          value:pName,
          data:pName,
          supplierId:pId
      }
    });
}


function _homePageAutocompleteHandler(suggestion){
  var $ = jQuery;
  //alert('You selected: ' + suggestion.value + ', ' + suggestion.data +","+suggestion.projectId);
  $('.project-row').hide();
  $('.project-row[projectid='+suggestion.projectId+']').show();
}

function onSupplierAutocompleteHandler(suggestion){
  var $ = jQuery;
  $('.supplier-row').hide();
  $('.supplier-row[supplierid='+suggestion.supplierId+']').show();
}


// document.tpl -> _getProjects4DocumentPage
function _getProjects4DocumentPage(){
  var $ = jQuery;
  return pData = _.map($('#criteriaProject option'),function(row){
      var el = $(row);
      var pName = el.data('projectName');
      var pNo = el.data('projectNo');
      var pId = el.data('projectId');
      return {
          value:pName+" ( "+ pNo +" )",
          data:pName+" ( "+ pNo +" )",
          projectId:pId
      }
    });
}

// Use new auto complete jQuery plugin
jQuery(function(){
  var $ = jQuery;
    // 查看是否有存在Customer Support
  var autoCompletedSelects = ['#porject-filter'];
  // 首页项目选择器
  var projectFilter = $('#porject-filter');
  var _filterType = projectFilter.data('type');
  if(projectFilter.length > 0 ){
    
    var pData = eval(projectFilter.data('dataSource'));
    projectFilter.autocomplete({
      lookup:pData,
      onSelect: function (suggestion) {
        switch(_filterType){
          case "project":
            _homePageAutocompleteHandler(suggestion);
            break;
          case "document":
          case "quality":
            $('#project-filter-val').val(suggestion.projectId);
            onCriteriaProjectChange();
            break;
          case "supplier":
            onSupplierAutocompleteHandler(suggestion);
            break;
          default:
            break;
        }
      }
    });
    //监听清空事件
    projectFilter.on('change',function(){
      var val = $(this).val();
      if(!_.isEmpty(val)){
        return;
      }
      switch(_filterType){
        case "document":
        case "quality":
          $('#project-filter-val').val("-1");
          break;
        case "supplier":
          $('.supplier-row').show();
          break;
        default:
          break;
      }
    });
  }


});



function onNormalSelCustomerChange(val,url,targetEl){
  url = url+'&customer='+val.value;
  var targetElId = targetEl;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById(targetElId).innerHTML=payload.responseText;
            }
          }
      }); 
}

function onNormalSelProjectLeaderChange(val,url,targetEl){
  url = url+'&projectLeader='+val.value;
  var targetElId = targetEl;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById(targetElId).innerHTML=payload.responseText;
            }
          }
      }); 
}

function onNormalSelCustomerLeaderChange(val,url,targetEl){
  url = url+'&customerLeader='+val.value;
  var targetElId = targetEl;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById(targetElId).innerHTML=payload.responseText;
            }
          }
      }); 
}


function onNormalSelEngineerLeaderChange(val,url,targetEl){
  url = url+'&engineerLeader='+val.value;
  var targetElId = targetEl;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById(targetElId).innerHTML=payload.responseText;
            }
          }
      }); 
}


function onNormalSelQualityLeaderChange(val,url,targetEl){
  url = url+'&qualityLeader='+val.value;
  var targetElId = targetEl;
  new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById(targetElId).innerHTML=payload.responseText;
            }
          }
      }); 
}


function normalSelAll(el,targetId){
  
  var isChk = el.checked;  
  var els = $$("input[name="+targetId+"]");
  for(var i = 0 ;i < els.length;i++){
    var chkbox = els[i];
    chkbox.checked = isChk;
  }
}

function setValue(elementId,val){
    var el = document.getElementById(elementId);
    if(!el)  return;
    el.value = val;
}
function getNewSubmitForm(){
    var submitForm = document.createElement("FORM");
    document.body.appendChild(submitForm);
    submitForm.method = "POST";
    return submitForm;
}

//helper function to add elements to the form
function createNewFormElement(inputForm, elementName, elementValue){
    var newElement = document.createElement("input");
    newElement.name=elementName;
    newElement.type="hidden";
    inputForm.appendChild(newElement);
    newElement.value = elementValue;
    return newElement;
}

function exportTaskSummaryPDF(){
    var customer = $('criteriaCustomer').value;
    var projectLeader = $('criteriaProjectLeader').value;
    if(customer == "-1" && projectLeader == "-1"){
        alert("Please select at least one condition");
        return;
    }
    var submitForm = getNewSubmitForm();
    createNewFormElement(submitForm, "action", "exportPDF");
    if(customer != "-1"){
        createNewFormElement(submitForm, "customer", customer);
    }
    if(projectLeader!="-1"){
        createNewFormElement(submitForm, "projectLeader", projectLeader);
    }

    submitForm.action= "/managetasksummary.php";
    alert("The PDF maybe processing for a while please wait and don't resubmit the task.");
    submitForm.submit();
}

function sendTaskDelayReminder(){
  var els = $$("input[name=selectedDelayTask]");
  var hasSelected = false;
  var selectedTask = [];
  for(var i = 0 ;i < els.length;i++){
    var chkbox = els[i];
    if(chkbox.checked){
      selectedTask.push(chkbox.value);
      hasSelected = true;
    }
  }
  if(!hasSelected){
    alert("please select one.");
    return;
  }
  var ids = selectedTask.join(",");
  var postData = "ids="+ids;
  new Ajax.Request("managedelaytasks.php?action=sendReminder", {
          method: 'post',
          postBody:postData,
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              alert("Reminder sent.");
            }
          }
      }); 
}