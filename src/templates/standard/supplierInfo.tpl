{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" suppliertab = "active"}
<script type="text/javascript" src="include/js/order.js"></script>


<div id="content-left">
    <div id="content-left-in">
        <div class="projects">

            {*Edit Task*}
            {if $userpermissions.projects.edit}
                <div id="form_edit" class="addmenue" style="display:none;clear:both;">
                    <div class="content-spacer"></div>
                    {include file="editform.tpl" showhtml="no" }
                </div>
            {/if}
            <div id="project-base-form" class="addmenue" style="clear:both;">
                <div class="content-spacer"></div>
                {* end of base info*}
                <div class="headline">
                    <a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block"
                       onclick="toggleBlock('projectbaseinfo');"></a>

                    <div class="wintools">
                        <div class="progress" id="progress" style="display:none;">
                            <img src="templates/standard/images/symbols/loader-cal.gif"/>
                        </div>
                    </div>
                    <h2>
                        <img src="./templates/standard/images/symbols/projects.png" alt=""/>{#supplier#}
                    </h2>
                </div>
                {* end of base info*}
            </div>


        </div> {*Projects END*}

    </div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
