{config_load file=lng.conf section = "strings" scope="global" }
<form id="editQuality" name="editQuality">
<div class="dlgRow">
  <label style="">{#actionNo#}</label>
  <input id="actionNo" name="actionNo" value = "{$quality.action_no}"></input>
 </div>

<div class="dlgRow">
  <label style="">{#issueDate#}</label>
  <input id="issueDate" name="issueDate" value = "{$quality.issue_date}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#productNo#}</label>
  <input id="productNo" name="productNo" value = "{$quality.product_no}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#productDesc#}</label>
  <input id="productDesc" name="productDesc" value = "{$quality.product_desc}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#shipNo#}</label>
  <input id="shipNo" name="shipNo" value = "{$quality.ship_no}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#lotQuantity#}</label>
  <input id="lotQuantity" name="lotQuantity" value = "{$quality.lot_quantity}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#sampleSize#}</label>
  <input id="sampleSize" name="sampleSize" value = "{$quality.Sample_size}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#defects#}</label>
  <input id="defects" name="defects" value = "{$quality.defects}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#rejectRate#}</label>
  <input id="rejectRate" name="rejectRate" value = "{$quality.reject_rate}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInInventory#}</label>
  <input id="quantityInInventory" name="quantityInInventory" value = "{$quality.quantity_in_inventory}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInProcess#}</label>
  <input id="quantityInProcess" name="quantityInProcess" value = "{$quality.quantity_in_process}"></input>
 </div>

<div class="dlgRow">
  <label style="">{#containmentDesc#}</label>
  <input id="containmentDesc" name="containmentDesc" value = "{$quality.containment_desc}"></input>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeBy#}</label>
  <input id="acknowledgeBy" name="acknowledgeBy" value = "{$quality.acknowledge_by}"></input>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeDate#}</label>
  <input id="acknowledgeDate" name="acknowledgeDate" value = "{$quality.acknowledge_date}"></input>
</div>

<div class="dlgRow">
  <label style="">{#verifiedForClosureBy#}</label>
  <input id="verifiedForClosureBy" name="verifiedForClosureBy" value = "{$quality.verified_for_closure_by}"></input>
</div>

<div class="dlgRow">
  <label style="">{#verificationDate#}</label>
  <input id="verificationDate" name="verificationDate" value = "{$quality.verification_date}"></input>
</div>
  <input type="hidden" id ="qMode" name="qMode" value = "{$mode}"></input>
  <input type = "hidden" id ="qId" name="qId" value = "{$qId}"></input>
</form>
<div  style="margin:10px 0 0 0">
  <button id="dlgBtnSaveQuality" onclick="saveQuality();">{#save#}</button>
</div>

