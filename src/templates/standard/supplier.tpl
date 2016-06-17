{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" suppliertab = "active"}

<script type="text/javascript" src="include/js/order.js"></script>
<script type="text/javascript" src="include/js/jquery.tag-editor.min.js"></script>


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
      {* base info*}
      <div id="project-base-form" class="addmenue" style="clear:both;">
        <div class="content-spacer"></div>
        {include file="_suplierGrid.tpl" showhtml="no" }
      </div>


    </div> {*Projects END*}

  </div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
