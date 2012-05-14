<div class="block_in_wrapper">

	<h2>{#addfile#}</h2>
	{#maxsize#}: {$postmax}<br/><br/>
	<form class="main" id="fileForm" name="fileForm" action="managefile.php?action=upload&amp;id={$project.ID}" method="post" enctype="multipart/form-data" {literal} onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
	<fieldset>

		<div class = "row">
			<label for = "upfolder">{#folder#}:</label>
			<select name = "upfolder" id = "upfolder">
			<option value = "">{#rootdir#}</option>
			{section name=fold loop=$allfolders}
			<option value = "{$allfolders[fold].ID}">/{$allfolders[fold].name}</option>
			{/section}
			</select>
		</div>

		<div id = "inputs">
			<div class="row"><label for = "title">{#title#}:</label><input type = "text" name = "title" id="title" /></div>
				<div class="row">
					<label for = "tags">{#tags#}:</label><input type = "text" name = "tags" id="tags" />
				</div>
			</div>

			<div class="row">
				<label for = "desc">{#description#}:</label><textarea name="desc" id="desc" rows="3" cols="1"></textarea>
			</div>

			<div class = "row">
				<label>{#visibility#}:</label>
				<select name = "visible" multiple style = "height:80px;">
					<option value = "0" selected>{#all#}</option>
				  <option value = "1" >{#superAdmin#}</option>
          <option value = "2" >{#admin#}</option>
          <option value = "3" >{#manageLv1#}</option>
          <option value = "4" >{#manageLv2#}</option>
          <option value = "5" >{#staff#}</option>
          <option value = "6" >{#customerLv1#}</option>
          <option value = "7" >{#customerLv2#}</option>
          <option value = "8" >{#supplierLv1#}</option>
          <option value = "9" >{#supplierLv2#}</option>

				</select>
			</div>

			<div class = "row">
				<label>{#notify#}:</label>
				<select name = "sendto[]" multiple style = "height:100px;">
					<option value = "" disabled style = "color:black;font-weight:bold;">{#general#}</option>
					<option value = "all" selected>{#all#}</option>
					<option value = "none" >{#none#}</option>
					<option value = "" disabled style = "color:black;font-weight:bold;">{#members#}</option>
					{section name=member loop=$members}
						<option value = "{$members[member].ID}" >{$members[member].name}</option>
					{/section}
				</select>
			</div>



	<div class="row-butn-bottom">
		<label>&nbsp;</label>
		<img id = "fakeprogress" src = "templates/standard/images/symbols/ajax-loader.gif" alt = "fakeprogress" style = "display:none;" />
    <!--
		<div id = "filesubmit" >
			<button type="submit" onclick = "$('filesubmit').hide();$('fakeprogress').show();" onfocus="this.blur();">{#addbutton#}</button>
			<button type="reset" onclick="blindtoggle('form_file');toggleClass('addfile','addfile-active','addfile');toggleClass('add_file_butn','butn_link_active','butn_link');toggleClass('sm_files','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
		</div>
    -->
    <div class="fieldset flash" id="fsUploadProgress">
      <span class="legend">Upload Queue</span>
    </div>
    <div id="divStatus">0 Files Uploaded</div>
    <div>
      <span id="spanButtonPlaceHolder"></span>
      <input id="btnCancel" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />
    </div>
	</div>


	</fieldset>
	</form>




<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<script type="text/javascript">
  var __projectId = {$project.ID};
  var __sesionId = "{$smarty.session.sessionId}";
  var __userId = "{$smarty.session.userid}";
</script>
{literal}
<script type="text/javascript">
	var swfu;

  window.onload = function() {
    var settings = {
      flash_url : "include/swfupload/swfupload.swf",
      flash9_url : "include/swfupload/swfupload_fp9.swf",
      upload_url: "uploadfileajax.php",
      post_params: {"PHPSESSID" : __sesionId,"id":__projectId,"userId":__userId},
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
      upload_success_handler : uploadSuccess,
      upload_complete_handler : uploadComplete,
      queue_complete_handler : queueComplete  // Queue plugin event
    };

    swfu = new SWFUpload(settings);
     };
</script>
{/literal}
</div> {*block_in_wrapper end*}