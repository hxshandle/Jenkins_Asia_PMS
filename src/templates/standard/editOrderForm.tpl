{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div class="projects block_in_wrapper" >
    <form class="main" method="post" action="manageorder.php?action=editOrder" onsubmit="return validateCompleteForm(this);">
      <input type="hidden" name="orderId" id="orderId" value="{$order.ID}"></input>
      <div class="row">
        <label style="" >{#order#}</label>
        <label style="">{$order.name}</label>
      </div>
      <div class="row">
        <label style="">{#status#}</label>
        <select id = "orderStatus" name="orderStatus" class="currency">
            {section name=curr loop=$orderStatus}
            {if $orderStatus[curr].id == $order.status}
                <option selected  value="{$orderStatus[curr].id}">{$orderStatus[curr].value}</option>
            {else}
                <option value="{$orderStatus[curr].id}">{$orderStatus[curr].value}</option>
            {/if}
            {/section}
        </select>
      </div>
      <div class="row">
        <label style="">{#quantity#}</label>
        <input name="orderQuantity" value ="{$order.quantity}"></input>
      </div>
      <div class="row">
        <label style="">{#mydocuments#}</label>
        <div style="float:left">
          <ul id="documentList">
            {section name=f loop=$order.attachedFiles}
              <li>{$order.attachedFiles[f].name}:{$order.attachedFiles[f].revision}</li>
            {/section}
          </ul>
          <input type = 'hidden' name="files" id = "files" value="{$order.attachedFilesStr}"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('documentList','files');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('documentList','files');return false;">{#reset#}</a>
        </div>
      </div>

      <div class="row">
        <label style="" >{#qualityIssueNote#}</label>
          <ul style="margin-left:140px">
            {section name=qualitIssueNote loop = $qualityIssueNotes}
            <li><input type="checkbox" value="{$qualityIssueNotes[qualitIssueNote].qualityId}" name="qualityIssueNote" style="width:auto;float:none">{$qualityIssueNotes[qualitIssueNote].action_no}</li>
          {/section}
         </ul>
      </div>

      <div class="row">
        <label style="" >{#ECNNote#}</label>
          <ul style="margin-left:140px">
            {section name=ecn loop = $ecns}
            <li><input type="checkbox" value="{$ecns[ecn].ecnId}" name="ecnNote" style="width:auto;float:none">{$ecns[ecn].name}</li>
          {/section}
         </ul>
      </div>

      <!-- add new start-->
      <div class="row">
        <label style="" >{#customerPoNumber#}</label>
        <input name = "customerPartNumber" value="{$order.customer_po_number}"></input>
      </div>
      <div class="row">
        <label style="" >{#jenkinsPoNumber#}</label>
        <input id="jenkinsPoNumber" name="jenkinsPoNumber" value="{$order.jenkins_po_number}"></input>
      </div>
      <input type = "hidden" id = "fileId1" name = "fileId1"></input> 
      <div class="row">
        <label style="" >{#factory#}</label>
        <input id="factory" name="factory" value="{$order.factory}"></input>
      </div>
      <div class="row">
        <label style="" >{#terms#}</label>
        <input id="terms" name="terms" value="{$order.terms}"></input>
      </div>
      <div class="row">
        <label style="" >{#accountPayment#}</label>
        <input id="accountPayment" name="accountPayment" value="{$order.account_payment}"></input>
      </div>
      <div class="row">
        <label style="" >{#customerModelNumber#}</label>
        <input id="customerModelNumber" name="customerModelNumber"  value="{$order.customer_model_number}"></input>
      </div>
      <div class="row">
        <label style="" >{#customerPartNumber#}</label>
        <input id="customerPartNumber" name="customerPartNumber" value="{$order.customer_part_number}"></input>
      </div>
      <div class="row">
        <label style="" >{#jenkinsModelNumber#}</label>
        <input id="jenkinsModelNumber" name="jenkinsModelNumber" value="{$order.jenkins_model_number}" ></input>
      </div>
      <div class="row">
        <label style="" >{#jenkinsPartNumber#}</label>
        <input id="jenkinsPartNumber" name="jenkinsPartNumber" value="{$order.jenkins_part_number}"></input>
      </div>
        <div class="row">
        <label style="">{#deliverydateone#}</label>
        <input id="deliveryDateOne" name="deliveryDateOne" value="{$order.delivery_date_one}"></input>
      </div>
      <div class="row">
          <label style="">{#deliverystatus#}</label>
          <select id = "deliveryStatus1" name="deliveryStatus1" class="currency">
              {section name=curr loop=$status}
              {if $status[curr].id == $order.delivery_status_one}
                  <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
              {else}
                  <option value="{$status[curr].id}">{$status[curr].value}</option>
              {/if}
              {/section}
          </select>
      </div>
      <div class="row">
        <label style="">{#deliverydatetwo#}</label>
        <input id="deliveryDateTwo" name="deliveryDateTwo" value="{$order.delivery_date_two}"></input>
      </div>
      <div class="row">
          <label style="">{#deliverystatus#}</label>
          <select id = "deliveryStatus2" name="deliveryStatus2" class="currency">
              {section name=curr loop=$status}
              {if $status[curr].id == $order.delivery_status_two}
                  <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
              {else}
                  <option value="{$status[curr].id}">{$status[curr].value}</option>
              {/if}
              {/section}
          </select>
      </div>
      <div class="row">
        <label style="" >{#paymentOneSchedule#}</label>
        <input id="paymentOneSchedule" name="paymentOneSchedule" value="{$order.payment_one_schedule}"></input>
      </div>
      <div class="row">
          <label style="">{#paymentOneStatus#}</label>
          <select id = "paymentStatus1" name="paymentStatus1" class="currency">
              {section name=curr loop=$status}
              {if $status[curr].id == $order.payment_one_status}
                  <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
              {else}
                  <option value="{$status[curr].id}">{$status[curr].value}</option>
              {/if}
              {/section}
          </select>
      </div>
      <div class="row">
          <label for="uploadfile" style="float:left">{#upload#}:</label>
          <div style="float:left">
          <ul id="paymentFileList1">
            {section name=f1 loop=$order.paymentfiles1}
              <li>{$order.paymentfiles1[f1].name}:{$order.paymentfiles1[f1].revision}</li>
            {/section}
          </ul>
          <input type = 'hidden' name="paymentfiles1" id = "paymentfiles1" value="{$order.paymentfiles1Str}"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('paymentFileList1','paymentfiles1');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('paymentFileList1','paymentfiles1');return false;">{#reset#}</a>
        </div>
      </div>
      <input type = "hidden" id = "fileId2" name = "fileId2"></input>   

        <div class="row">
        <label style="" >{#paymentTwoSchedule#}</label>
        <input id="paymentTwoSchedule" name="paymentTwoSchedule" value="{$order.payment_two_schedule}"></input>
      </div>
      <div class="row">
          <label style="">{#paymentTwoStatus#}</label>
          <select id = "paymentStatus2" name="paymentStatus2" class="currency">
              {section name=curr loop=$status}
              {if $status[curr].id == $order.payment_two_status}
                  <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
              {else}
                  <option value="{$status[curr].id}">{$status[curr].value}</option>
              {/if}
              {/section}
          </select>
      </div>
      <div class="row">
          <label for="uploadfile" style="float:left">{#upload#}:</label>
          <div style="float:left">
          <ul id="paymentFileList2">
            {section name=f2 loop=$order.paymentfiles2}
              <li>{$order.paymentfiles2[f2].name}:{$order.paymentfiles2[f2].revision}</li>
            {/section}
          </ul>
          <input type = 'hidden' name="paymentfiles2" id = "paymentfiles2" value="{$order.paymentfiles2Str}"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('paymentFileList2','paymentfiles2');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('paymentFileList2','paymentfiles2');return false;">{#reset#}</a>
        </div>
      </div>
          <input type = "hidden" id = "fileId3" name = "fileId3"></input>      
        <div class="row">
        <label style="" >{#paymentThreeSchedule#}</label>
        <input id="paymentThreeSchedule" name="paymentThreeSchedule" value="{$order.payment_three_schedule}"></input>
      </div>
      <div class="row">
          <label style="">{#paymentThreeStatus#}</label>
          <select id = "paymentStatus3" name="paymentStatus3" class="currency">
              {section name=curr loop=$status}
              {if $status[curr].id == $order.payment_three_status}
                  <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
              {else}
                  <option value="{$status[curr].id}">{$status[curr].value}</option>
              {/if}
              {/section}
          </select>
      </div>
      <div class="row">
        <label for="uploadfile" style="float:left">{#upload#}:</label>
        <div style="float:left">
          <ul id="paymentFileList3">
            {section name=f3 loop=$order.paymentfiles3}
              <li>{$order.paymentfiles3[f3].name}:{$order.paymentfiles3[f3].revision}</li>
            {/section}
          </ul>
          <input type = 'hidden' name="paymentfiles3" id = "paymentfiles3" value="{$order.paymentfiles3Str}"/>
          <a class="butn_link" style="cursor:pointer" onclick="selectDocument('paymentFileList3','paymentfiles3');return false;">{#selDocuments#}</a>
          <a class="butn_link" style="cursor:pointer" onclick="resetDocuments('paymentFileList3','paymentfiles3');return false;">{#reset#}</a>
        </div>
      </div>      

      <div class="row">
        <label style="" >{#finalTotalAmountReceived#}</label>
        <input id="finalTotalAmountReceived" name="finalTotalAmountReceived" value="{$order.final_total_amount_received}"></input>
      </div>  
      <!--add new end-->  
      <div class="row">
        <label style="">{#ordertime#}</label>
        <input id="orderTime" name="orderTime"  value="{$order.end_time|truncate:"10":""}"></input>
      </div>
      <div class="row">
        <label style="">{#orderdesc#}</label>
        <textarea id="orderDesc" name="orderDesc">{$order.desc}</textarea>
      </div>
      <div  style="margin:10px 0 0 0;float:right;padding:8px">
        <button id="dlgBtnSaveOrder1" type="submit">{#save#}</button>
        <button id="dlgBtnSaveOrder1" type="submit">{#fulfilled#}</button>
        <button id="dlgBtnSaveOrder1" type="submit">{#waiver#}</button>
        <a class="butn_link" onclick="window.close();">{#cancel#}</a>
      </div>
    </form>
  </div>
  <script src="/include/js/editOrderForm.js"></script>
  <script>
  function checkBtn(){
    
  }
  </script>

</body>