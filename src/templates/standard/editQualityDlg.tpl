{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<script type="text/javascript" src="include/js/quality.js"></script>
<body style="width:742px;background: url(/templates/standard/images/tables-msgs-sechead.png) repeat scroll 0 0 transparent;">
  <div class="msgs block_in_wrapper" >
  <div class="headline" style="margin-bottom:10px">
    <a href="javascript:void(0);" id="block_msgs_toggle" class="win_block" onclick = "toggleBlock('block_msgs');"></a>
    <h2>
      <img src="./templates/standard/images/symbols/msgs.png" alt="" />{#supplierCorrectiveActionReport#}
    </h2>
  </div>
<div id = "block_msgs">
<form id="editQuality" name="editQuality" class="projects" method="post" action="managequality.php?action=saveQuality">
  <input type = "hidden" id="orderId" name = "orderId" value = "{$orderId}"></input>
  <input type = "hidden" id="projectId" name = "projectId" value = "{$projectId}"></input>
  

<div class="dlgRow">
  <label style="">{#actionNo#}<span style="color:red">*</span></label>
  <input id="actionNo" name="actionNo" value = "{$quality.action_no}"></input>
 </div>
 <div class="dlgRow">
  <label style="">{#customerComplianceNo#}<span style="color:red">*</span></label>
  <input id="qualityNo" name="qualityNo" value = "{$quality.quality_no}"></input>
 </div>

<div class="dlgRow">
  <label style="">{#issueDate#}<span style="color:red">*</span></label>
  <input id="issueDate" name="issueDate" value = "{$quality.issue_date|truncate:"10":""}"></input>
  <div class="datepick">
    <div id = "issueDatePicker" class="picker" style = "display:none;"></div>
  </div>
 </div>

 <div class="dlgRow">
  <label style="">{#productNo#}<span style="color:red">*</span></label>
  <input id="productNo" name="productNo" value = "{$quality.product_no}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#productDesc#}<span style="color:red">*</span></label>
  <input id="productDesc" name="productDesc" value = "{$quality.product_desc}"></input>
 </div>
 <div class="dlgRow">
  <label style="">{#shipNo#}<span style="color:red">*</span></label>
  <input id="shipNo" name="shipNo" value = "{$quality.ship_no}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#lotQuantity#}<span style="color:red">*</span></label>
  <input id="lotQuantity" name="lotQuantity" value = "{$quality.lot_quantity}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#sampleSize#}</label>
  <input id="sampleSize" name="sampleSize" value = "{$quality.Sample_size}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#nonComplianceRate#}</label>
  <input id="defects" name="defects" value = "{$quality.defects}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#rejectRate#}</label>
  <input id="rejectRate" name="rejectRate" value = "{$quality.reject_rate}" ></input>%
  
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInInventory#}</label>
  <input id="quantityInInventory" name="quantityInInventory" value = "{$quality.quantity_in_inventory}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInProcess#}</label>
  <input id="quantityInProcess" name="quantityInProcess" value = "{$quality.quantity_in_process}"></input>
 </div>

<div class="dlgRow">
  <label style="">{#containmentDesc#}</label>
  <select id="containmentDesc" name="containmentDesc">
    <option value="sort" {if $quality.containment_desc == 'sort'} selected {/if}>{#sort#}</option>
    <option value="remark" {if $quality.containment_desc == 'remark'} selected {/if}>{#remark#}</option>
    <option value="waier" {if $quality.containment_desc == 'waier'} selected {/if}>{#waier#}</option>
    <option value="scope" {if $quality.containment_desc == 'scope'} selected {/if}>{#scope#}</option>
  </select>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeBy#}</label>
  <input id="acknowledgeBy" name="acknowledgeBy" value = "{$quality.acknowledge_by}"></input>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeDate#}</label>
  <input id="acknowledgeDate" name="acknowledgeDate" value = "{$quality.acknowledge_date|truncate:"10":""}"></input>
  <div class="datepick">
    <div id = "acknowledgeDatePicker" class="picker" style = "display:none;"></div>
  </div>
</div>

<div class="dlgRow">
  <label style="">{#verifiedForClosureBy#}</label>
  <input id="verifiedForClosureBy" name="verifiedForClosureBy" value = "{$quality.verified_for_closure_by}"></input>
</div>

<div class="dlgRow">
  <label style="">{#verificationDate#}</label>
  <input id="verificationDate" name="verificationDate" value = "{$quality.verification_date|truncate:"10":""}"></input>
  <div class="datepick">
    <div id = "verificationDatePicker" class="picker" style = "display:none;"></div>
  </div>
</div>

<div class="dlgRow">
  <label style="">{#notify#}</label>
  <select name = "notify[]" multiple="multiple" style = "height:80px;width:150px" id="notify">
    {section name = m loop=$memberList}
      <option value="{$memberList[m].id}" {if in_array($memberList[m].id, $notifyList)}selected = "selected"{/if}>{$memberList[m].name}</option>
    {/section}
  </select>
</div>
  <input type="hidden" id ="mode" name="mode" value = "update"></input>
  <input type = "hidden" id ="qId" name="qId" value = "{$quality.ID}"></input>
<div  style="margin:10px 0 0 0">
  <button id="dlgBtnSaveQuality" type="submit">{#save#}</button>
</div>
</form>
</div>
<div class="tablemenue"></div>
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
          {include file='qualitydetailslist.tpl'}
      </div>
      
      <!-- End of Details block-->
      <!-- Add details block -->
      <div id = "addQualityDetails" class="block_in_wrapper" style = "display:none;">
        <h2>{#addQualityDetails#}</h2>
        <form id="detailsForm" name="detailsForm"  method="post" action="managequality.php?action=saveDetails&pId={$project.ID}">
          <input type='hidden' name='quality' value='{$qualityId}'></input>

          <div class="dlgRow">
            <label>{#quantity#}</label>
            <input id="quantity" name = "quantity"></input>
          </div>

          <div class="dlgRow">
              <label for="project">{#status#}:</label>
              <select name="status" id="status" required = "1">
                {section name=st loop=$qualityDetailsStatus}
                  <option value="{$qualityDetailsStatus[st].id}">{$qualityDetailsStatus[st].value}</option>
                {/section}
              </select>
          </div>

          <div class="dlgRow">
            <label class="floatL">{#rejectDesc#}</label>
            <div class="editor floatL">
              <textarea  class='largeText' id="rejectDesc" name = "rejectDesc" ></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#requiredDesc#}</label>
            <div class="editor floatL">
              <textarea  class='largeText' id="requiredDesc" name = "requiredDesc"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#rootCause#}</label>
            <div class="editor floatL">
              <textarea  class='largeText' id="rootCause" name = "rootCause"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#containmentAction#}</label>
            <div class="editor floatL">
              <textarea  class='largeText' id="containmentAction" name = "containmentAction"></textarea>
            </div>
            <div class="clear_both_b"></div>
          </div>
          <div class="dlgRow">
            <label class="floatL">{#supplierShortTermCorrectiveAct#}</label>
            <div class="editor floatL">
              <textarea  class='largeText' id="supplierShortTermCorrectiveAct" name = "supplierShortTermCorrectiveAct"></textarea>
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
              <textarea  class='largeText' id="supplierLongTermCorrectiveAct" name = "supplierLongTermCorrectiveAct"></textarea>
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
      <div id="editDetailsInfo" class="block_in_wrapper" style="display:none"></div>
      <div class="tablemenue">
        <div class="tablemenue-in">
          <a class="butn_link" href="javascript:blindtoggle('addQualityDetails');"  id="addDetails_butn" onclick="toggleClass('add','add-active','add');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');">{#addqualityDetails#}</a>
        </div>
      </div>



<script>
var __qualityId = {$quality.ID};
var __sesionId = "{$smarty.session.sessionId}";
var __userId = "{$smarty.session.userid}";


{literal}


    function setFileId(id){
      if($("fileId")){
        $("fileId").value=id;
      }
    }
    function showDetailsInfo(id,projectId){
      __projectId = projectId;
      var theUrl = "managequality.php?action=getQualityDetailsInfo&detailsId="+id+"&qualityId="+__qualityId;
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
{/literal}

{literal}
  function bindDateOPicker(relateTo,target){
{/literal}
    
    theCal = new calendar({$theM},{$theY});
    theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
    theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
    theCal.relateTo = relateTo;
    theCal.dateFormat = "{$settings.dateformat}";
    theCal.getDatepicker(target);

{literal}
  }
  (function(){
    bindDateOPicker('issueDate','issueDatePicker');
    bindDateOPicker('acknowledgeDate','acknowledgeDatePicker');
    bindDateOPicker('verificationDate','verificationDatePicker');
  })();
{/literal}
</script>
</div>
<div class="content-spacer"></div>
</body>


