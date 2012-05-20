{config_load file=lng.conf section = "strings" scope="global" }  
<table class="qualityListTable" cellspadding=0 cellspacing=0 style="width:1800px">
   <tr class="bold">
    <td>{#actionNo#}</td>
    <td>{#issueDate#}</td>
    <td>{#productNo#}</td>
    <td>{#productDesc#}</td>
    <td>{#shipNo#}</td>
    <td>{#lotQuantity#}</td>
    <td>{#sampleSize#}</td>
    <td>{#defects#}</td>
    <td>{#rejectRate#}</td>
    <td>{#quantityInInventory#}</td>
    <td>{#quantityInProcess#}</td>
    <td>{#containmentDesc#}</td>
    <td>{#acknowledgeBy#}</td>
    <td>{#acknowledgeDate#}</td>
    <td>{#verifiedForClosureBy#}</td>
    <td>{#verificationDate#}</td>
  </tr>
  {section name = quality loop = $qualityList}
    {if $smarty.section.quality.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
    <td>{$qualityList[quality].action_no}</td>
    <td>{$qualityList[quality].issue_date|truncate:"10":""}</td>
    <td>{$qualityList[quality].product_no}</td>
    <td>{$qualityList[quality].product_desc}</td>
    <td>{$qualityList[quality].ship_no}</td>
    <td>{$qualityList[quality].lot_quantity}</td>
    <td>{$qualityList[quality].Sample_size}</td>
    <td>{$qualityList[quality].defects}</td>
    <td>{$qualityList[quality].reject_rate}</td>
    <td>{$qualityList[quality].quantity_in_inventory}</td>
    <td>{$qualityList[quality].quantity_in_process}</td>
    <td>{$qualityList[quality].containment_desc}</td>
    <td>{$qualityList[quality].acknowledge_by}</td>
    <td>{$qualityList[quality].acknowledge_date|truncate:"10":""}</td>
    <td>{$qualityList[quality].verified_for_closure_by}</td>
    <td>{$qualityList[quality].verification_date|truncate:"10":""}</td>

    </tr>
  {/section}
  </table>