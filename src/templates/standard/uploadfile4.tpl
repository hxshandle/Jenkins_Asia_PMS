<div style="float:left">
  <div class="fieldset flash" id="fsUploadProgress4">
    <span class="legend">Upload Queue</span>
  </div>
  <div id="divStatus4">0 Files Uploaded</div>
  <div>
    <span id="spanButtonPlaceHolder4"></span>
    <input id="btnCancel4" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />
  </div>
</div>
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<script type="text/javascript">
  var __sesionId4 = "{$smarty.session.sessionId}";
  var __projectId4 = {$projectId};
  var __userId4 = "{$smarty.session.userid}";
  var __callbackFunc4 = null;
  {if $callbackFunc}
    __callbackFunc4 =undefined == {$callbackFunc} ? null : {$callbackFunc} ;
  
  {/if}
  var __uploadType4 = "{$uploadType}";
</script>
{literal}
<script type="text/javascript">
  var swfu4;
  function onUploadSuccess(file, serverData, responseReceived){
    var fileId4 = serverData;
    if($("fileId4")){
      $("fileId4").value = fileId4;  
    }
    if(__callbackFunc4){
      __callbackFunc4.call(this,fileId4);
    }
    uploadSuccess4.call(this,file,serverData);
  }
  window.onload = function() {
    var settings4 = {
      flash_url : "include/swfupload/swfupload.swf",
      flash9_url : "include/swfupload/swfupload_fp9.swf",
      upload_url: "uploadfileajax.php",
      post_params: {"PHPSESSID" : __sesionId4,"userId":__userId4,'type':__uploadType4,"id":__projectId4},
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

    swfu4 = new SWFUpload(settings4);
     };
</script>
{/literal}