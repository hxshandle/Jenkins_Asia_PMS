<div class="block_in_wrapper">
  <h2>{#addOrder#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="manageorder.php?action=addOrder" method="post" class="main">
    <fieldset>

      <div class="row">
        <label for="project">{#project#}:</label>
        <select name="project" id="project" onchange="onAddOrderSelProjectChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=project loop=$projects}
            <option value="{$projects[project].ID}">{$projects[project].name}</option>
          {/section}
        </select>
      </div>

      <div class="row">
        <label style="" >{#customerPoNumber#}</label>
        <input id="newCustomerPoNumber" name="newCustomerPoNumber"></input>
      </div>


      <div class="row">
        <label style="" >{#order#}</label>
        <input id="newOrderName" name="newOrderName"></input>
      </div>

      <div class="row">
        <label style="">{#orderdesc#}</label>
        <textarea id="newOrderDesc" name="newOrderDesc"></textarea>
      </div>

      <div class="row">
        <label style="">{#quantity#}</label>
        <input id="newOrderQuantity" name="newOrderQuantity"   regexp="{literal}\d+{/literal}"></input>
      </div>

      <div class="row" >
        <label style="">{#ordertime#}</label>
        <input id="newOrderTime" name="newOrderTime"></input>
      </div>
    
      <div class="row">
        <label style="">{#deliverydateone#}</label>
        <input id="newDeliveryDateOne" name="newDeliveryDateOne"></input>
      </div>

      <div class="row">
        <label style="">{#deliverydatetwo#}</label>
        <input id="newDeliveryDateTwo" name="newDeliveryDateTwo"></input>
      </div>

      <div class="row">
        <label style="">{#mydocuments#}</label>
        <div style="float:left">
          <ul id="documentList">
          </ul>
          <input type = 'hidden' name="files" id = "files"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('documentList');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('documentList');return false;">{#reset#}</a>
        </div>
      </div>

      <div class="row">
        <label style="">{#attachCustomerPO#}</label>
        <div style="float:left">
          <ul id="customerPOList">
          </ul>
          <input type = 'hidden' name="customerPO" id = "customerPO"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('customerPOList');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('customerPOList');return false;">{#reset#}</a>
        </div>
      </div>

      <div class="row">
        <label for="distribution" >{#qualityIssueNote#}</label>
        <select name = "qualityIssueNote[]" multiple="multiple" style = "height:100px;" id="qualityIssueNote"  exclude = "-1" realname = "{#qualityIssueNote#}">
        </select>
      </div>

      <div class="row">
        <label for="ECNNote" >{#ECNNote#}</label>
        <select name = "ECNNote[]" multiple="multiple" style = "height:100px;" id="ECNNote"  exclude = "-1" realname = "{#ECNNote#}">
        </select>
      </div>



      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#add#}</button>
        <button onfocus="this.blur();" onclick="blindtoggle('form_adddocument');return false;" type="reset">{#cancel#}</button>
      </div>
      <input type="hidden" id="fileId" name="fileId"></input>
    </fieldset>
  </form>
</div>
<script type = "text/javascript" src = "include/js/addOrder.js" ></script>
