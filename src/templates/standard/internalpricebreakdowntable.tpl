{config_load file=lng.conf section = "strings" scope="global" }
<div style="overflow:auto;max-height:400px;margin-right:20px;">
  <table style="width: 3000px" cellspadding=0 cellspacing=0>
    <tr>
      <th></th>
    
      <th>{#cost#}</th>
    
      <th>{#projectno#}</th>
    
      <th>{#customermodelnumber#}</th>
    
      <th>{#jenkinsmodelnumber#}</th>
    
      <th>{#customerassemblynumber#}</th>
    
      <th>{#jenkinsassemblynumber#}</th>
    
      <th>{#customerpartnumber#}</th>
    
      <th>{#jenkinspartnumber#}</th>
    
      <th>{#customerdrawingnumber#}</th>
    
      <th>{#revision1#}</th>
    
      <th>{#jenkinsdrawingnumber#}</th>
    
      <th>{#revision2#}</th>
    
      <th>{#material#}</th>
    
      <th>{#additionalmaterialspecification#}</th>
    
      <th>{#finish#}</th>
    
      <th>{#materialcost#}</th>
    
      <th>{#assemblycost#}</th>
    
      <th>{#overhead#}</th>
    
      <th>{#factoryprofit#}</th>
    
      <th>{#tax#}</th>
    
      <th>{#customs#}</th>
    
      <th>{#freight#}</th>
    
      <th>{#handling#}</th>
    
      <th>{#internalbudgetaryprice#}</th>
    
     
    </tr>
    {section name = item loop = $internalpricebreakdownlist}
      {if $smarty.section.item.index % 2 == 0}
        <tr class="color-a">
      {else}
        <tr class="color-b">
      {/if}
        <td align = "center">
          <a target="_blank" href="manageinternalpricebreakdown.php?action=show&id={$internalpricebreakdownlist[item].ID}">{#edit#}</a>
          <a href="#" onclick="J.delTableRow('manageinternalpricebreakdown.php?action=del&id={$internalpricebreakdownlist[item].ID}',this);return false;">{#delete#}</a>
        </td>
      
        <td align = "center">{$internalpricebreakdownlist[item].cost}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].project_no}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].customer_model_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].jenkins_model_number_doc_no}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].customer_assembly_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].jenkins_assembly_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].customer_part_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].jenkins_part_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].customer_drawing_number}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].revision1}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].jenkins_drawing_number_doc_no}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].revision2}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].material}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].additional_material_specification}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].finish|truncate:"10":""}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].material_cost_currency} {$internalpricebreakdownlist[item].material_cost}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].assembly_cost_currency} {$internalpricebreakdownlist[item].assembly_cost}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].overhead_currency} {$internalpricebreakdownlist[item].overhead}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].factory_profit_currency} {$internalpricebreakdownlist[item].factory_profit}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].tax_currency} {$internalpricebreakdownlist[item].tax}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].customs_currency} {$internalpricebreakdownlist[item].customs}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].freight_currency} {$internalpricebreakdownlist[item].freight}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].handling_currency} {$internalpricebreakdownlist[item].handling}</td>
      
        <td align = "center">{$internalpricebreakdownlist[item].internal_budgetary_price_currency} {$internalpricebreakdownlist[item].internal_budgetary_price}</td>
            
      </tr>
    {/section}
  </table>
</div>