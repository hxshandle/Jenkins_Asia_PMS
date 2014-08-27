{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div id="content-left" style="background:none">
    <div id="content-left-in">
      <div class="projects">
        <!--head line-->
        <div class="headline">
          <a href="javascript:void(0);" id="externalpricebreakdown_toggle" class="win_block" onclick="toggleBlock('externalpricebreakdownToggle');"></a>
          <div class="wintools">
            <div class="progress" id="progress" style="display:none;">
              <img src="templates/standard/images/symbols/loader-cal.gif">
            </div>
          </div>
          <h2>
            <img src="./templates/standard/images/symbols/projects.png" alt="">{#externalpricebreakdown#}
          </h2>
        </div>
        <!-- externalpricebreakdown block-->
        <div id = "externalpricebreakdownToggle" class="block_in_wrapper" >
          <form onsubmit="return validateCompleteForm(this);" action="manageexternalpricebreakdown.php?action=update" method="post" class="main" style="padding-bottom:20px">
            <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
            <input type="hidden" name="externalpricebreakdownId" id="externalpricebreakdownId" value="{$externalpricebreakdown.ID}"></input>
            <input type="hidden" id = "cost" name ="cost" value="{$externalpricebreakdown.cost}"></input>
            <input type="hidden" id = "project_no" name ="project_no" value="{$externalpricebreakdown.project_no}"  ></input>
            
            
            <div class="row">
              <label style="width:240px;" >{#customermodelnumber#}</label>
              <input id = "customer_model_number" name ="customer_model_number" value="{$externalpricebreakdown.customer_model_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsmodelnumber#}</label>
              <input type = "hidden" id = "jenkins_model_number" name ="jenkins_model_number" value="{$externalpricebreakdown.jenkins_model_number}"></input>
              <input id="lbl_jenkins_model_number" style="width:191px" value="{$externalpricebreakdown.jenkins_model_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_model_number','lbl_jenkins_model_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerassemblynumber#}</label>
              <input id = "customer_assembly_number" name ="customer_assembly_number" value="{$externalpricebreakdown.customer_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsassemblynumber#}</label>
              <input id = "jenkins_assembly_number" name ="jenkins_assembly_number" value="{$externalpricebreakdown.jenkins_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerpartnumber#}</label>
              <input id = "customer_part_number" name ="customer_part_number" value="{$externalpricebreakdown.customer_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinspartnumber#}</label>
              <input id = "jenkins_part_number" name ="jenkins_part_number" value="{$externalpricebreakdown.jenkins_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerdrawingnumber#}</label>
              <input id = "customer_drawing_number" name ="customer_drawing_number" value="{$externalpricebreakdown.customer_drawing_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision1#}</label>
              <input id = "revision1" name ="revision1" value="{$externalpricebreakdown.revision1}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsdrawingnumber#}</label>
              <input type = "hidden" id = "jenkins_drawing_number" name ="jenkins_drawing_number" value="{$externalpricebreakdown.jenkins_drawing_number}"></input>
              <input id="lbl_jenkins_drawing_number" style="width:191px" value="{$externalpricebreakdown.jenkins_drawing_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_drawing_number','lbl_jenkins_drawing_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision2#}</label>
              <input id = "revision2" name ="revision2" value="{$externalpricebreakdown.revision2}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#material#}</label>
              <input id = "material" name ="material" value="{$externalpricebreakdown.material}" ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#additionalmaterialspecification#}</label>
              <input id = "additional_material_specification" name ="additional_material_specification" value="{$externalpricebreakdown.additional_material_specification}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#finish#}</label>
              <input id = "finish" name ="finish" value="{$externalpricebreakdown.finish|truncate:"10":""}"  ></input>
              <div class="datepick">
                <div id = "datepicker_finish" class="picker" style = "display:none;"></div>
              </div>
              <script>
                var theCal_finish = new calendar({$theM},{$theY});
                theCal_finish.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
                theCal_finish.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
                theCal_finish.relateTo = "finish";
                theCal_finish.dateFormat = "{$settings.dateformat}";
                theCal_finish.getDatepicker("datepicker_finish");
              </script>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#materialcost#}</label>
              <input id = "material_cost" name ="material_cost" value="{$externalpricebreakdown.material_cost}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "material_cost_currency" name="material_cost_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.material_cost_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#assemblycost#}</label>
              <input id = "assembly_cost" name ="assembly_cost" value="{$externalpricebreakdown.assembly_cost}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "assembly_cost_currency" name="assembly_cost_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.assembly_cost_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#overhead#}</label>
              <input id = "overhead" name ="overhead" value="{$externalpricebreakdown.overhead}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "overhead_currency" name="overhead_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.overhead_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#factoryprofit#}</label>
              <input id = "factory_profit" name ="factory_profit" value="{$externalpricebreakdown.factory_profit}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "factory_profit_currency" name="factory_profit_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.factory_profit_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#tax#}</label>
              <input id = "tax" name ="tax" value="{$externalpricebreakdown.tax}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "tax_currency" name="tax_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.tax_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customs#}</label>
              <input id = "customs" name ="customs" value="{$externalpricebreakdown.customs}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "customs_currency" name="customs_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.customs_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#freight#}</label>
              <input id = "freight" name ="freight" value="{$externalpricebreakdown.freight}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "freight_currency" name="freight_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.freight_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#handling#}</label>
              <input id = "handling" name ="handling" value="{$externalpricebreakdown.handling}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "handling_currency" name="handling_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.handling_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalbudgetaryprice#}</label>
              <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$externalpricebreakdown.internal_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
              <select id = "internal_budgetary_price_currency" name="internal_budgetary_price_currency" class="currency">
                {section name=curr loop=$currency}
                  {if $currency[curr] == $externalpricebreakdown.internal_budgetary_price_currency}
                      <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                  {else}
                      <option value="{$currency[curr]}">{$currency[curr]}</option>
                  {/if}
                {/section}
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#approved#}</label>
              <select id="approved" name="approved">
                <option {if $externalpricebreakdown.approved == "0"}selected{/if} value="0">{#no#}</option>
                <option {if $externalpricebreakdown.approved == "1"}selected{/if} value = "1">{#yes#}</option>
              </select>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#Published#}</label>
              <select id="Published" name="Published">
                <option {if $externalpricebreakdown.Published == "0"}selected{/if} value="0">{#no#}</option>
                <option {if $externalpricebreakdown.Published == "1"}selected{/if} value = "1">{#yes#}</option>
              </select>
            </div>
            
            <div class="row-butn-bottom">
              <label></label>
              <button onfocus="this.blur();" type="submit">{#save#}</button>
              <button onfocus="this.blur();" onclick="self.close()" type="reset">{#cancel#}</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>