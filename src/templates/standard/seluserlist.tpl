<ul class="chk-list" id="chk-list-{$chkName}" style="{$ulstyle}">
  <!-- admin -->
  <li>
    <ul class="grouped-user-list">
    {section name=admin loop=$groupedUser.admin}
      <li><label>{$groupedUser.admin[admin].name}<input type="checkbox" name="{$chkName}[]" value="{$groupedUser.admin[admin].user_id}" {if $checkedUsers}{if in_array($groupedUser.admin[admin].user_id, $checkedUsers)}checked{/if}{/if}/></label></li>
    {/section}
    </ul>
  </li>
  <!-- manager -->
  <li>
    <ul class="grouped-user-list">
    {section name=mgr loop=$groupedUser.manager}
      <li><label>{$groupedUser.manager[mgr].name}<input type="checkbox" name="{$chkName}[]" value="{$groupedUser.manager[mgr].user_id}" {if $checkedUsers}{if in_array($groupedUser.manager[mgr].user_id, $checkedUsers)}checked{/if}{/if}/></label></li>
    {/section}
    </ul>
  </li>
  <!-- staff -->
  <li>
    <ul class="grouped-user-list">
    {section name=staff loop=$groupedUser.staff}
      <li><label>{$groupedUser.staff[staff].name}<input type="checkbox" name="{$chkName}[]" value="{$groupedUser.staff[staff].user_id}" {if $checkedUsers}{if in_array($groupedUser.staff[staff].user_id, $checkedUsers)}checked{/if}{/if}/></label></li>
    {/section}
    </ul>
  </li>
  <!-- customer -->
  <li>
    <ul class="grouped-user-list">
    {section name=customer loop=$groupedUser.customer}
      <li><label>{$groupedUser.customer[customer].name}<input type="checkbox" name="{$chkName}[]" value="{$groupedUser.customer[customer].user_id}" {if $checkedUsers}{if in_array($groupedUser.customer[customer].user_id, $checkedUsers)}checked{/if}{/if}/></label></li>
    {/section}
    </ul>
  </li>
  <!-- supplier -->
  <li>
    <ul class="grouped-user-list">
    {section name=supplier loop=$groupedUser.supplier}
      <li><label>{$groupedUser.supplier[supplier].name}<input type="checkbox" name="{$chkName}[]" value="{$groupedUser.supplier[supplier].user_id}" {if $checkedUsers}{if in_array($groupedUser.supplier[supplier].user_id, $checkedUsers)}checked{/if}{/if}/></label></li>
    {/section}
    </ul>
  </li>
  
</ul>