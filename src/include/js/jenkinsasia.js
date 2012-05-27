var J = {};

J.validationAddTask=function(form,errCss){
  var ret = true;
  var startDate = substr($("tips_startDate").innerHTML,2);
  var endDate = substr($("tips_endDate").innerHTML,2);
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


J.initSwfUploader=function(url,param,swfhandler,btnHolder,cancelBtnId,callBackFunc,queueCompleteHandler,progressHoder){
    cancelBtnId = cancelBtnId || "btnCancel";
    btnHolder = btnHolder || "spanButtonPlaceHolder";
    queueCompleteHandler = queueCompleteHandler || queueComplete;
    progressHoder = progressHoder || "fsUploadProgress";
    var settings = {
      flash_url : "include/swfupload/swfupload.swf",
      flash9_url : "include/swfupload/swfupload_fp9.swf",
      upload_url: url,
      post_params: param,
      file_size_limit : "1000 MB",
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
    
    swfhandler = new SWFUpload(settings);
    if(callBackFunc){
      swfhandler['JcallBackFunc']=callBackFunc;
    }
  }