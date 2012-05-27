<div style="float:left">
  <div class="fieldset flash" id="fsUploadProgress3">
    <span class="legend">Upload Queue</span>
  </div>
  <div id="divStatus3">0 Files Uploaded</div>
  <div>
    <span id="spanButtonPlaceHolder3"></span>
    <input id="btnCancel3" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />
  </div>
</div>
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<script type="text/javascript">
  var __sesionId3 = "{$smarty.session.sessionId}";
  var __projectId3 = {$projectId};
  var __userId3 = "{$smarty.session.userid}";
  var __callbackFunc3 = null;
  {if $callbackFunc}
    __callbackFunc3 =undefined == {$callbackFunc} ? null : {$callbackFunc} ;
  
  {/if}
  var __uploadType3 = "{$uploadType}";
</script>
{literal}
<script type="text/javascript">
  var swfu3;
  function onUploadSuccess(file, serverData, responseReceived){
    var fileId3 = serverData;
    if($("fileId3")){
      $("fileId3").value = fileId3;  
    }
    if(__callbackFunc3){
      __callbackFunc3.call(this,fileId3);
    }
    uploadSuccess3.call(this,file,serverData);
  }
  window.onload = function() {
    var settings3 = {
      flash_url : "include/swfupload/swfupload.swf",
      flash9_url : "include/swfupload/swfupload_fp9.swf",
      upload_url: "uploadfileajax.php",
      post_params: {"PHPSESSID" : __sesionId3,"userId":__userId3,'type':__uploadType3,"id":__projectId3},
      file_size_limit : "1000 MB",
      file_types : "*.*",
      file_types_description : "All Files",
      file_upload_limit : 100,
      file_queue_limit : 0,
      custom_settings : {
        progressTarget : "fsUploadProgress",
        cancelButtonId : "btnCancel"
      },
      debug: false,

      // Button settings
      button_image_url: "templates/standard/images/TestImageNoText_65x29.png",
      button_width: "65",
      button_height: "29",
      button_placeholder_id: "spanButtonPlaceHolder",
      button_text: '<span class="butn_link">'+MSGS.upload+'</span>',
      button_text_style: ".theFont { font-size: 16; }",
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
      upload_success_handler : onUploadSuccess,
      upload_complete_handler : uploadComplete,
      queue_complete_handler : queueComplete  // Queue plugin event
    };

    swfu3 = new SWFUpload(settings3);
     };
</script>
{/literal}