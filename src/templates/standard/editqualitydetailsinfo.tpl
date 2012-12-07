{config_load file=lng.conf section = "strings" scope="global" }
<h2>{#editDetails#}</h2>
<form id="detailsForm" name="detailsForm"  method="post" action="managequality.php?action=updateDetails&projectId={$projectId}&detailsId={$detailsId}">
  <div class="dlgRow">
    <label>{#quantity#}</label>
    <input id="quantity" name = "quantity" value="{$data.quantity}"></input>
  </div>
  <div class="dlgRow">
    <label class="floatL">{#rejectDesc#}</label>
    <div class="editor floatL">
      <textarea id="rejectDesc" name = "rejectDesc" value="{$data.reject_desc}">{$data.reject_desc}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
      <label for="project">{#status#}:</label>
      <select name="status" id="status" required = "1">
        {section name=st loop=$qualityDetailsStatus}
          <option {if $qualityDetailsStatus[st].id == $data.status} selected {/if} value="{$qualityDetailsStatus[st].id}">{$qualityDetailsStatus[st].value}</option>
        {/section}
      </select>
  </div>

  <div class="dlgRow">
    <label class="floatL">{#requiredDesc#}</label>
    <div class="editor floatL">
      <textarea id="requiredDesc" name = "requiredDesc" value="{$data.required_desc}">{$data.required_desc}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
    <label class="floatL">{#rootCause#}</label>
    <div class="editor floatL">
      <textarea id="rootCause" name = "rootCause" value="">{$data.root_cause}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
    <label class="floatL">{#containmentAction#}</label>
    <div class="editor floatL">
      <textarea id="containmentAction" name = "containmentAction" value="">{$data.containment_action}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
    <label class="floatL">{#supplierShortTermCorrectiveAct#}</label>
    <div class="editor floatL">
      <textarea id="supplierShortTermCorrectiveAct" name = "supplierShortTermCorrectiveAct" value="">{$data.supplier_short_term_corrective_act}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
    <label>{#shotTermImplementationDate#}</label>
    <input id="shotTermImplementationDate" name="shotTermImplementationDate" value="{$data.shot_term_implementation_date|truncate:"10":""}"></input>
  </div>
  <div class="dlgRow">
    <label>{#shortTermVerified#}</label>
    <select id="shortTermVerified" name = "shortTermVerified">
      <option value="1" {if $data.short_term_verified == 1}selected{/if}>{#yes#}</option>
      <option value="0" {if $data.short_term_verified == 0}selected{/if}>{#no#}</option>
    </select>
  </div>
  <div class="dlgRow">
    <label class="floatL">{#supplierLongTermCorrectiveAct#}</label>
    <div class="editor floatL">
      <textarea id="supplierLongTermCorrectiveAct" name = "supplierLongTermCorrectiveAct" value="">{$data.supplier_long_term_corrective_act}</textarea>
    </div>
    <div class="clear_both_b"></div>
  </div>
  <div class="dlgRow">
    <label>{#longTermImplementationDate#}</label>
    <input id="longTermImplementationDate" name="longTermImplementationDate" value="{$data.long_term_implementation_date|truncate:"10":""}"></input>
  </div>


  <div class="dlgRow">
    <label>{#vendorProcessAuditPlanRevision#}</label>
    <input id="vendorProcessAuditPlanRevision" name="vendorProcessAuditPlanRevision" value="{$data.vendor_process_audit_plan_revision}"></input>
  </div>
  <div class="dlgRow">
    <label>{#longTermVerified#}</label>
    <select id="longTermVerified" name = "longTermVerified">
      <option value="1" {if $data.long_term_verified == 1}selected{/if}>{#yes#}</option>
      <option value="0" {if $data.long_term_verified == 0}selected{/if}>{#no#}</option>
    </select>
  </div>
  <div class="dlgRow">
    <label>{#file#}</label>
    <ul style="margin-left:200px">
      {section name=f loop=$data.files}
      <li><a target="blank" href="{$data.files[f].datei}">{$data.files[f].name}</a></li>
      {/section}
    </li>
  </div>
    <div class="dlgRow">
    <label style="float:left">{#upload#}</label>
    <input type="hidden" id="fileId" name="fileId"></input>
    <div>
      {include file="uploadfile.tpl" lazyLoad=true callbackFunc=updateFileId}
    </div>
  </div>
  <div class="clear_both_b"></div>
  <div class="dlgRow" style="height:20px">
    <label style="width:200px;float:left;">&nbsp;</label>
    <button onfocus="this.blur()" type="submit">{#save#}</button>
    <button onclick="blindtoggle('editDetailsInfo');toggleClass('add','add-active','add');toggleClass('add_butn','butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');return false;" onfocus="this.blur()">{#cancel#}</button>
  </div>
  <script>
  </script>
</form>