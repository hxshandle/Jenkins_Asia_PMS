{include file="header.tpl"  jsload = "ajax"  jsload1="tinymce" jsload3 = "lightbox"}
{include file="tabsmenue-project.tpl" qualitystab = "active"}

<div id="content-left">
  <div id="content-left-in">
    <div class="msgs">

      <div class = "infowin_left">
        <span id = "deleted" style = "display:none;" class="info_in_red"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasdeleted#}</span>
      </div>

      <div class="infowin_left" style = "display:none;" id = "systemmsg">
        {if $mode == "added"}
          <span class="info_in_green"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasadded#}</span>
        {elseif $mode == "edited"}
          <span class="info_in_yellow"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#messagewasedited#}</span>
        {elseif $mode == "replied"}
          <span class="info_in_green"><img src="templates/standard/images/symbols/msgs.png" alt=""/>{#replywasadded#}</span>
        {/if}
      </div>
      
      {literal}
        <script type = "text/javascript">
          systemMsg('systemmsg');
        </script>
      {/literal}


      <h1>{$projectname|truncate:45:"...":true}<span>/ {#quality#}</span></h1>

      <div class="headline">
        <a href="javascript:void(0);" id="block_msgs_toggle" class="win_block" onclick = "toggleBlock('block_msgs');"></a>

        <div class="wintools">


          {if $userpermissions.messages.add}
            <a class="add" href="javascript:blindtoggle('addmsg{$myprojects[project].ID}');" id="add" onclick="toggleClass(this,'add-active','add');toggleClass('add_butn','butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');"><span>{#addmessage#}</span></a>
          {/if}
        </div>

        <h2>
          <img src="./templates/standard/images/symbols/msgs.png" alt="" />{#quality#}
        </h2>
      </div>

      <div id="block_msgs" class="block" >

        {*Add Message*}
        <div id = "addmsg" class="addmenue" style = "display:none;">
          {include file="addmessageform.tpl" }
        </div>

        <div class="nosmooth" id="sm_msgs">

          <table id="acc_msgs" cellpadding="0" cellspacing="0" border="0">
            <thead>
              <tr>
                <th class="a"></th>
                <th class="b">{#message#}</th>
                <th class="ce" style="text-align:right">{#replies#}&nbsp;&nbsp;</th>
                <th class="de">{#by#}</th>
                <th class="e">{#on#}</th>
                <th class="tools"></th>
              </tr>
            </thead>

            <tfoot>
              <tr>
                <td colspan="6"></td>
              </tr>
            </tfoot>

            {section name=message loop=$messages}

            {*Color-Mix*}
            {if $smarty.section.message.index % 2 == 0}
            <tbody class="color-a" id="msgs_{$messages[message].ID}">
            {else}
            <tbody class="color-b" id="msgs_{$messages[message].ID}">
            {/if}
              <tr>
                <td>
                  {if $userpermissions.messages.close}<a class="butn_reply" href="managemessage.php?action=replyform&amp;mid={$messages[message].ID}&amp;id={$project.ID}" title="{#answer#}"></a>{/if}
                </td>
                <td>
                  <div class="toggle-in">
                  <span class="acc-toggle" onclick="javascript:accord_messages.activate($$('#block_msgs .accordion_toggle')[{$smarty.section.message.index}]);toggleAccordeon('accord_messages',this);"></span>
                    <a href="managemessage.php?action=showmessage&amp;mid={$messages[message].ID}&amp;id={$project.ID}" title="{$messages[message].title}">{$messages[message].title|truncate:35:"...":true}</a>
                  </div>
                </td>
                <td style="text-align:right">
                  {if $messages[message].replies > 0}
                    <a href = "managemessage.php?action=showmessage&amp;mid={$messages[message].ID}&amp;id={$project.ID}#replies">{$messages[message].replies}</a>
                  {else}
                    {$messages[message].replies}
                  {/if}
                  &nbsp;
                </td>
                <td><a href="manageuser.php?action=profile&amp;id={$messages[message].user}">{$messages[message].username|truncate:20:"...":true}</a></td>
                <td>{$messages[message].postdate}</td>
                <td class="tools">
                  {if $userpermissions.messages.edit}
                    <a class="tool_edit" href="managemessage.php?action=editform&amp;mid={$messages[message].ID}&amp;id={$project.ID}" title="{#edit#}"></a>
                  {/if}
                  {if $userpermissions.messages.del}
                    <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'msgs_{$messages[message].ID}\',\'managemessage.php?action=del&amp;mid={$messages[message].ID}&amp;id={$project.ID}\')');"  title="{#delete#}"></a>
                  {/if}
                </td>
              </tr>

              <tr class="acc">
                <td colspan="6">
                  <div class="accordion_toggle"></div>
                  <div class="accordion_content">
                    <div class="acc-in">
                      {if $messages[message].avatar != ""}
                        <div class="avatar"><img src = "thumb.php?width=80&amp;height=80&amp;pic=files/{$cl_config}/avatar/{$messages[message].avatar}" alt="" /></div>
                      {else}
                        {if $messages[message].gender == "f"}
                          <div class="avatar"><img src = "thumb.php?pic=templates/standard/images/no-avatar-female.jpg&amp;width=80;" alt="" /></div>
                        {else}
                          <div class="avatar"><img src = "thumb.php?pic=templates/standard/images/no-avatar-male.jpg&amp;width=80;" alt="" /></div>
                        {/if}
                      {/if}
                      <div class="message">
                        <div class="message-in">
                          {$messages[message].text}
                        </div>


                      
                      </div> {*div messages end*}
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
            {/section}

            </table>
          </div> {*smooth End*}

          <div class="tablemenue">
            <div class="tablemenue-in">
              {if $userpermissions.messages.add}
              <a class="butn_link" href="javascript:blindtoggle('addmsg');"  id="add_butn" onclick="toggleClass('add','add-active','add');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_msgs','smooth','nosmooth');">{#addmessage#}</a>
              {/if}
            </div>
          </div>
        </div> {*block END*}
      <div class="content-spacer"></div>

    </div> {*Msgs END*}
  </div> {*content-left-in END*}
</div> {*content-left END*}

{literal}
  <script type = "text/javascript">
    var accord_messages = new accordion('block_msgs');
  </script>
{/literal}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}