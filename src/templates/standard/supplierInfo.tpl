{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" suppliertab = "active"}
<script type="text/javascript" src="include/js/order.js"></script>

<link rel="stylesheet" href="templates/standard/css/jquery-ui.min.css">
<script type="text/javascript" src="include/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="templates/standard/css/jquery.tag-editor.css">
<script type="text/javascript" src="include/js/jquery.caret.min.js"></script>
<script type="text/javascript" src="include/js/jquery.tag-editor.min.js"></script>
{literal}
<style>
    .supplier-files{
        padding-right:44px;
    }
    .supplier-files li{
        padding: 10px 0;
        border-bottom: 1px solid darkcyan;form.main select
        color: #444;
    }
    .file-desc {
        line-height: 1.3em;
        font-size: 16px;
    }

    .tag-editor {
        width:300px;
        margin-bottom: 5px;
        border: 1px solid #8caaac;
    }
    .tag-editor .tag-editor-delete i {
        line-height:20px;
    }
</style>
{/literal}

<div id="content-left">
    <div id="content-left-in">
        <div class="infowin_left" style="display:none;" id="systemmsg"></div>
        {*base info*}
        <div class="projects">
            <div id="project-base-form" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
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
                            <input type="hidden" name="id" value="{$supplier.ID}">
                            <div class="row">
                                <label for="name">{#supplier_name#}</label>
                                <input name="name" value="{$supplier.name}">
                            </div>

                            <div class="row">
                                <label for="name">Supplier Num</label>
                                <label for="">Supplier-{$supplier.ID}</label>

                            </div>

                            <div class="row" style="display: none;">
                                <label for="username">{#jenkins_username#}</label>
                                <input name="username" id="username" value="{$supplier.username}">
                                <input id="supplierLeaderId" name="supplierLeaderId" value="{$supplier.user}"
                                       type="hidden"/>
                            </div>

                            <div class="row">
                                <label for="tag">Jenkins Users</label>
                                <input name="users" id="supplier_users" data-users="{$supplier.users}">
                            </div>

                            <div class="row">
                                <label for="tag">tag</label>
                                <input name="tags" id="supplier_tag" data-tag="{$supplier.tag_str}">
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
                                <textarea name="audit_history">{$supplier.audit_history | escape:'htmlall'}</textarea>
                            </div>

                        </fieldset>
                        <div class="phaseMenualBar">
                            <a class="butn_link" id="btnSaveSupplier" onclick="saveSupplierBaseInfo();"
                               href="javascript:void(0)">Save</a>
                        </div>
                    </form>
                </div>
                {* end of base info*}
            </div>
            {*related projects*}
            <div id="related-projects" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                <div class="headline">
                    <a href="javascript:void(0);" id="related_projects_toggle" class="win_block"
                       onclick="toggleBlock('related_projects');"></a>
                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>Related Projects
                    </h2>
                </div>
                <div class="block" id="related_projects">
                    <div class="projectTableWrapper">
                        <table id="supplierTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
                            <thead>
                            <tr>
                                <th class="b tx">Project Name</th>
                                <th class="b tx">Status</th>
                            </tr>
                            </thead>
                            <tbody id="documentTBody">
                            {section name=project loop=$projects}
                                {if $smarty.section.index % 2 == 0}
                                    <tr class="color-a">
                                        {else}
                                    <tr class="color-b">
                                {/if}
                                <td>
                                    <a target="blank" href="/manageproject.php?action=showproject&id={$projects[project].ID}">{$projects[project].name}</a>
                                </td>
                                <td>{dispstatus statusId=$projects[project].status}</td>
                                </tr>
                            {/section}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            {*SCA*}
            <div id="related-sca" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                <div class="headline">
                    <a href="javascript:void(0);" id="related_sca_toggle" class="win_block"
                       onclick="toggleBlock('related_sca');"></a>
                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>Related SCA
                    </h2>
                </div>
                <div class="block" id="related_sca">
                    <div class="projectTableWrapper">
                        <table id="supplierTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
                            <thead>
                            <tr>
                                <th class="b tx">Action No.</th>
                                <th class="b tx">Product No.</th>
                            </tr>
                            </thead>
                            <tbody id="documentTBody">
                            {section name=sca loop=$SCAs}
                                {if $smarty.section.index % 2 == 0}
                                    <tr class="color-a">
                                        {else}
                                    <tr class="color-b">
                                {/if}
                                <td>
                                    <a target="blank" href="/managequality.php?action=showEditDlg&id={$SCAs[sca].ID}">{$SCAs[sca].action_no}</a>
                                </td>
                                <td>{$SCAs[sca].product_no}</td>
                                </tr>
                            {/section}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {*Orders*}
            <div id="related-sca" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                <div class="headline">
                    <a href="javascript:void(0);" id="related_orders_toggle" class="win_block"
                       onclick="toggleBlock('related_orders');"></a>
                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>Related Order
                    </h2>
                </div>
                <div class="block" id="related_orders">
                    <div class="projectTableWrapper">
                        <table id="supplierTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
                            <thead>
                            <tr>
                                <th class="b tx">Name</th>
                                <th class="b tx">Customer Po Number</th>
                            </tr>
                            </thead>
                            <tbody id="documentTBody">
                            {section name=order loop=$orders}
                                {if $smarty.section.index % 2 == 0}
                                    <tr class="color-a">
                                        {else}
                                    <tr class="color-b">
                                {/if}
                                <td>
                                    <a target="blank" href="/manageorder.php?action=showOrderSubInfo&oId={$orders[order].ID}">{$orders[order].name}</a>
                                </td>
                                <td>{$orders[order].customer_po_number}</td>
                                </tr>
                            {/section}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {*Audit Document*}
            <div id="related-sca" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                <div class="headline">
                    <a href="javascript:void(0);" id="related_audit_document_toggle" class="win_block"
                       onclick="toggleBlock('related_audit_document');"></a>
                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>Audit Document
                    </h2>
                </div>
                <div class="block block_in_wrapper" id="related_audit_document">
                    <div class="projectTableWrapper">
                        <form enctype="multipart/form-data" id="auditDocumentForm" name="auditDocumentForm" class="main" method="post" action="/managesupplier.php">
                            <fieldset>
                                <h2>Attach New Document</h2>
                                <input type="hidden" name="id" value="{$supplier.ID}">
                                <input type="hidden" name="action" value="uploadDocument">
                                <div class="row">
                                    <label for="filetype">File Type</label>
                                    
                                    <select name="filetype" id="">
                                        <option value="Contract">Contract</option>
                                        <option value="NDA">NDA</option>
                                        <option value="Supplier Audit Form">Supplier Fudit Form</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </div>
                                <div class="row">
                                    <label for="description">{#description#}</label>
                                    <input  required="required" name="description" style="height: 24px;">
                                </div>
                                <div class="row">
                                    <label for="userfile">{#file#}</label>
                                    <input required="required" type="file" name="userfile" style="height: 24px;background: white;">
                                </div>
                            </fieldset>
                            <div class="phaseMenualBar">
                                <a class="butn_link" id="btnSaveSupplier" onclick="uploadAuditDocument();"
                                   href="javascript:void(0)">Upload</a>
                            </div>
                        </form>

                        <ul class="supplier-files">
                            {foreach from=$files key=k item=fileEntry name=file}
                                <li>
                                    <div><strong>{$fileEntry.file_type | default:"No Description"}</strong> | <a href="/files/standard{$fileEntry.file_path}">Download</a></div>
                                    <div class="file-desc">{$fileEntry.description}</div>
                                </li>
                            {/foreach}

                        </ul>
                    </div>
                </div>
            </div>
        </div> {*Projects END*}
    </div> {*content-left-in END*}
</div> {*content-left END*}
<input type="hidden" id="all-tag-str" data-tags="{$allTagStr}">
<input type="hidden" id="all-suppliers-str" data-suppliers="{$allSupplierStr}">

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
<div id="autoCompChoice" class="autoComp"></div>
{literal}
    <script type="text/javascript">
        function setSupplierLeaderId(text, li) {
            $("supplierLeaderId").value = li.id;
        }
        new Ajax.Autocompleter('username', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {
            paramName: 'query',
            minChars: 2,
            afterUpdateElement: setSupplierLeaderId
        });

        function uploadAuditDocument(){
            var $ = jQuery;
            if(_.isEmpty($('[name=description]').val())){
                return alert('Please input Description field');
            }
            if(_.isEmpty($('[name=userfile]').val())){
                return alert('Please input File field');
            }
            $('#auditDocumentForm').submit();
        }




        function saveSupplierBaseInfo() {
            var $ = jQuery;
            var el = $(this);
            tinyMCE.triggerSave();
            var theUrl = "managesupplier.php?action=saveSupplier";
            var thePost = $('#supplier-base-info-form').serialize();
            new Ajax.Request(theUrl, {
                method: 'post',
                postBody: thePost,
                onSuccess: function (payload) {
                    if (payload.responseText == "Ok") {
                        J.showSystemMsg(unescape(MSGS['data_saved']));
                    }
                }
            });
        }

        jQuery(function(){

            var $ = jQuery;
            var el = $('#supplier_tag');
            $data = el.data('tag');
            var arrData = $data.split(',');
            var allTagStr = $('#all-tag-str').data('tags').split(',');
            var tagCfg = {
                autocomplete: {
                    delay: 0, // show suggestions immediately
                    position: {collision: 'flip'}, // automatic menu position up/down
                    source: allTagStr
                },
                forceLowercase: false,
                initialTags: arrData
            };
            $('#supplier_tag').tagEditor(tagCfg);

            // for users
            var supplierEl = $('#supplier_users');
            var allSupplierStr = $("#all-suppliers-str").data('suppliers');
            var allSupplierData = allSupplierStr.split(',');
            var arrSupplierData = supplierEl.data('users').split(',');
            var usersTagCfg = {
                autocomplete: {
                    delay: 0, // show suggestions immediately
                    position: {collision: 'flip'}, // automatic menu position up/down
                    source: allSupplierData
                },
                forceLowercase: false,
                initialTags: arrSupplierData
            };
            supplierEl.tagEditor(usersTagCfg);
        });
    </script>
{/literal}
