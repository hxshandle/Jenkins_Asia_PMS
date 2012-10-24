<link rel="stylesheet" href="templates/standard/css/swfupload.css" type="text/css"  />
<div style="float:left">
  <div class="fieldset flash" id="fsUploadProgress">
    <span class="legend">Upload Queue</span>
  </div>
  <div id="divStatus">0 Files Uploaded</div>
  <div>
    <span id="spanButtonPlaceHolder"></span>
    <input id="btnCancel" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />
  </div>
</div>
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
{if !$lazyLoad}

<script type="text/javascript">
  var __sesionId = "{$smarty.session.sessionId}";
  var __projectId = {$projectId};
  var __userId = "{$smarty.session.userid}";
  var __callbackFunc = null;
  {if $callbackFunc}
    __callbackFunc =undefined == {$callbackFunc} ? null : {$callbackFunc} ;
  
  {/if}
  var __uploadType = "{$uploadType}";
</script>
{literal}
<script type="text/javascript">
  window.onload = function() {
    window.__swfu = J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':__uploadType,"id":__projectId},"spanButtonPlaceHolder","btnCancel",__callbackFunc,null,"fsUploadProgress");
  };
</script>
{/literal}
{/if}

