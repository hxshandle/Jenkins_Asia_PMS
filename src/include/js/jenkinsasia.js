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


function onDeskTopCustomerChange(val){
  var theUrl = "manageprojectajax.php?action=filterProjectsByCustomerName&&customer="+val.value;
  new Ajax.Request(theUrl, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              document.getElementById("desktop-project-table").innerHTML=payload.responseText;
            }
          }
      }); 
}

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