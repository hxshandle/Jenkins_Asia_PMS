{config_load file=lng.conf section = "strings" scope="global" }  
<table id = "desktopprojects" cellpadding="0" cellspacing="0" border="0">
            <thead>
              <tr>
                <th class="a"></th>
                <th class="b" style="cursor:pointer;width:300px" onclick = "sortBlock('desktopprojects','');">{#project#}</th>
                <th class="b" style="cursor:pointer;width:100px" onclick = "sortBlock('desktopprojects','');">{#projectNo#}</th>
                <th class="c" style="cursor:pointer" onclick = "sortBlock('desktopprojects','done');">{#done#}</th>
                <th class="d" style="text-align:right;width:70px" onclick = "sortBlock('desktopprojects','daysleft');">{#daysleft#}&nbsp;&nbsp;</th>
                <th class="tools"></th>
              </tr>
            </thead>

            <tfoot>
              <tr>
                <td colspan="6"></td>
              </tr>
            </tfoot>

            {section name=project loop=$myprojects}
              {*Color-Mix*}
              {if $smarty.section.project.index % 2 == 0}
              <tbody class="color-a" id="proj_{$myprojects[project].ID}" rel = "{$myprojects[project].ID},{$myprojects[project].name},{$myprojects[project].daysleft},0,0,{$myprojects[project].done}">
              {else}
              <tbody class="color-b" id="proj_{$myprojects[project].ID}" rel = "{$myprojects[project].ID},{$myprojects[project].name},{$myprojects[project].daysleft},0,0,{$myprojects[project].done}">
              {/if}
                <tr {if $myprojects[project].daysleft < 0 && $myprojects[project].daysleft != ""} class="marker-late"{elseif $myprojects[project].daysleft == "0"} class="marker-today"{/if}>
                  <td>
                    {if $smarty.session.userRole < 5}
                      <a class="butn_check" href="javascript:closeElement('proj_{$myprojects[project].ID}','manageproject.php?action=close&amp;id={$myprojects[project].ID}');" title="{#close#}"></a>
                    {/if}
                  </td>
                  <td>
                    <div class="toggle-in">
                      <span id = "desktopprojectstoggle{$myprojects[project].ID}" class="acc-toggle" onclick="javascript:accord_projects.activate($$('#projecthead .accordion_toggle')[{$smarty.section.project.index}]);toggleAccordeon('projecthead',this);"></span>
                      <a href="manageproject.php?action=showproject&amp;id={$myprojects[project].ID}" title="{$myprojects[project].name}">
                        {$myprojects[project].name}
                      </a>
                    </div>
                  </td>
                  <td>
                    {$myprojects[project].project_no|truncate:35:"...":true}
                  </td>
                  <td>
                    <div class="statusbar_b">
                      <div class="complete" id = "completed" style="width:{$myprojects[project].done}%;"></div>
                    </div>
                    <span>{$myprojects[project].done}%</span>
                  </td>
                  <td style="text-align:right">{$myprojects[project].daysleft}&nbsp;&nbsp;</td>
                  <td class="tools">
                    {if $smarty.session.userRole < 5}
                      <a class="tool_edit" href="manageproject.php?action=editform&amp;id={$myprojects[project].ID}" title="{#edit#}" ></a>{/if}
                    {if $smarty.session.userRole < 5}
                      <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'proj_{$myprojects[project].ID}\',\'manageproject.php?action=del&amp;id={$myprojects[project].ID}\')');"  title="{#delete#}"></a>
                    {/if}
                  </td>
                </tr>

                <tr class="acc">
                  <td colspan="5">
                    <div class="accordion_toggle"></div>
                    <div class="accordion_content">
                      <div class="acc-in">
                        <div class="message-in">
                          {$myprojects[project].desc}
                        </div>
                      </div>
                    </div>
                  </td>
                </tr>
              </tbody>
            {/section}
          </table>