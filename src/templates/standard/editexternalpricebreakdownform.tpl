{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div class="projects block_in_wrapper" >

    <form onsubmit="return validateCompleteForm(this);" action="manageexternalpricebreakdown.php?action=update" method="post" class="main">
      <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
      <input type="hidden" name="externalpricebreakdownId" id="externalpricebreakdownId" value="{$externalpricebreakdown.ID}"></input>

      
      <div class="row">
        <label style="width:240px;" >{#cost#}</label>
        <input id = "cost" name ="cost" value="{$externalpricebreakdown.cost}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#projectno#}</label>
        <input id = "project_no" name ="project_no" value="{$externalpricebreakdown.project_no}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customermodelnumber#}</label>
        <input id = "customer_model_number" name ="customer_model_number" value="{$externalpricebreakdown.customer_model_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsmodelnumber#}</label>
        <input id = "jenkins_model_number" name ="jenkins_model_number" value="{$externalpricebreakdown.jenkins_model_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerassemblynumber#}</label>
        <input id = "customer_assembly_number" name ="customer_assembly_number" value="{$externalpricebreakdown.customer_assembly_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsassemblynumber#}</label>
        <input id = "jenkins_assembly_number" name ="jenkins_assembly_number" value="{$externalpricebreakdown.jenkins_assembly_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerpartnumber#}</label>
        <input id = "customer_part_number" name ="customer_part_number" value="{$externalpricebreakdown.customer_part_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinspartnumber#}</label>
        <input id = "jenkins_part_number" name ="jenkins_part_number" value="{$externalpricebreakdown.jenkins_part_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customerdrawingnumber#}</label>
        <input id = "customer_drawing_number" name ="customer_drawing_number" value="{$externalpricebreakdown.customer_drawing_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#revision1#}</label>
        <input id = "revision1" name ="revision1" value="{$externalpricebreakdown.revision1}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#jenkinsdrawingnumber#}</label>
        <input id = "jenkins_drawing_number" name ="jenkins_drawing_number" value="{$externalpricebreakdown.jenkins_drawing_number}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#revision2#}</label>
        <input id = "revision2" name ="revision2" value="{$externalpricebreakdown.revision2}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#material#}</label>
        <input id = "material" name ="material" value="{$externalpricebreakdown.material}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#additionalmaterialspecification#}</label>
        <input id = "additional_material_specification" name ="additional_material_specification" value="{$externalpricebreakdown.additional_material_specification}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#finish#}</label>
        <input id = "finish" name ="finish" value="{$externalpricebreakdown.finish}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#materialcost#}</label>
        <input id = "material_cost" name ="material_cost" value="{$externalpricebreakdown.material_cost}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#assemblycost#}</label>
        <input id = "assembly_cost" name ="assembly_cost" value="{$externalpricebreakdown.assembly_cost}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#overhead#}</label>
        <input id = "overhead" name ="overhead" value="{$externalpricebreakdown.overhead}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#factoryprofit#}</label>
        <input id = "factory_profit" name ="factory_profit" value="{$externalpricebreakdown.factory_profit}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#tax#}</label>
        <input id = "tax" name ="tax" value="{$externalpricebreakdown.tax}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#customs#}</label>
        <input id = "customs" name ="customs" value="{$externalpricebreakdown.customs}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#freight#}</label>
        <input id = "freight" name ="freight" value="{$externalpricebreakdown.freight}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#handling#}</label>
        <input id = "handling" name ="handling" value="{$externalpricebreakdown.handling}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#internalbudgetaryprice#}</label>
        <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$externalpricebreakdown.internal_budgetary_price}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#currency#}</label>
        <input id = "currency" name ="currency" value="{$externalpricebreakdown.currency}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#approved#}</label>
        <input id = "approved" name ="approved" value="{$externalpricebreakdown.approved}"></input>
      </div>
      
      <div class="row">
        <label style="width:240px;" >{#Published#}</label>
        <input id = "Published" name ="Published" value="{$externalpricebreakdown.Published}"></input>
      </div>
      
      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#save#}</button>
        <button onfocus="this.blur();" onclick="self.close()" type="reset">{#cancel#}</button>
      </div>
    </form>

  </div>
</body>