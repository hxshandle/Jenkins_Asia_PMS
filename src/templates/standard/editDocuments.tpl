{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div class="projects block_in_wrapper" >
  <h2>{#editDocument#}</h2>
  <form onsubmit="" action="managedocument.php?action=updateDocument" method="post" class="main">
    <fieldset>
      <input type="hidden" id="documentId" name="documentId" value="{$docInfo.ID}"/>
      <div class="row">
        <label for="projectName">{#project#}:</label>
        <input name="projectName" id="projectName" value="{$project.name}" disabled="true"></input>
        <input type="hidden" id="project" name="project" value="{$docInfo.project}"/>
      </div>

      <div class="row">
        <label for="name">{#name#}:</label>
        <input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" value="{$docInfo.name}" />
      </div>

      <div class="row">
        <label for="name">{#documentNo#}:</label>
        <input type="text" class="text" name="documentNo" id="documentNo" required="1" realname="{#documentNo#}" value="{$docInfo.document_no}"  ></input>
      </div>


      <div class="row">
        <label for="revision">{#revision#}:</label>
        <input type="text" class="text" name="revision" id="revision" required="1" realname="{#revision#}" value="{$docInfo.revision}" />
      </div>

      <div class="row">
        <label for="description">{#description#}:</label>
        <div class="editor"><textarea id="description" name="description" rows="3" cols="1" >{$docInfo.description}</textarea></div>
      </div>
      <div class="row">
        <label for="visibility" >{#visibility#}:</label>

        <ul class="chk-list">
          <li><label>{#superAdmin#}<input type="checkbox" name="visibility[]" value="1" {if in_array("1",$visibilityList)}checked{/if}></label></li>
          <li><label>{#admin#}<input type="checkbox" name="visibility[]" value="2" {if in_array("2",$visibilityList)}checked{/if}></label></li>
          <li><label>{#manageLv1#}<input type="checkbox" name="visibility[]" value="3" {if in_array("3",$visibilityList)}checked{/if}></label></li>
          <li><label>{#manageLv2#}<input type="checkbox" name="visibility[]" value="4" {if in_array("4",$visibilityList)}checked{/if}></label></li>
          <li><label>{#staff#}<input type="checkbox" name="visibility[]" value="5" {if in_array("5",$visibilityList)}checked{/if}></label></li>
          <li><label>{#customerLv1#}<input type="checkbox" name="visibility[]" value="6" {if in_array("6",$visibilityList)}checked{/if}></label></li>
          <li><label>{#customerLv2#}<input type="checkbox" name="visibility[]" value="7" {if in_array("7",$visibilityList)}checked{/if}></label></li>
          <li><label>{#supplierLv1#}<input type="checkbox" name="visibility[]" value="8" {if in_array("8",$visibilityList)}checked{/if}></label></li>
          <li><label>{#supplierLv2#}<input type="checkbox" name="visibility[]" value="9" {if in_array("9",$visibilityList)}checked{/if}></label></li>
        </ul>
      </div>

      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#save#}</button>
        <button onfocus="this.blur();" onclick="window.close();">{#cancel#}</button>
      </div>
      <input type="hidden" id="fileId" name="fileId"></input>
    </fieldset>
  </form>

  </div>
</body>