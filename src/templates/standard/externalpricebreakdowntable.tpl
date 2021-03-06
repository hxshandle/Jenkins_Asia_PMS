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
     
      <th>{#approved#}</th>
    
      <th>{#Published#}</th>
     
    </tr>
    {section name = item loop = $externalpricebreakdownlist}
      {if $smarty.section.item.index % 2 == 0}
        <tr class="color-a">
      {else}
        <tr class="color-b">
      {/if}
        <td align = "center">
          <a target="_blank" href="manageexternalpricebreakdown.php?action=show&id={$externalpricebreakdownlist[item].ID}">{#edit#}</a>
          <a href="#" onclick="J.delTableRow('manageexternalpricebreakdown.php?action=del&id={$externalpricebreakdownlist[item].ID}',this);return false;">{#delete#}</a>
        </td>
      
        <td align = "center">{$externalpricebreakdownlist[item].cost}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].project_no}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].customer_model_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].jenkins_model_number_doc_no}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].customer_assembly_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].jenkins_assembly_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].customer_part_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].jenkins_part_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].customer_drawing_number}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].revision1}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].jenkins_drawing_number_doc_no}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].revision2}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].material}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].additional_material_specification}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].finish|truncate:"10":""}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].material_cost_currency} {$externalpricebreakdownlist[item].material_cost}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].assembly_cost_currency} {$externalpricebreakdownlist[item].assembly_cost}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].overhead_currency} {$externalpricebreakdownlist[item].overhead}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].factory_profit_currency} {$externalpricebreakdownlist[item].factory_profit}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].tax_currency} {$externalpricebreakdownlist[item].tax}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].customs_currency} {$externalpricebreakdownlist[item].customs}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].freight_currency} {$externalpricebreakdownlist[item].freight}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].handling_currency} {$externalpricebreakdownlist[item].handling}</td>
      
        <td align = "center">{$externalpricebreakdownlist[item].internal_budgetary_price_currency} {$externalpricebreakdownlist[item].internal_budgetary_price}</td>
      
        <td align = "center">{if $externalpricebreakdownlist[item].approved == "1"}{#yes#}{else}{#no#}{/if}</td>
      
        <td align = "center">{if $externalpricebreakdownlist[item].Published == "1"}{#yes#}{else}{#no#}{/if}</td>
      
      </tr>
    {/section}
  </table>
</div>