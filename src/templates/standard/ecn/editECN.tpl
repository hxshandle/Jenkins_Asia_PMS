{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  {literal}
  <style type="text/css">
    .editFiled{
      padding-left:0px!important;
      width:622px;
    }
  </style>
  {/literal}
  <div class="projects block_in_wrapper" style="padding-right:44px;color:#333">
    <h1 style="color:#333;padding-top:32px;">{#ecnname#}</h1>
    <ul class="ecn-base-attr">
      <!-- project name -->
      <li>
        <span>{#projectname#}</span>
        <div>{$projectName}</div>
      </li>
      <!-- ecn name -->
      <li>
        <span>{#ecn_number#}</span>
        <div>
          <div class="editFiled"><input name="ecn[name]" value="{$ecn.name}"/></div>
          <span class="dispFild">{$ecn.name}</span>
        </div>
      </li>
      <!-- ecn reason -->
      <li>
        <span>{#ecn_reason#}</span>
        <div>
          <span class="dispField">{$ecn.submitter_comments}</span>
          <div class="editFiled">
            <textarea name="ecn[description]">{$ecn.submitter_comments}</textarea>
          </div>
        </div>
      </li>
      <!-- ecn requester -->
      <li>
        <span>{#ecn_requester#}</span>
        <div>{$ecnRequester}</div>
      </li>
      <!-- ecn approved by -->
      <li>
        <span>{#approved_by#}</span>
        <div>{$ecnApprovedBy|default:"N/A"}</div>
      </li>
      <!-- Total Disposition Cost -->
      <li>
        <span>{#total_disposition_cost#}</span>
        <div class="totalCost">{$totalCost|default:"0"}</div>
      </li>
      <!-- Total Disposition Cost -->
      <li>
        <span>{#recommand_action#}</span>
        <div>
          <span class="dispField">{$ecn.recommand_action|default:"N/A"}</span>
          <div class="editFiled">
            <textarea name="ecn[recommand_action]">{$ecn.recommand_action}</textarea>
          </div>
        </div>

      </li>
      <li>
        <span>{#ecn_impact#}</span>
        <div class="impacts">
          <div style="padding-left:0">
            <select name="impactType" id="impactType" style="width:150px;float:left;">
              <option value="part">PART</option>
              <option value="tool">TOOL</option>
              <option value="process">PROCESS</option>
              <option value="documentation">DOCUMENTATION</option>
              <option value="other">OTHER</option>
            </select>
            <a href="javascript:addECNImpact();" class="butn_link" style="margin-left:10px;">{#add#}</a>
          </div>
          <div style="clear:both"></div>
          <ul id="impact-list"></ul>
          {foreach from=$impacts key=impactName item=dataList}

          <span class="head">{$impactName|regex_replace:"/ecn_impact_/":""|upper}</span>
          <hr/>
          <div class="impact-list">
            <!-- part -->
            {if $impactName == "ecn_impact_part"}

            {include file="_ecn_impact_table_part.tpl" data=$dataList canDel=true}
            {/if}
            <!-- tool -->
            {if $impactName == "ecn_impact_tool"}
            {include file="_ecn_impact_table_tool.tpl" data=$dataList canDel=true}
            {/if}
            <!-- process -->
            {if $impactName == "ecn_impact_process"}
            {include file="_ecn_impact_table_process.tpl" data=$dataList canDel=true}
            {/if}
            <!-- documentation -->
            {if $impactName == "ecn_impact_documentation"}
            {include file="_ecn_impact_table_documentation.tpl" data=$dataList canDel=true}
            {/if}
            <!-- other -->
            {if $impactName == "ecn_impact_other"}
            {include file="_ecn_impact_table_other.tpl" data=$dataList canDel=true}
            {/if}
          </div>

          {/foreach}
        </div>
      </li>
      <!-- ecn files -->
      <li>
        <span>{#files#}</span>
        <div>
          <ul id="ecnList">
            {section name=d loop=$documents}
            <li><a target="blank" href="{$documents[d].download_url}">{$documents[d].name}&nbsp {$documents[d].document_no}&nbspRev.{$documents[d].revision}</a></li>
            {/section}
          </ul>
        </div>
      </li>
    </ul>

  <!-- start template -->
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
  <!-- end template -->
  <div style="margin:20px 0;height:50px;">
    <a href="javascript:void(0)" class="butn_link" onclick="saveEcn();">Save</a>
    <a href="javascript:void(0)" class="butn_link" onclick="reviewEcn();">Review</a>
  </div>
  <script type = "text/javascript" src = "include/js/ecn.js" ></script>
  {literal}
  <script type="text/javascript">
      function saveEcn(){}
      function reviewEcn(){}
  </script>
  {/literal}
</body>