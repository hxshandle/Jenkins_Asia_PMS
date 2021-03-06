<div class="block_in_wrapper">
  <h2>{#addECN#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="manageecn.php?action=addEcn" method="post" class="main">
    <fieldset>

      <div class="row">
        <label for="project">{#project#}:</label>
        <select  class="select2 critler-filter" name="project" id="project" onchange="onSelProjectChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=project loop=$projects}
          <option value="{$projects[project].ID}">{$projects[project].name}</option>
          {/section}
        </select>
      </div>

      <div class="row">
        <label for="order">{#order#}:</label>
        <select  class="select2 critler-filter" name="selOrder" id="selOrder" onchange="onSelORderChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>

      <div class="row">
        <label for="order">{#quality#}:</label>
        <select  class="select2 critler-filter" name="selQuality" id="selQuality">
          <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>

      <div class="row">
        <label  >{#ecrnumber#}</label>
        <input id="newEcnName" name="newEcnName"/>
      </div>

      <!-- requester -->
      <div class="row">
        <label  >{#ecn_requester#}</label>
        <input id="ecnRequester" name="ecnRequester" value="{$smarty.session.username}" disabled='true'>
      </div>

      <div class="row">
        <label >{#ecn_reason#}</label>
        <textarea  id="newEcnDescription" name="newEcnDescription"></textarea>
      </div>

      <!-- approved by -->
      <div class="row" style="margin-top:10px">
        <label >{#approved_by#}</label>
        <div id="approved_by-outer"></div>
      </div>
      <div style="clear:both;"></div>

      <!-- notify -->
      <div class="row" style="margin-top:10px">
        <label >{#notify#}</label>
        <div id="notify-outer"></div>
      </div>
      <div style="clear:both;"></div>

      <!-- ecn impacts -->
      <h3>{#ecn_impact#}</h3>
      <hr style="margin-right:44px"/>

      <div class="ecn-impact-container" style="margin-right:44px;clear:both;padding:12px 0px;">
        <div>
          <select name="impactType" id="impactType" style="width:150px;">
            <option value="part">PART</option>
            <option value="tool">TOOL</option>
            <option value="process">PROCESS</option>
            <option value="documentation">DOCUMENTATION</option>
            <option value="other">OTHER</option>
          </select>
          <a href="javascript:addECNImpact();" class="butn_link" style="margin-left:10px;">{#add#}</a>
        </div>
        <div style="clear:both"></div>
        <!-- impact list -->
        <ul id="impact-list"></ul>
        <!-- total cost -->
        <hr style="margin-top:12px;"/>
        <div class="row" style="font-size:1.17em;font-weight:bold;">
          <span>{#total_disposition_cost#}:</span>
          <span id="totalDispositionCost" style="margin-left:8px">0</span>
        </div>
      </div>
      
      <div class="row">
        <label >{#recommand_action#}</label>
        <textarea  id="recommand_action" name="recommand_action"></textarea>
      </div>

      <div class="action-wrapper" style="clear:both;margin-top:20px">
        <button onfocus="this.blur();" type="submit">{#add#}</button>
        <button onfocus="this.blur();" onclick="blindtoggle('form_adddecn');return false;" type="reset">{#cancel#}</button>
      </div>
      <input type="hidden" id="fileId" name="fileId"/>
    </fieldset>
  </form>
</div>
<div id="template" style="display:none">
  <div id="part-tpl" class="impact-part-row ecn-impact-row">
    <div class="impact-container">
      <!-- part_number -->
      <div class="col">
        <label class="impact-label color-part" onclick="removeECNImpact(this)">PART
          <a href="javascript:void(0)"><i class="fa fa-close"></i></a>
        </label>
      </div>
      <div class="col">
        <label for="">{#part_number#}</label>
        <input type="" class="part_number" name="ecnImpact[part][sequence][part_number]" required>
      </div>
      <!-- quantity_in_store -->
      <div class="col">
        <label for="">{#quantity_in_store#}</label>
        <input type="" class="quantity_in_store numeric" name="ecnImpact[part][sequence][quantity_in_store]">
      </div>
      <!-- part_description -->
      <div class="col">
        <label for="">{#part_description#}</label>
        <textarea type="" class="part_description mceNoEditor" name="ecnImpact[part][sequence][part_description]"></textarea>
      </div>
      <!-- cost_per_part -->
      <div class="col">
        <label for="">{#cost_per_part#}</label>
        <input type="" class="cost_per_part numeric" name="ecnImpact[part][sequence][cost_per_part]">
      </div>
      <!-- disposition_type -->
      <div class="col">
        <label for="">{#disposition#}</label>
        <select class="disposition_type" name="ecnImpact[part][sequence][disposition_type]">
          <option value="scrap">{#scrap#}</option>
          <option value="use_as_is">{#use_as_is#}</option>
          <option value="rework">{#reword#}</option>
          <option value="other">{#other#}</option>
        </select>

      </div>
      <!-- remark_or_other -->
      <div class="col">
        <label for="">{#remark_or_other#}</label>
        <textarea type="" class="remark_or_other mceNoEditor" name="ecnImpact[part][sequence][remark_or_other]"></textarea>
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost numeric" name="ecnImpact[part][sequence][disposition_cost]" onblur="ecnImpactRecacluateCost();">
      </div>
    </div>
    <div style="clear:both;"></div>
  </div>
  <div id="tool-tpl" class="impact-tool-row ecn-impact-row">
    <div class="impact-container">
      <div class="col">
        <label class="impact-label color-tool" onclick="removeECNImpact(this)">
          tool
          <a href="javascript:void(0)"> <i class="fa fa-close"></i>
          </a>
        </label>
      </div>
      <!-- tool_number -->
      <div class="col">
        <label for="">{#tool_number#}</label>
        <input type="" class="tool_number" name="ecnImpact[tool][sequence][tool_number]" required></div>
      <!-- tool_description -->
      <div class="col">
        <label for="">{#tool_description#}</label>
        <textarea type="" class="tool_description mceNoEditor" name="ecnImpact[tool][sequence][tool_description]"></textarea>
      </div>
      <!-- disposition_type -->
      <div class="col">
        <label for="">{#disposition#}</label>
        <select class="disposition_type" name="ecnImpact[tool][sequence][disposition_type]">
          <option value="modify">{#scrap#}</option>
          <option value="fabricate_new">{#fabricate_new#}</option>
          <option value="scrap">{#reword#}</option>
          <option value="other">{#other#}</option>
        </select>

      </div>
      <!-- remark_or_other -->
      <div class="col">
        <label for="">{#remark_or_other#}</label>
        <textarea type="" class="remark_or_other mceNoEditor" name="ecnImpact[tool][sequence][remark_or_other]"></textarea>
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost numeric" name="ecnImpact[tool][sequence][disposition_cost]" onblur="ecnImpactRecacluateCost();"></div>
    </div>
    <div style="clear:both;"></div>
  </div>
  <div id="process-tpl" class="impact-process-row ecn-impact-row">
    <div class="impact-container">
      <div class="col">
        <label class="impact-label color-process" onclick="removeECNImpact(this)">process
          <a href="javascript:void(0)"><i class="fa fa-close"></i></a>
        </label>
      </div>
      <!-- process_number -->
      <div class="col">
        <label for="">{#process_number#}</label>
        <input type="" class="process_number" name="ecnImpact[process][sequence][process_number]" required>
      </div>
      <!-- process_description -->
      <div class="col">
        <label for="">{#process_description#}</label>
        <textarea type="" class="process_description mceNoEditor" name="ecnImpact[process][sequence][process_description]"></textarea>
      </div>
      <!-- document_attached -->
      <div class="col">
        <label for="">{#document_attach#}</label>
        <ul data-index=0></ul>
        <a href="javascript:void(0)" onclick="ecnImpactAttachDocument(this)" name="ecnImpact[process][sequence][attachment]" class="butn_link">{#upload#}</a>
      </div>
      <!-- remark_or_other -->
      <div class="col">
        <label for="">{#remark_or_other#}</label>
        <textarea type="" class="remark_or_other mceNoEditor" name="ecnImpact[process][sequence][remark_or_other]"></textarea>
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost numeric" name="ecnImpact[process][sequence][disposition_cost]" onblur="ecnImpactRecacluateCost();">
      </div>
    </div>
    <div style="clear:both;"></div>
  </div>
  <div id="documentation-tpl" class="impact-document-row ecn-impact-row">
    <div class="impact-container">
      <div class="col">
        <label class="impact-label color-document" onclick="removeECNImpact(this)">document
          <a href="javascript:void(0)"><i class="fa fa-close"></i></a>
        </label>
      </div>
      <!-- document_number -->
      <div class="col">
        <label for="">{#document_number#}</label>
        <input type="" class="document_number" name="ecnImpact[documentation][sequence][document_number]" required>
      </div>
      <!-- document_description -->
      <div class="col">
        <label for="">{#document_description#}</label>
        <textarea type="" class="document_description mceNoEditor" name="ecnImpact[documentation][sequence][document_description]"></textarea>
      </div>
      <!-- document_attached -->
      <div class="col">
        <label for="">{#document_attach#}</label>
        <ul data-index=0></ul>
        <a href="javascript:void(0)" onclick="ecnImpactAttachDocument(this)" class="butn_link" name="ecnImpact[documentation][sequence][attachment]">{#upload#}</a>
      </div>
      <!-- remark_or_other -->
      <div class="col">
        <label for="">{#remark_or_other#}</label>
        <textarea type="" class="remark_or_other mceNoEditor" name="ecnImpact[documentation][sequence][remark_or_other]"></textarea>
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost numeric" name="ecnImpact[documentation][sequence][disposition_cost]" onblur="ecnImpactRecacluateCost();">
      </div>
    </div>
    <div style="clear:both;"></div>
  </div>
  <div id="other-tpl" class="impact-other-row ecn-impact-row">
    <div class="impact-container">
      <div class="col">
        <label class="impact-label color-other" onclick="removeECNImpact(this)">other
          <a href="javascript:void(0)"><i class="fa fa-close"></i></a>
        </label>
      </div>
      <!-- other_description -->
      <div class="col">
        <label for="">{#other_description#}</label>
        <textarea type="" class="other_description mceNoEditor" name="ecnImpact[other][sequence][other_description]" required></textarea>
      </div>
      <!-- other_disposition -->
      <div class="col">
        <label for="">{#disposition_type#}</label>
        <textarea type="" class="other_disposition mceNoEditor" name="ecnImpact[other][sequence][other_disposition]"></textarea>
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost numeric" name="ecnImpact[other][sequence][disposition_cost]" onblur="ecnImpactRecacluateCost();">
      </div>
    </div>
    <div style="clear:both;"></div>
  </div>

</div>
<script type = "text/javascript" src = "include/js/ecn.js" ></script>
