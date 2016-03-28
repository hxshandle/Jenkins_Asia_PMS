<script type="text/javascript" src="include/js/addSupplier.js"></script>
<div class="block_in_wrapper">
    <h2>{#addSupplier#}</h2>
    <form onsubmit="return validateCompleteForm(this);" action="managesupplier.php?action=addSupplier" method="post"
          class="main">
        <fieldset>

            <div class="row">
                <label for="name">{#name#}:</label>
                <input type="text" class="text" name="name" id="name" required="1" placeholder="Supplier Name"/>
            </div>
            <div class="row">
                <label for="supplierLeader">{#supplierLeader#}</label>
                <input type="text" class="text" name="supplierLeader" id="supplierLeader" realname="{#supplierLeader#}" value = "{$project.supplier_leader_name}" /><input id="supplierLeaderId" name = "supplierLeaderId" value = "{$project.supplier_leader}" type="hidden" />

              </div>  

            <div class="row">
                <label for="address">{#address#}:</label>
                <input type="text" class="text" name="address" id="address" required="1" placeholder="Supplier Address" ></input>
            </div>


            <div class="row">
                <label for="phone_number">{#phone_number#}:</label>
                <input type="text" class="text" name="phone_number" id="phone_number" required="1" placeholder="Supplier Phone Number"/>
            </div>

            <div class="row">
                <label for="audit_history">{#audit_history#}:</label>
                <div class="editor"><textarea id="audit_history" name="audit_history" rows="3" cols="1"></textarea></div>
            </div>

            <div class="row-butn-bottom">
                <label></label>
                <button onfocus="this.blur();" type="submit">{#add#}</button>
                <button onfocus="this.blur();" onclick="blindtoggle('form_addSupplier');return false;"
                        type="reset">{#cancel#}</button>
            </div>
            <input type="hidden" id="fileId" name="fileId"></input>
        </fieldset>
    </form>
</div>
<div id="autoCompChoice" class="autoComp"></div>
{literal}
<script type="text/javascript">
    function setSupplierLeaderId(text,li){
      $("supplierLeaderId").value=li.id;
    }
    new Ajax.Autocompleter('supplierLeader', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setSupplierLeaderId});
</script>
{/literal}
