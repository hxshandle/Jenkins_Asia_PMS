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

// J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"qualitydetails","id":__projectId},"spanButtonPlaceHolder","btnCancel",setFileId);

function __uploadInfoBaseInfo(sesionId, userId, uploadType,  projectId, callBack){
    window.__sesionId = sesionId;
    window.__userId = userId;
    window.__uploadType = uploadType;
    window.__projectId = projectId;
    window.__callbackFunc = callBack;
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