{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-tasks-sechead.png) repeat scroll 0 0 transparent;">
  <div class="tasks block_in_wrapper" >

    <h2>{#addtask#}</h2>
    <form name = "addtaskform" id = "addtaskform" class="main" method="post" action="managetask.php?action=add"  onsubmit="return J.validationAddTask(this,'hiErrorField')">
        <fieldset>
            <input type="hidden" name="id" id="id"/>
            <input type="hidden" value="1" name="tasklist" id="tasklist">
        	<div class="row">
        		<label for="project">{#project#}:</label>
        		<select type="text" class="text select2" name="project" realname="{#project#}"  id="project" required = "1" onchange="onProjectChange(this)">
					{section name = p loop=$myProjects}
	              		<option value = "{$myProjects[p].ID}">{$myProjects[p].name}</option>
				    {/section}
				</select>
        	</div>
        	<div class="row"><label for="title">{#title#}:</label><input type="text" class="text" name="title" id="title"  realname = "{#title#}" required = "1"  /></div>
			<div class="row"><label for="text">{#text#}:</label><div class="editor"><textarea name="text" id="text" rows="3" cols="1" ></textarea></div></div>

			<div class="row"><label for="location">{#location#}:</label><input type="text" class="text" name="location" realname="{#location#}"  id="location" required = "1" /></div>

			<div class="row"><label for="status">{#status#}:</label>
				<select type="text" class="text" name="status" realname="{#location#}"  id="status" required = "1" >
				{section name = idx loop=$taskStatus}
		            {if $taskStatus[idx].id == $project.status}
		              <option selected value = "{$taskStatus[idx].id}">{$taskStatus[idx].value}</option>
		            {else}
		              <option value = "{$taskStatus[idx].id}">{$taskStatus[idx].value}</option>
		            {/if}
		    {/section}
				</select>
			</div>

			<div class="row">
						<label for="deliverableItems">{#deliverableItems#}: </label>
						<select name="deliverableItems" id="deliverableItems" onchange="deliverItemChanged(this)">
						<option value="-1" >{#chooseone#}</option>
						{section name=stone loop=$deliverableItems}
							<option value="{$deliverableItems[stone].ID}">{$deliverableItems[stone].name}</option>
						{/section}
						</select>
						{if $canEditDeilverableItem}
							<a class="butn_link" onclick="J.addNewDeliverableItem()">{#add#}</a>
							<a class="butn_link" onclick="J.editDeliverableItemDate()">{#edit#}</a>
						{/if}
			</div>	
			<div class="row"><label for="parent">{#parentTask#}:</label>
				<select type="text" class="text" name="parent" realname="{#parent#}"  id="parent" required = "1" >
					<option value = "-1">{#chooseone#}</option>
				</select>
			</div>



			<div class="row"><label for="start">{#startDate#}:</label><input type="text" class="text" name="start" realname="{#startDate#}"  id="start" required = "1" /> <span class="tipsMsg" id="tips_startDate">  {$deliverStartDate|truncate:"10":""}</span></div>
			<div class="row"><label for="end">{#due#}:</label><input type="text" class="text" name="end" realname="{#due#}"  id="end" required = "1" /><span class="tipsMsg" id="tips_endDate"> {$deliverEndDate|truncate:"10":""}</span></div>

			<div class="datepick">
				<div id = "datepicker_taskStart" class="picker" style = "display:none;"></div>
			</div>

			<div class="datepick">
				<div id = "datepicker_taskEnd" class="picker" style = "display:none;"></div>
			</div>

			<script type="text/javascript">
				theCalStart = new calendar({$theM},{$theY});
				theCalStart.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
				theCalStart.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
				theCalStart.relateTo = "start";
				theCalStart.dateFormat = "{$settings.dateformat}";
				theCalStart.getDatepicker("datepicker_taskStart");

				theCalEnd = new calendar({$theM},{$theY});
				theCalEnd.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
				theCalEnd.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
				theCalEnd.relateTo = "end";
				theCalEnd.dateFormat = "{$settings.dateformat}";
				theCalEnd.getDatepicker("datepicker_taskEnd");
			</script>

			<div class="row">
				<label for="assigned" >{#assignto#}:</label>
				<div id="assigned-member-list">
					{include file="seluserlist.tpl" groupedUser=$grouped_assignable_users chkName="assigned"}
				</div>
			</div>
			<div class="row">
				<label for="distribution" >{#distribution#}:</label>
				<div id="distribution-member-list">
					{include file="seluserlist.tpl" groupedUser=$grouped_assignable_users chkName="distribution"}
				</div>
			</div>
			<link rel="stylesheet" href="templates/standard/css/swfupload.css" type="text/css"  />
			<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
			<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
			<script type="text/javascript" src="include/js/fileprogress.js"></script>
			<script type="text/javascript" src="include/js/handlers.js"></script>
			<div class="row">
				<label for="uploadfile" >{#upload#}:</label>
				<div style="float:left" id="file-uploader">
				  <div class="fieldset flash" id="fsUploadProgress">
				    <span class="legend">Upload Queue</span>
				  </div>
				  <div id="divStatus">0 Files Uploaded</div>
				  <div>
				    <span id="spanButtonPlaceHolder"></span>
				    <input id="btnCancel" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />
				  </div>
				</div>
			</div>
			<input type = "hidden" id = "fileId" name = "fileId"></input>


			<div class="row-butn-bottom">
				<label>&nbsp;</label>
				<button type = "submit" onfocus="this.blur();">{#addbutton#}</button>
				<button onclick="blindtoggle('form_');toggleClass('add_','add-active','add');toggleClass('add_butn_','butn_link_active','butn_link');toggleClass('sm_','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
			</div>

			</fieldset>
    </form>

</div>
<script>
    var __sesionId = "{$smarty.session.sessionId}";
    var __userId = "{$smarty.session.userid}";
</script>
{literal}
<script>

    var __loadingPromise = 0;
    
	var __projectId = -1;
	
	var __callbackFunc = null;

	var __uploadType = "{$uploadType}";

    function __closeLoading(){
    	__loadingPromise++;
    	if(__loadingPromise==4){
    		J.hideLoading();
    	}
    }

	function deliverItemChanged(arg){
	  	J.showLoading();
	  	var deliverableId = arg.value;
	  	J.editDeliverableItemDateId = deliverableId;
	  	J.canEditDeliverableItemDate = deliverableId == "-1" ? false:true;

	  	var theUrl = "manageprojectajax.php?action=getTasksBydeliverableId&deliverableId="+deliverableId;
	    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
				var jsonObj = eval("("+payload.responseText+")");
		  	$("tips_startDate").innerHTML = " > "+jsonObj['startDate'];
		  	$("tips_endDate").innerHTML = " < "+jsonObj['endDate'];
		  	var tasks = jsonObj['tasks'];
		  	var parentTaskEl = $("parent");
		  	parentTaskEl.innerHTML = "";
		  	parentTaskEl.value = "-1";
		  	var optionEl = document.createElement("option");
		  	optionEl.value = "-1";
		  	optionEl.innerHTML = unescape(MSGS.chooseone);
		  	parentTaskEl.appendChild(optionEl);
		  	for (var i = 0; i < tasks.length; i++) {
		  		var tk = tasks[i];
		  		var optionEl = document.createElement("option");
			  	optionEl.value = ""+tk['id'];
			  	optionEl.innerHTML = ""+tk['name'];
			  	parentTaskEl.appendChild(optionEl);
		  	};
		  	J.hideLoading();
	    }
	    });
	    return true;
	  }

	function _getProjectDeliverable(projectId){
		var url = "/manageprojectajax.php?action=getProjectDeliverable&id="+projectId;
		new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              var options = eval('('+payload.responseText+')');
              J.buildSelectByJSON('deliverableItems',options,true);
              __closeLoading();
            }
          }
      });
	}

	function _getProjectMembers(projectId,chkName){
		var url = "/manageprojectajax.php?action=getSelUserList&id="+projectId+"&chkName="+chkName;
		new Ajax.Request(url, {
          method: 'get',
          onSuccess:function(payload) {
            if (payload.responseText != ""){
              $(chkName+"-member-list").innerHTML = payload.responseText;
              __closeLoading();
            }
          }
      });
	}

    function _getProjectTasklistId(projectId){
        var url = "/manageprojectajax.php?action=getProjectTasklistId&id="+projectId;
        new Ajax.Request(url, {
            method: 'get',
            onSuccess:function(payload) {
                if (payload.responseText != ""){
                    document.getElementById('tasklist').value = payload.responseText;
                    __closeLoading();
                }
            }
        });
    }

	function rebuildFileUpload(){
        var element = $('file-uploader');
        element.innerHTML = "";
		var h = [];
		h.push('<div class="fieldset flash" id="fsUploadProgress">');
		h.push('<span class="legend">Upload Queue</span>');
		h.push('</div>');
		h.push('<div id="divStatus">0 Files Uploaded</div>');
		h.push('<div>');
		h.push('<span id="spanButtonPlaceHolder"></span>');
		h.push('<input id="btnCancel" type="button" class = "butn_link" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;width:auto;" />');
		h.push('</div>');
        element.innerHTML=h.join('');
        window.__swfu = J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':__uploadType,"id":__projectId},"spanButtonPlaceHolder","btnCancel",__callbackFunc,null,"fsUploadProgress");
	}

	function onProjectChange(el){
		__projectId = el.value;
        $('id').value=__projectId;
        rebuildFileUpload();
		
		J.showLoading();
		__loadingPromise=0;
		_getProjectDeliverable(__projectId);
		_getProjectMembers(__projectId,'assigned');
		_getProjectMembers(__projectId,'distribution');
        _getProjectTasklistId(__projectId);
	}
</script>
{/literal}
</body>