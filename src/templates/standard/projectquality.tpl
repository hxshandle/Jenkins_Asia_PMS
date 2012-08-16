{include file="header.tpl"  jsload = "ajax"  jsload1="tinymce" jsload3 = "lightbox"}
{include file="tabsmenue-project.tpl" qualitystab = "active"}
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<div id="content-left">
  <div id="content-left-in">
    <div class="msgs">

      <div class = "infowin_left">
        <span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasdeleted#}</span>
      </div>

      <div class="infowin_left" style = "display:none;" id = "systemmsg">
        {if $mode == "added"}
          <span class="info_in_green"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasadded#}</span>
        {elseif $mode == "edited"}
          <span class="info_in_yellow"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasedited#}</span>
        {elseif $mode == "replied"}
          <span class="info_in_green"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#replywasadded#}</span>
        {/if}
      </div>
      
      {literal}
        <script type = "text/javascript">
          systemMsg('systemmsg');
        </script>
      {/literal}


      <h1>{$projectname|truncate:45:"...":true}<span>/ {#quality#}</span></h1>

      <div class="headline">
        <a href="javascript:void(0);" id="block_msgs_toggle" class="win_block" onclick = "toggleBlock('block_msgs');"></a>
        <div class="wintools">
          {if $userpermissions.messages.add}
            <a class="add" href="javascript:blindtoggle('addmsg{$myprojects[project].ID}');" id="add" onclick="toggleClass(this,'add-active','add');toggleClass('add_butn','butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');"><span>{#addmessage#}</span></a>
          {/if}
        </div>
        <h2>
          <img src="./templates/standard/images/symbols/msgs.png" alt="" />{#quality#}
        </h2>
      </div>

      <div id="block_msgs" class="block" >

        {*Add Message*}
        <div id = "addmsg" class="block_in_wrapper" style = "display:none;">
          {include file="editQualityDlg.tpl" }
          <div class="clear_both_b"></div>
        </div>

        <div class="nosmooth" id="sm_msgs">

          <table id="acc_msgs" cellpadding="0" cellspacing="0" border="0">
            <thead>
              <tr>
                <th class="a"></th>
                <th class="b">{#actionNo#}</th>
                <th class="ce" style="text-align:right">{#issueDate#}&nbsp;&nbsp;</th>
                <th class="de">{#acknowledgeBy#}</th>
                <th class="e">{#lotQuantity#}</th>
                <th class="tools"></th>
              </tr>
            </thead>

            <tfoot>
              <tr>
                <td colspan="6"></td>
              </tr>
            </tfoot>

            {section name=quality loop=$qualitys}

            {*Color-Mix*}
            {if $smarty.section.quality.index % 2 == 0}
            <tbody class="color-a" id="q_{$qualitys[quality].ID}">
            {else}
            <tbody class="color-b" id="q_{$qualitys[quality].ID}">
            {/if}
              <tr>
                <td>

                </td>
                <td>
                  <div class="toggle-in">
                  <span class="acc-toggle" onclick="javascript:accord_quality.activate($$('#block_msgs .accordion_toggle')[{$smarty.section.quality.index}]);toggleAccordeon('accord_quality',this);"></span>
                    <a href="javascript:void(0);" title="{$qualitys[quality].action_no}" onclick='showQualityDetails("{$qualitys[quality].ID}")'>{$qualitys[quality].action_no|truncate:35:"...":true}</a>
                  </div>
                </td>
                <td style="text-align:right">
                    {$qualitys[quality].issue_date|truncate:"10":""}
                  &nbsp;
                </td>
                <td>
                  {$qualitys[quality].acknowledge_by}
                  &nbsp;
                </td>
                <td>{$qualitys[quality].lot_quantity}</td>
                <td class="tools">
                </td>
              </tr>

              <tr class="acc">
                <td colspan="6">
                  <div class="accordion_toggle"></div>
                  <div class="accordion_content">
                    <div class="acc-in">
                        {$qualitys[quality].action_no}
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
            {/section}

            </table>
          </div> {*smooth End*}

          <div class="tablemenue">
            <div class="tablemenue-in">
              {if $userpermissions.messages.add}
              <a class="butn_link" href="javascript:blindtoggle('addmsg');"  id="add_butn" onclick="toggleClass('add','add-active','add');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');">{#addquality#}</a>
              {/if}
            </div>
          </div>
        </div> {*block END*}
      <div class="content-spacer"></div>
      <!-- Details block -->
      <div class="headline">
        <a href="javascript:void(0);" id="block_details_toggle" class="win_block" onclick = "toggleBlock('block_details');"></a>
        <div class="wintools">
        </div>
        <h2>
          <img src="./templates/standard/images/symbols/msgs.png" alt="" />{#qualityDetails#}
        </h2>
      </div>
      <div id="block_details" class="block" >
          {#pleaseSelQuality#}
      </div>
      
      <!-- End of Details block-->
      <!-- Add details block -->
      <div id = "addQualityDetails" class="block_in_wrapper" style = "display:none;">
        <h2>{#addQualityDetails#}</h2>
        <form id="detailsForm" name="detailsForm"  method="post" action="managequality.php?action=saveDetails&pId={$project.ID}">
          <div class="dlgRow">
            <label>{#quality#}</label>
            <select id="quality" name="quality">
              {section name=q loop=$qualitys}
              <option value="{$qualitys[q].ID}">{$qualitys[q].action_no}</option>
              {/section}
            </select>
          </div>
          <div class="dlgRow">
            <label>{#quantity#}</label>
            <input id="quantity" name = "quantity"></input>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#rejectDesc#}</label>
            <div class="editor floatL">
              <textarea id="rejectDesc" name = "rejectDesc" ></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#requiredDesc#}</label>
            <div class="editor floatL">
              <textarea id="requiredDesc" name = "requiredDesc"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#rootCause#}</label>
            <div class="editor floatL">
              <textarea id="rootCause" name = "rootCause"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#containmentAction#}</label>
            <div class="editor floatL">
              <textarea id="containmentAction" name = "containmentAction"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#supplierShortTermCorrectiveAct#}</label>
            <div class="editor floatL">
              <textarea id="supplierShortTermCorrectiveAct" name = "supplierShortTermCorrectiveAct"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label>{#shotTermImplementationDate#}</label>
            <input id="shotTermImplementationDate" name="shotTermImplementationDate"></input>
          </div>
          <div class="dlgRow">
            <label>{#shortTermVerified#}</label>
            <select id="shortTermVerified" name = "shortTermVerified">
              <option value="1">{#yes#}</option>
              <option value="0" selected>{#no#}</option>
            </select>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#supplierLongTermCorrectiveAct#}</label>
            <div class="editor floatL">
              <textarea id="supplierLongTermCorrectiveAct" name = "supplierLongTermCorrectiveAct"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label>{#longTermImplementationDate#}</label>
            <input id="longTermImplementationDate" name="longTermImplementationDate"></input>
          </div>
          <div class="dlgRow">
            <label>{#vendorProcessAuditPlanRevision#}</label>
            <input id="vendorProcessAuditPlanRevision" name="vendorProcessAuditPlanRevision"></input>
          </div>
          <div class="dlgRow">
            <label>{#longTermVerified#}</label>
            <select id="longTermVerified" name = "longTermVerified">
              <option value="1">{#yes#}</option>
              <option value="0" selected>{#no#}</option>
            </select>
          </div>
          <div class="dlgRow" style="height:20px">
            <label style="width:200px;float:left;">&nbsp;</label>
            <button onfocus="this.blur()" type="submit">{#save#}</button>
            <button onclick="blindtoggle('addQualityDetails');toggleClass('add','add-active','add');toggleClass('add_butn','butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');return false;" onfocus="this.blur()">{#cancel#}</button>
          </div>
        </form>
      </div>
      <div id="editDetailsInfo" class="block_in_wrapper" style="display:none">

      </div>
      <div class="tablemenue">
        <div class="tablemenue-in">
          <a class="butn_link" href="javascript:blindtoggle('addQualityDetails');"  id="addDetails_butn" onclick="toggleClass('add','add-active','add');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');">{#addqualityDetails#}</a>
        </div>
      </div>
      <div class="content-spacer"></div>
    </div> {*Msgs END*}
  </div> {*content-left-in END*}
</div> {*content-left END*}
<script>
  var __projectId = {$project.ID};
  var __sesionId = "{$smarty.session.sessionId}";
  var __userId = "{$smarty.session.userid}";
</script>

{literal}
  <script type = "text/javascript">
    var accord_quality = new accordion('block_msgs');
    var accord_qualityDetails = new accordion('block_details');

    function setFileId(id){
      if($("fileId")){
        $("fileId").value=id;
      }
    }
    
    function renderQualityDetails(content){
      
      $("block_details").innerHTML=content;

    }

    function addQualityDetails(qId){
      alert("add "+qId);
    }

    function showDetailsInfo(id){
      var theUrl = "managequality.php?action=getQualityDetailsInfo&detailsId="+id+"&projectId="+__projectId;
      new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess:function(payload) {
          if (payload.responseText != ""){ 
            $("editDetailsInfo").innerHTML=payload.responseText;
            $("editDetailsInfo").style.display="";
            var swfu;
            swfu = J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"qualitydetails","id":__projectId},"spanButtonPlaceHolder","btnCancel",setFileId);
          }else{
            alert("get data error");
          }
        }
      });
    }

    function saveQualityDetailsValiduator(){
      return true;
    }


    function showQualityDetails(id){
      var theUrl = "manageprojectajax.php?action=getQualityDetails&qId="+id;
      new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess:function(payload) {
          if (payload.responseText != ""){ 
            renderQualityDetails(payload.responseText);
          }else{
            alert("get data error");
          }
        }
      });  
    }
  </script>
{/literal}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}