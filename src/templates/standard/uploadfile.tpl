<link rel="stylesheet" href="templates/standard/css/swfupload.css" type="text/css"  />
<div style="float:left">
{*  <div class="fieldset flash" id="fsUploadProgress">*}
{*    <span class="legend">Upload Queue</span>*}
{*  </div>*}
{*  <div id="divStatus">0 Files Uploaded</div>*}
{*  <div>*}
{*    <span id="spanButtonPlaceHolder"></span>*}
{*    <input id="btnCancel" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />*}
{*  </div>*}

  <div style="clear:both">
    <span> 文件上传</span>
    <hr/>
    <input type="file" style="float: none;" id="fileUpload" onchange="uploadFileChanged(this)"/>
    <button disabled="true" class="upload-file-btn" style="float: none; width: 50px; height: 30px;" onclick="doUpload()">上传</button>
    <p id="fileUpload-message" style="display: none"></p>
    <div  id="fileUpload-progressOuter" class="fileUploadProgressBar progressBarOut" style="display: none;">
      <div id="fileUpload-progress" class="progressBarInner"></div>
    </div>
  </div>
</div>
{literal}
<style>
  .progressBarOut {
    height: 16px;
    width: 100%;
    background: gray;
  }
  .progressBarOut .progressBarInner {
    background: #2B6FB6;
    width: 50%;
    height: 100%;
  }
</style>
{/literal}
{*<script type="text/javascript" src="include/swfupload/swfupload.js"></script>*}
{*<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>*}
{*<script type="text/javascript" src="include/js/fileprogress.js"></script>*}
{*<script type="text/javascript" src="include/js/handlers.js"></script>*}
{if !$lazyLoad}

<script type="text/javascript">
  var __sesionId = "{$smarty.session.sessionId}";
  var __projectId = {$projectId|default:-1};
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
    // window.__swfu = J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':__uploadType,"id":__projectId},"spanButtonPlaceHolder","btnCancel",__callbackFunc,null,"fsUploadProgress");
  };

  function uploadFileChanged(el){
    if ( el.value == '') {
      return
    }
    jQuery('.upload-file-btn').prop('disabled', false);
  }
  function doUpload(){
    if(__projectId == -1) {
      alert('请选择项目');
      return;
    }


    jQuery('.upload-file-btn').prop('disabled', true);
    _upload()
  }

  function _upload(){

    var formData = new FormData();
    var file = document.getElementById('fileUpload').files[0];
    formData.append('Filedata', file);
    formData.append('PHPSESSID', __sesionId);
    formData.append('userId', __userId);
    formData.append('type', __uploadType);
    formData.append('id', __projectId)
    var _progress = document.getElementById('fileUpload-progress');
    var _progressOuter = document.getElementById('fileUpload-progressOuter');
    var _messager = document.getElementById('fileUpload-message');
    _progressOuter.style.display='block';
    _messager.style.display = 'none';
    _progress.style.width='0px';
    var request = new XMLHttpRequest();
    request.onreadystatechange = function(){
      if(request.readyState == 4){
        try {
          jQuery('#fileUpload').val('');
          _progressOuter.style.display='none';
          var el = document.getElementById('fileId');
          if (el) {
            el.value = "" + request.response;
          }
          _messager.innerText = "上传成功";
          _messager.style.display = "block";
          if (__callbackFunc != null) {
            __callbackFunc.call(window, request.response)
          }
        } catch (e){
          _messager.innerText ="上传失败";
          _messager.style.display = "block";
          console.error("上传失败" + e)
        }
      }
    };

    request.upload.addEventListener('progress', function(e){

      var perc = Math.ceil((e.loaded/e.total) * 100)  + '%';
      console.log('change per ' + perc);
      _progress.style.width = perc;
    }, false);

    request.open('POST', 'uploadfileajax.php');
    request.send(formData);
  }
</script>
{/literal}
{/if}

