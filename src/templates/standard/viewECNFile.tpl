{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
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
      <div>{$ecn.name}</div>
    </li>
    <!-- ecn reason -->
    <li>
      <span>{#ecn_reason#}</span>
      <div>{$ecn.submitter_comments}</div>
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

    <!-- ecn impacts -->
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

  <div style="float:right;padding:8px;">
    
  </div>
</div>
</body>