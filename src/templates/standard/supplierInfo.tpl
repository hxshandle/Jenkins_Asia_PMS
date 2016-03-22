{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" suppliertab = "active"}
<script type="text/javascript" src="include/js/order.js"></script>


<div id="content-left">
    <div id="content-left-in">
        <div class="projects">
        <div class="infowin_left" style = "display:none;" id = "systemmsg"></div>
            {*Edit Task*}
            <div id="project-base-form" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                {* base info*}
                <div class="headline">
                    <a href="javascript:void(0);" id="supplierbaseinfo_toggle" class="win_block"
                       onclick="toggleBlock('supplierbaseinfo');"></a>

                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>{#supplier#}
                    </h2>
                </div>
                <div class="block_in_wrapper" id="supplierbaseinfo">
                    <h2>Base Info</h2>
                    <form id="supplier-base-info-form" class="main">
                        <fieldset>
                            <input type="hidden" name="id" value = "{$supplier.ID}"></input>
                            <div class="row">
                                <label for="name">{#supplier_name#}</label>
                                <input name="name" value="{$supplier.name}">
                            </div>

                            <div class="row">
                                <label for="username">{#jenkins_username#}</label>
                                <input name="username" id="username" value="{$supplier.username}">
                                <input id="supplierLeaderId" name = "supplierLeaderId" value = "{$supplier.user}" type="hidden" />
                            </div>

                            <div class="row">
                                <label for="phone_number">{#phone_number#}</label>
                                <input name="phone_number" value="{$supplier.phone_number}">
                            </div>

                            <div class="row">
                                <label for="address">{#address#}</label>
                                <input name="address" value="{$supplier.address}">
                            </div>

                            <div class="row">
                                <label for="audit_history">{#audit_history#}</label>
                                <textarea name="audit_history" >{$supplier.audit_history | escape:'htmlall'}</textarea>
                            </div>
                            
                        </fieldset>
                        <div class="phaseMenualBar">
                            <a class="butn_link" id="btnSaveSupplier" onclick="saveSupplierBaseInfo();" href="javascript:void(0)">Save</a>
                        </div>
                    </form>
                </div>
                {* end of base info*}



            </div>


        </div> {*Projects END*}

    </div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
<div id="autoCompChoice" class="autoComp"></div>
{literal}
<script type="text/javascript">
    function setSupplierLeaderId(text,li){
      $("supplierLeaderId").value=li.id;
    }
    new Ajax.Autocompleter('username', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setSupplierLeaderId});


    function saveSupplierBaseInfo(){
        var $ = jQuery;
        var el = $(this);
        tinyMCE.triggerSave();
        var theUrl = "managesupplier.php?action=saveSupplier";
        var thePost = $('#supplier-base-info-form').serialize();
        new Ajax.Request(theUrl, {
                method: 'post',
                postBody:thePost,
                onSuccess:function(payload) {
                  if (payload.responseText == "Ok"){
                    J.showSystemMsg(unescape(MSGS['data_saved']));
                  }
                }
        });
    }
</script>
{/literal}
