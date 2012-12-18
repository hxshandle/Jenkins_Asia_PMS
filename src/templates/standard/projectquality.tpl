{include file="header.tpl"  jsload = "ajax"  jsload1="tinymce" jsload3 = "lightbox"}
{include file="tabsmenue-desk.tpl" qualitystab = "active"}
<script type="text/javascript" src="include/swfupload/swfupload.js"></script>
<script type="text/javascript" src="include/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="include/js/fileprogress.js"></script>
<script type="text/javascript" src="include/js/handlers.js"></script>
<script type="text/javascript" src="include/js/quality.js"></script>
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


      <h1> {#quality#}</span></h1>

      <div class="headline">
        <a href="javascript:void(0);" id="block_msgs_toggle" class="win_block" onclick = "toggleBlock('block_msgs');"></a>
        <div class="wintools">
          {if $userpermissions.messages.add}
            <a class="add" href="javascript:blindtoggle('addmsg{$myprojects[project].ID}');" id="add" onclick="toggleClass(this,'add-active','add');toggleClass('add_butn','butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');"><span>{#addmessage#}</span></a>
          {/if}
        </div>
        <h2>
          <img src="./templates/standard/images/symbols/msgs.png" alt="" />{#supplierCorrectiveActionReport#}
        </h2>
      </div>


      <div id="searchArea" class="block_in_wrapper block">
        <form class="main">
        <h1>{#filter#}</h1>
            <div class="row">
              <label for="project">{#project#}:</label>
              <select name="criteriaProject" id="criteriaProject" onchange="onCriteriaProjectChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=project loop=$projects}
                  <option value="{$projects[project].ID}">{$projects[project].name}</option>
                {/section}
              </select>
            </div>

            <div class="row">
              <label for="customer">{#customer#}:</label>
              <select name="criteriaCustomer" id="criteriaCustomer" onchange="onCriteriaCustomerChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=customer loop=$customers}
                  <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
                {/section}
              </select>
            </div>

          </form>
            <div class="clear_both"></div>
      </div>



      <div id="block_msgs" class="block" >

        {*Add Message*}
        <div id = "addmsg" class="block_in_wrapper" style = "display:none;">
          {include file="editQualityForm.tpl" }
          <div class="clear_both_b"></div>
        </div>

        <div class="nosmooth" id="qualityTable">
          {include file = "qualityTable.tpl"}
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
              <label for="project">{#project#}:</label>
              <select name="addDetailsProject" id="addDetailsProject" onchange="onAddDetailsProjectChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=project loop=$projects}
                  <option value="{$projects[project].ID}">{$projects[project].name}</option>
                {/section}
              </select>
            </div>

          <div class="dlgRow">
            <label>{#actionNo#}</label>
            <select id="quality" name="quality">
              <option value="-1" selected="selected">{#chooseone#}</option>
            </select>
          </div>
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
  var __projectId = "{$project.ID}";
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
