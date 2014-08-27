<div class="block_in_wrapper">
  <h2>{#addECN#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="manageecn.php?action=addEcn" method="post" class="main">
    <fieldset>

      <div class="row">
        <label for="project">{#project#}:</label>
        <select name="project" id="project" onchange="onSelProjectChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=project loop=$projects}
            <option value="{$projects[project].ID}">{$projects[project].name}</option>
          {/section}
        </select>
      </div>

      <div class="row">
        <label for="order">{#order#}:</label>
        <select name="selOrder" id="selOrder" onchange="onSelORderChange(this)"; required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          
        </select>
      </div>

      <div class="row">
        <label for="order">{#quality#}:</label>
        <select name="selQuality" id="selQuality">
          <option value="-1" selected="selected">{#chooseone#}</option>
          
        </select>
      </div>


      <div class="row">
        <label  >{#ecrnumber#}</label>
        <input id="newEcnName" name="newEcnName"></input>
      </div>
      <div class="row">
        <label >{#description#}</label>
        <textarea  id="newEcnDescription" name="newEcnDescription"></textarea>
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
<script type = "text/javascript" src = "include/js/ecn.js" ></script>
