{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div id="content-left" style="background:none">
    <div id="content-left-in">
      <div class="projects">
        <!--head line-->
        <div class="headline">
          <a href="javascript:void(0);" id="internalpricebreakdown_toggle" class="win_block" onclick="toggleBlock('internalpricebreakdownToggle');"></a>
          <div class="wintools">
            <div class="progress" id="progress" style="display:none;">
              <img src="templates/standard/images/symbols/loader-cal.gif">
            </div>
          </div>
          <h2>
            <img src="./templates/standard/images/symbols/projects.png" alt="">{#internalpricebreakdown#}
          </h2>
        </div>
        <!-- internalpricebreakdown block-->
        <div id = "internalpricebreakdownToggle" class="block_in_wrapper" >
          <form onsubmit="return validateCompleteForm(this);" action="manageinternalpricebreakdown.php?action=update" method="post" class="main" style="padding-bottom:20px">
            <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
            <input type="hidden" name="internalpricebreakdownId" id="internalpricebreakdownId" value="{$internalpricebreakdown.ID}"></input>
            <input type = "hidden" id = "cost" name ="cost" value="{$internalpricebreakdown.cost}"></input>
            <input type = "hidden" id = "project_no" name ="project_no" value="{$internalpricebreakdown.project_no}" ></input>
            
            <div class="row">
              <label style="width:240px;" >{#customermodelnumber#}</label>
              <input id = "customer_model_number" name ="customer_model_number" value="{$internalpricebreakdown.customer_model_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsmodelnumber#}</label>
              <input type = "hidden" id = "jenkins_model_number" name ="jenkins_model_number" value="{$internalpricebreakdown.jenkins_model_number}"></input>
              <input id="lbl_jenkins_model_number" style="width:191px" value = "{$internalpricebreakdown.jenkins_model_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_model_number','lbl_jenkins_model_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerassemblynumber#}</label>
              <input id = "customer_assembly_number" name ="customer_assembly_number" value="{$internalpricebreakdown.customer_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsassemblynumber#}</label>
              <input id = "jenkins_assembly_number" name ="jenkins_assembly_number" value="{$internalpricebreakdown.jenkins_assembly_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerpartnumber#}</label>
              <input id = "customer_part_number" name ="customer_part_number" value="{$internalpricebreakdown.customer_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinspartnumber#}</label>
              <input id = "jenkins_part_number" name ="jenkins_part_number" value="{$internalpricebreakdown.jenkins_part_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customerdrawingnumber#}</label>
              <input id = "customer_drawing_number" name ="customer_drawing_number" value="{$internalpricebreakdown.customer_drawing_number}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision1#}</label>
              <input id = "revision1" name ="revision1" value="{$internalpricebreakdown.revision1}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#jenkinsdrawingnumber#}</label>
              <input type = "hidden" id = "jenkins_drawing_number" name ="jenkins_drawing_number" value="{$internalpricebreakdown.jenkins_drawing_number}"></input>
              <input id="lbl_jenkins_drawing_number" style="width:191px" value="{$internalpricebreakdown.jenkins_drawing_number_doc_no}"></input>
              <a class="butn_link" onclick="J.selectDocument('jenkins_drawing_number','lbl_jenkins_drawing_number');">{#selDocuments#}</a>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#revision2#}</label>
              <input id = "revision2" name ="revision2" value="{$internalpricebreakdown.revision2}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#material#}</label>
              <input id = "material" name ="material" value="{$internalpricebreakdown.material}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#additionalmaterialspecification#}</label>
              <input id = "additional_material_specification" name ="additional_material_specification" value="{$internalpricebreakdown.additional_material_specification}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#finish#}</label>
              <input id = "finish" name ="finish" value="{$internalpricebreakdown.finish|truncate:"10":""}"  ></input>
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
              <input id = "material_cost" name ="material_cost" value="{$internalpricebreakdown.material_cost}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#assemblycost#}</label>
              <input id = "assembly_cost" name ="assembly_cost" value="{$internalpricebreakdown.assembly_cost}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#overhead#}</label>
              <input id = "overhead" name ="overhead" value="{$internalpricebreakdown.overhead}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#factoryprofit#}</label>
              <input id = "factory_profit" name ="factory_profit" value="{$internalpricebreakdown.factory_profit}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#tax#}</label>
              <input id = "tax" name ="tax" value="{$internalpricebreakdown.tax}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#customs#}</label>
              <input id = "customs" name ="customs" value="{$internalpricebreakdown.customs}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#freight#}</label>
              <input id = "freight" name ="freight" value="{$internalpricebreakdown.freight}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#handling#}</label>
              <input id = "handling" name ="handling" value="{$internalpricebreakdown.handling}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#internalbudgetaryprice#}</label>
              <input id = "internal_budgetary_price" name ="internal_budgetary_price" value="{$internalpricebreakdown.internal_budgetary_price}"  regexp="{literal}^\d*\.?\d{0,2}${/literal}"  ></input>
            </div>
            
            <div class="row">
              <label style="width:240px;" >{#currency#}</label>
              <select id = "currency" name="currency" class="currency">
                {section name=curr loop=$currency}
                {if $currency[curr] == $internalpricebreakdown.currency}
                    <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
                {else}
                    <option value="{$currency[curr]}">{$currency[curr]}</option>
                {/if}
              {/section}
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