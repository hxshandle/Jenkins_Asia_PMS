{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div id="content-left" style="background:none">
    <div id="content-left-in">

      <div class="projects">
        <div class="headline">
          <a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick="toggleBlock('costInfo');"></a>
          <div class="wintools">
            <div class="progress" id="progress" style="display:none;">
              <img src="templates/standard/images/symbols/loader-cal.gif">
            </div>
          </div>
          <h2>
            <img src="./templates/standard/images/symbols/projects.png" alt="">{#cost#}
          </h2>
        </div>
        <div id="costInfo" class="projects block_in_wrapper" >
      
          <form onsubmit="return validateCompleteForm(this);" action="managecost.php?action=update" method="post" class="main" style="padding-bottom:20px;">
            <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
            <input type="hidden" name="costId" id="costId" value="{$cost.ID}"></input>
            <input type = "hidden" id = "project" name ="project" value="{$cost.project}"></input>
            
            <div class="row">
              <label style="width:240px;" >{#projectno#}</label>
              <input id = "project_no" name ="project_no" value="{$cost.project_no}"  ></input>
            </div>
            <div class="row">
              <label style="width:240px;" >{#description#}</label>
              <textarea style="width:200px" id = "description" name ="description">{$cost.description}</textarea>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customermodelnumber#}</label>
              <input id = "customer_model_number" name ="customer_model_number" value="{$cost.customer_model_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsmodelnumber#}</label>
              <input type = "hidden" id = "jenkins_model_number" name ="jenkins_model_number" value="{$cost.jenkins_model_number}"></input>
              <input id="lbl_jenkins_model_number" style="width:191px" value="{$cost.jenkins_model_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_model_number','lbl_jenkins_model_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerassemblynumber#}</label>
              <input id = "customer_assembly_number" name ="customer_assembly_number" value="{$cost.customer_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerparentassemblynumber#}</label>
              <input id = "customer_parent_assembly_number" name ="customer_parent_assembly_number" value="{$cost.customer_parent_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsassemblynumber#}</label>
              <input id = "jenkins_assembly_number" name ="jenkins_assembly_number" value="{$cost.jenkins_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsparentassemblynumber#}</label>
              <input id = "jenkins_parent_assembly_number" name ="jenkins_parent_assembly_number" value="{$cost.jenkins_parent_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerpartnumber#}</label>
              <input id = "customer_part_number" name ="customer_part_number" value="{$cost.customer_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinspartnumber#}</label>
              <input id = "jenkins_part_number" name ="jenkins_part_number" value="{$cost.jenkins_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerdrawingnumber#}</label>
              <input id = "customer_drawing_number" name ="customer_drawing_number" value="{$cost.customer_drawing_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision1#}</label>
              <input id = "revision1" name ="revision1" value="{$cost.revision1}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsdrawingnumber#}</label>
              <input type = "hidden" id = "jenkins_drawing_number" name ="jenkins_drawing_number" value="{$cost.jenkins_drawing_number}"></input>
              <input id="lbl_jenkins_drawing_number" style="width:191px" value="{$cost.jenkins_drawing_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_drawing_number','lbl_jenkins_drawing_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision2#}</label>
              <input id = "revision2" name ="revision2" value="{$cost.revision2}"  ></input>
            </div>
            {if $smarty.session.userRole <=3}
            <div class="row">
              <label style="width:240px;" >{#internalbudgetaryprice#}</label>
              <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$cost.internal_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_budgetary_price_currency" name="internal_budgetary_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_budgetary_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#externalbudgetaryprice#}</label>
              <input id = "external_budgetary_price" name ="external_budgetary_price" value="{$cost.external_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "external_budgetary_price_currency" name="external_budgetary_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.external_budgetary_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalalphaprice#}</label>
              <input id = "internal_alpha_price" name ="internal_alpha_price" value="{$cost.internal_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_alpha_price_currency" name="internal_alpha_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_alpha_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#externalalphaprice#}</label>
              <input id = "external_alpha_price" name ="external_alpha_price" value="{$cost.external_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "external_alpha_price_currency" name="external_alpha_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.external_alpha_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalbetaprice#}</label>
              <input id = "internal_beta_price" name ="internal_beta_price" value="{$cost.internal_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_beta_price_currency" name="internal_beta_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_beta_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#externalbetaprice#}</label>
              <input id = "external_beta_price" name ="external_beta_price" value="{$cost.external_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "external_beta_price_currency" name="external_beta_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.external_beta_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalfinalprice#}</label>
              <input id = "internal_final_price" name ="internal_final_price" value="{$cost.internal_final_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_final_price_currency" name="internal_final_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_final_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            <div class="row">
              <label style="width:240px;" >{#externalfinalprice#}</label>
              <input id = "external_final_price" name ="external_final_price" value="{$cost.external_final_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "external_final_price_currency" name="external_final_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.external_final_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            {elseif $smarty.session.userRole <= 5}
            <div class="row">
              <label style="width:240px;" >{#internalbudgetaryprice#}</label>
              <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$cost.internal_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_budgetary_price_currency" name="internal_budgetary_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_budgetary_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            <div style="display:none">
              <input id = "external_budgetary_price" name ="external_budgetary_price" value="{$cost.external_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <input id = "external_alpha_price" name ="external_alpha_price" value="{$cost.external_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <input id = "external_beta_price" name ="external_beta_price" value="{$cost.external_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <input id = "external_final_price" name ="external_final_price" value="{$cost.external_final_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>

              <input id = "external_budgetary_price_currency" name ="external_budgetary_price_currency" value="{$cost.external_budgetary_price_currency}"></input>
              <input id = "external_alpha_price_currency" name ="external_alpha_price_currency" value="{$cost.external_alpha_price_currency}"></input>
              <input id = "external_beta_price_currency" name ="external_beta_price_currency" value="{$cost.external_beta_price_currency}"></input>
              <input id = "external_final_price_currency" name ="external_final_price_currency" value="{$cost.external_final_price_currency}"></input>
          </div>
            

            <div class="row">
              <label style="width:240px;" >{#internalalphaprice#}</label>
              <input id = "internal_alpha_price" name ="internal_alpha_price" value="{$cost.internal_alpha_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_alpha_price_currency" name="internal_alpha_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_alpha_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalbetaprice#}</label>
              <input id = "internal_beta_price" name ="internal_beta_price" value="{$cost.internal_beta_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_beta_price_currency" name="internal_beta_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_beta_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalfinalprice#}</label>
              <input id = "internal_final_price" name ="internal_final_price" value="{$cost.internal_final_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_final_price_currency" name="internal_final_price_currency" class="currency">
                  {section name=curr loop=$currency}
                  {if $currency[curr] == $cost.internal_final_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                  {/section}
                </select>
            </div>
            {else}
            {/if}
            <div class="row">
              <label style="width:240px;" >{#quantityperproduct#}</label>
              <input id = "quantity_per_product" name ="quantity_per_product" value="{$cost.quantity_per_product}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            
            <div class="row-butn-bottom">
              <label></label>
              <button onfocus="this.blur();" type="submit">{#save#}</button>
              <button onfocus="this.blur();" onclick="self.close()" type="reset">{#cancel#}</button>
            </div>
          </form>
        </div>

        <div class="content-spacer"></div>
        <div class="projects">
          <div class="headline">
            <a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick="toggleBlock('internalpricebreakdown');"></a>
            <div class="wintools">
              <div class="progress" id="progress" style="display:none;">
                <img src="templates/standard/images/symbols/loader-cal.gif">
              </div>
            </div>
            <h2>
              <img src="./templates/standard/images/symbols/projects.png" alt="">{#internalpricebreakdown#}
            </h2>
          </div>
          <div id = "internalpricebreakdown" class="block_in_wrapper">
            <div class="phaseMenualBar" style="padding-top:20px;">
              <button id="addinternalpricebreakdown" onclick="J.openWindow('/manageinternalpricebreakdown.php?action=editform&costId={$cost.ID}')">{#add#}</button>
           </div>
            <div style="padding-top:20px;">
              {include file="internalpricebreakdowntable.tpl"}
            </div>
          </div>
        </div>

        {if $smarty.session.userRole <=3}
        <div class="content-spacer"></div>
        <div class="projects">
          <div class="headline">
            <a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick="toggleBlock('externalpricebreakdown');"></a>
            <div class="wintools">
              <div class="progress" id="progress" style="display:none;">
                <img src="templates/standard/images/symbols/loader-cal.gif">
              </div>
            </div>
            <h2>
              <img src="./templates/standard/images/symbols/projects.png" alt="">{#externalpricebreakdown#}
            </h2>
          </div>
          <div id="externalpricebreakdown" class="block_in_wrapper">
            <div class="phaseMenualBar" style="padding-top:20px;">
              <button id="addexternalpricebreakdown" onclick="J.openWindow('/manageexternalpricebreakdown.php?action=editform&costId={$cost.ID}')">{#add#}</button>
           </div>
            <div  style="padding-top:20px;">
              {include file="externalpricebreakdowntable.tpl"}
            </div>
          </div>
        </div>
        {/if}
      </div>
    </div>
  </div>

</body>