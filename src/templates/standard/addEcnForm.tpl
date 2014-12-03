<div class="block_in_wrapper">
  <h2>{#addECN#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="manageecn.php?action=addEcn" method="post" class="main">
    <fieldset>

      <div class="row">
        <label for="project">{#project#}:</label>
        <select name="project" id="project" onchange="onSelProjectChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=project loop=$projects}
          <option value="{$projects[project].ID}">{$projects[project].name}</option>
          {/section}
        </select>
      </div>

      <div class="row">
        <label for="order">{#order#}:</label>
        <select name="selOrder" id="selOrder" onchange="onSelORderChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>

      <div class="row">
        <label for="order">{#quality#}:</label>
        <select name="selQuality" id="selQuality">
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

      <!-- ecn impacts -->
      <h3>{#ecn_impact#}</h3>
      <hr style="margin-right:44px"/>

      <div class="ecn-impact-container" style="margin-right:44px;clear:both;">
        <div>
          <select name="impactType" id="impactType" style="width:150px;">
            <option value="part">PART</option>
            <option value="tool">TOOL</option>
            <option value="process">PROCESS</option>
            <option value="dcoumentation">DOCUMENTATION</option>
            <option value="other">OTHER</option>
          </select>
          <a href="javascript:addECNImpact();" class="butn_link" style="margin-left:10px;">{#add#}</a>
        </div>
      </div>

      <div class="action-wrapper" style="clear:both;">
        <button onfocus="this.blur();" type="submit">{#add#}</button>
        <button onfocus="this.blur();" onclick="blindtoggle('form_adddocument');return false;" type="reset">{#cancel#}</button>
      </div>
      <input type="hidden" id="fileId" name="fileId"/>
    </fieldset>
  </form>
</div>
<div id="template">
  <div id="part-tpl">
    <div class="impact-container">
      <!-- part_number -->
      <div class="col">
        <label for="">{#part_number#}</label>
        <input type="" class="part_number" name="ecnImpact[part][sequence][part_number]">
      </div>
      <!-- quanity_in_store -->
      <div class="col">
        <label for="">{#quanity_in_store#}</label>
        <input type="" class="quanity_in_store numeric" name="ecnImpact[part][sequence][quanity_in_store]">
      </div>
      <!-- part_description -->
      <div class="col">
        <label for="">{#part_description#}</label>
        <textarea type="" class="part_description" name="ecnImpact[part][sequence][part_description]"></textarea>
      </div>
      <!-- cost_per_part -->
      <div class="col">
        <label for="">{#cost_per_part#}</label>
        <input type="" class="cost_per_part" name="ecnImpact[part][sequence][cost_per_part]">
      </div>
      <!-- disposition_type -->
      <div class="col">
        <label for="">{#disposition_type#}</label>
        <input type="" class="disposition_type" name="ecnImpact[part][sequence][disposition_type]">
      </div>
      <!-- remark_or_other -->
      <div class="col">
        <label for="">{#remark_or_other#}</label>
        <input type="" class="remark_or_other" name="ecnImpact[part][sequence][remark_or_other]">
      </div>
      <!-- disposition_cost -->
      <div class="col">
        <label for="">{#disposition_cost#}</label>
        <input type="" class="disposition_cost" name="ecnImpact[part][sequence][disposition_cost]">
      </div>
    </div>
  </div>
</div>
<script type = "text/javascript" src = "include/js/ecn.js" ></script>