{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div class="projects block_in_wrapper" >

    <form onsubmit="return validateCompleteForm(this);" action="managecost.php?action=update" method="post" class="main">
      <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
      <input type="hidden" name="costId" id="costId" value="{$cost.ID}"></input>
      <input type = "hidden" id = "project" name ="project" value="{$cost.project}"></input>
      
      <div class="row">
        <label style="width:240px;" >{#projectno#}</label>
        <input id = "project_no" name ="project_no" value="{$cost.project_no}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customermodelnumber#}</label>
        <input id = "customer_model_number" name ="customer_model_number" value="{$cost.customer_model_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsmodelnumber#}</label>
        <input type = "hidden" id = "jenkins_model_number" name ="jenkins_model_number" value="{$cost.jenkins_model_number}"></input>
        <input id="lbl_jenkins_model_number" style="width:191px"></input>
        <a class="butn_link" onclick="J.selectDocument('jenkins_model_number','lbl_jenkins_model_number');">{#selDocuments#}</a>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerassemblynumber#}</label>
        <input id = "customer_assembly_number" name ="customer_assembly_number" value="{$cost.customer_assembly_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerparentassemblynumber#}</label>
        <input id = "customer_parent_assembly_number" name ="customer_parent_assembly_number" value="{$cost.customer_parent_assembly_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsassemblynumber#}</label>
        <input id = "jenkins_assembly_number" name ="jenkins_assembly_number" value="{$cost.jenkins_assembly_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsparentassemblynumber#}</label>
        <input id = "jenkins_parent_assembly_number" name ="jenkins_parent_assembly_number" value="{$cost.jenkins_parent_assembly_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerpartnumber#}</label>
        <input id = "customer_part_number" name ="customer_part_number" value="{$cost.customer_part_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinspartnumber#}</label>
        <input id = "jenkins_part_number" name ="jenkins_part_number" value="{$cost.jenkins_part_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerdrawingnumber#}</label>
        <input id = "customer_drawing_number" name ="customer_drawing_number" value="{$cost.customer_drawing_number}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#revision1#}</label>
        <input id = "revision1" name ="revision1" value="{$cost.revision1}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsdrawingnumber#}</label>
        <input type = "hidden" id = "jenkins_drawing_number" name ="jenkins_drawing_number" value="{$cost.jenkins_drawing_number}"></input>
        <input id="lbl_jenkins_drawing_number" style="width:191px"></input>
        <a class="butn_link" onclick="J.selectDocument('jenkins_drawing_number','lbl_jenkins_drawing_number');">{#selDocuments#}</a>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#revision2#}</label>
        <input id = "revision2" name ="revision2" value="{$cost.revision2}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#internalbudgetaryprice#}</label>
        <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$cost.internal_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#externalbudgetaryprice#}</label>
        <input id = "external_budgetary_price" name ="external_budgetary_price" value="{$cost.external_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#internalalphaprice#}</label>
        <input id = "internal_alpha_price" name ="internal_alpha_price" value="{$cost.internal_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#externalalphaprice#}</label>
        <input id = "external_alpha_price" name ="external_alpha_price" value="{$cost.external_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#internalbetaprice#}</label>
        <input id = "internal_beta_price" name ="internal_beta_price" value="{$cost.internal_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#externalbetaprice#}</label>
        <input id = "external_beta_price" name ="external_beta_price" value="{$cost.external_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#internalfinalprice#}</label>
        <input id = "internal_final_price" name ="internal_final_price" value="{$cost.internal_final_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#quantityperproduct#}</label>
        <input id = "quantity_per_product" name ="quantity_per_product" value="{$cost.quantity_per_product}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#currency#}</label>
        <select id = "currency" name="currency" class="currency">
            {section name=curr loop=$currency}
            {if $currency[curr] == $cost.currency}
                <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
            {else}
                <option value="{$currency[curr]}">{$currency[curr]}</option>
            {/if}
            {/section}
        </select>
      </div>
      
      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#save#}</button>
        <button onfocus="this.blur();" onclick="self.close()" type="reset">{#cancel#}</button>
      </div>
    </form>

  </div>
</body>