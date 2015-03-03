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
          {foreach from=$impacts key=impactName item=dataList}

          <span class="head">{$impactName|regex_replace:"/ecn_impact_/":""|upper}</span>
          <hr/>
          <div class="impact-list">
            <!-- part -->
            {if $impactName == "ecn_impact_part"}
            {include file="_ecn_impact_table_part.tpl" data=$dataList}
            {/if}
            <!-- tool -->
            {if $impactName == "ecn_impact_tool"}
            {include file="_ecn_impact_table_tool.tpl" data=$dataList}
            {/if}
            <!-- process -->
            {if $impactName == "ecn_impact_process"}
            {include file="_ecn_impact_table_process.tpl" data=$dataList}
            {/if}
            <!-- documentation -->
            {if $impactName == "ecn_impact_documentation"}
            {include file="_ecn_impact_table_documentation.tpl" data=$dataList}
            {/if}
            <!-- other -->
            {if $impactName == "ecn_impact_other"}
            {include file="_ecn_impact_table_other.tpl" data=$dataList}
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
    <div style="margin:20px 0;height:50px;">
      <a href="javascript:void(0)" class="butn_link" onclick="saveEcn();">Save</a>
      <a href="javascript:void(0)" class="butn_link" onclick="reviewEcn();">Review</a>
    </div>
  </div>
  {literal}
  <script type="text/javascript">
      function saveEcn(){}
      function reviewEcn(){}
  </script>
  {/literal}
</body>