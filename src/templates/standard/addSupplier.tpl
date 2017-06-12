<script type="text/javascript" src="include/js/addSupplier.js"></script>
<link rel="stylesheet" href="templates/standard/css/jquery-ui.min.css">
<script type="text/javascript" src="include/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="templates/standard/css/jquery.tag-editor.css">
<script type="text/javascript" src="include/js/jquery.caret.min.js"></script>
<script type="text/javascript" src="include/js/jquery.tag-editor.min.js"></script>

{literal}
    <style>
        .tag-editor {
            width:307px;
            margin-bottom: 5px;
            border: 1px solid #8caaac;
        }
        .tag-editor .tag-editor-delete i {
            line-height:20px;
        }
    </style>
{/literal}

<div class="block_in_wrapper">
    <h2>{#addSupplier#}</h2>
    <form onsubmit="return validateCompleteForm(this);" action="managesupplier.php?action=addSupplier" method="post"
          class="main">
        <fieldset>

            <div class="row">
                <label for="name">{#name#}:</label>
                <input type="text" class="text" name="name" id="name" required="1" placeholder="Supplier Name"/>
            </div>
            <div class="row" style="display:none">
                <label for="supplierLeader">{#supplierLeader#}</label>
                <input type="text" class="text" name="supplierLeader" id="supplierLeader" realname="{#supplierLeader#}" value = "{$project.supplier_leader_name}" /><input id="supplierLeaderId" name = "supplierLeaderId" value = "{$project.supplier_leader}" type="hidden" />

            </div>

            <div class="row">
                <label for="tag">Jenkins Users</label>
                <input name="users" id="supplier_users">
            </div>

            <div class="row">
                <label for="tag">tag</label>
                <input name="tags" id="supplier_tag">
            </div>

            <div class="row" styule>
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
<input type="hidden" id="all-tag-str" data-tags="{$allTagStr}">
<input type="hidden" id="all-suppliers-str" data-suppliers="{$allSupplierStr}">
{literal}
<script type="text/javascript">
    function setSupplierLeaderId(text,li){
      $("supplierLeaderId").value=li.id;
    }
    // new Ajax.Autocompleter('supplierLeader', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setSupplierLeaderId});
    jQuery(function(){

        var $ = jQuery;
        var el = $('#supplier_tag');
        var allTagStr = $('#all-tag-str').data('tags').split(',');
        var tagCfg = {
            autocomplete: {
                delay: 0, // show suggestions immediately
                position: {collision: 'flip'}, // automatic menu position up/down
                source: allTagStr
            },
            forceLowercase: false,
            initialTags: []
        };
        $('#supplier_tag').tagEditor(tagCfg);

        // for users
        var supplierEl = $('#supplier_users');
        var allSupplierStr = $("#all-suppliers-str").data('suppliers');
        var allSupplierData = allSupplierStr.split(',');
        var usersTagCfg = {
            autocomplete: {
                delay: 0, // show suggestions immediately
                matchCase: true,
                position: {collision: 'flip'}, // automatic menu position up/down
                source: allSupplierData
            },
            forceLowercase: false,
            initialTags: []
        };
        supplierEl.tagEditor(usersTagCfg);
    });

</script>
{/literal}
