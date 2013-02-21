{config_load file=lng.conf section = "strings" scope="global" }
<div style="overflow:auto;max-height:400px;margin-right:20px;">
  <table style="width: 3000px" cellspadding=0 cellspacing=0>
    <tr>
      <th></th>
    
      <th>{#project#}</th>
    
      <th>{#projectno#}</th>
    
      <th>{#customermodelnumber#}</th>
    
      <th>{#jenkinsmodelnumber#}</th>
    
      <th>{#customerassemblynumber#}</th>
    
      <th>{#customerparentassemblynumber#}</th>
    
      <th>{#jenkinsassemblynumber#}</th>
    
      <th>{#jenkinsparentassemblynumber#}</th>
    
      <th>{#customerpartnumber#}</th>
    
      <th>{#jenkinspartnumber#}</th>
    
      <th>{#customerdrawingnumber#}</th>
    
      <th>{#revision1#}</th>
    
      <th>{#jenkinsdrawingnumber#}</th>
    
      <th>{#revision2#}</th>
    
      <th>{#internalbudgetaryprice#}</th>
    
      <th>{#externalbudgetaryprice#}</th>
    
      <th>{#internalalphaprice#}</th>
    
      <th>{#externalalphaprice#}</th>
    
      <th>{#internalbetaprice#}</th>
    
      <th>{#externalbetaprice#}</th>
    
      <th>{#internalfinalprice#}</th>

      <th>{#externalfinalprice#}</th>
    
      <th>{#quantityperproduct#}</th>
    
      <th>{#currency#}</th>
     
    </tr>
    {section name = item loop = $costlist}
      {if $smarty.section.item.index % 2 == 0}
        <tr class="color-a">
      {else}
        <tr class="color-b">
      {/if}
        <td align = "center">
          <a target="_blank" href="managecost.php?action=show&id={$costlist[item].ID}">{#edit#}</a>
          <a href="#" onclick="J.delTableRow('managecost.php?action=del&id={$costlist[item].ID}',this);return false;">{#delete#}</a>
        </td>
      
        <td align = "center">{$costlist[item].project}</td>
      
        <td align = "center">{$costlist[item].project_no}</td>
      
        <td align = "center">{$costlist[item].customer_model_number}</td>
      
        <td align = "center">{$costlist[item].jenkins_model_number_doc_no}</td>
      
        <td align = "center">{$costlist[item].customer_assembly_number}</td>
      
        <td align = "center">{$costlist[item].customer_parent_assembly_number}</td>
      
        <td align = "center">{$costlist[item].jenkins_assembly_number}</td>
      
        <td align = "center">{$costlist[item].jenkins_parent_assembly_number}</td>
      
        <td align = "center">{$costlist[item].customer_part_number}</td>
      
        <td align = "center">{$costlist[item].jenkins_part_number}</td>
      
        <td align = "center">{$costlist[item].customer_drawing_number}</td>
      
        <td align = "center">{$costlist[item].revision1}</td>
      
        <td align = "center">{$costlist[item].jenkins_drawing_number_doc_no}</td>
      
        <td align = "center">{$costlist[item].revision2}</td>
      
        <td align = "center">{$costlist[item].internal_budgetary_price_currency} {$costlist[item].internal_budgetary_price}</td>
      
        <td align = "center">{$costlist[item].external_budgetary_price_currency} {$costlist[item].external_budgetary_price}</td>
      
        <td align = "center">{$costlist[item].internal_alpha_price_currency} {$costlist[item].internal_alpha_price}</td>
      
        <td align = "center">{$costlist[item].external_alpha_price_currency} {$costlist[item].external_alpha_price}</td>
      
        <td align = "center">{$costlist[item].internal_beta_price_currency} {$costlist[item].internal_beta_price}</td>
      
        <td align = "center">{$costlist[item].external_beta_price_currency} {$costlist[item].external_beta_price}</td>
      
        <td align = "center">{$costlist[item].internal_final_price_currency} {$costlist[item].internal_final_price}</td>

        <td align = "center">{$costlist[item].external_final_price_currency} {$costlist[item].external_final_price}</td>
      
        <td align = "center">{$costlist[item].quantity_per_product}</td>
      
        <td align = "center">{$costlist[item].currency}</td>
      
      </tr>
    {/section}
  </table>
</div>