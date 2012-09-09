{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
<div class="projects block_in_wrapper">
  <h1>{#mydocuments#}</h1>
  <ul>
    {section name=f loop=$order.attachedFiles}
      <li><a target="blank" href="{$order.attachedFiles[f].datei}">{$order.attachedFiles[f].name}:{$order.attachedFiles[f].revision}</a></li>
    {/section}
  </ul>

  <h1>{#paymentOneAttachment#}</h1>
  <ul id="paymentFileList1">
    {section name=f1 loop=$order.paymentfiles1}
      <li><a target="blank" href="{$order.paymentfiles1[f1].datei}">{$order.paymentfiles1[f1].name}:{$order.paymentfiles1[f1].revision}</a></li>
    {/section}
  </ul>

  <h1>{#paymentTwoAttachment#}</h1>
  <ul id="paymentFileList2">
    {section name=f2 loop=$order.paymentfiles2}
      <li><a target="blank" href="{$order.paymentfiles2[f2].datei}">{$order.paymentfiles2[f2].name}:{$order.paymentfiles2[f2].revision}</a></li>
    {/section}
  </ul>

  <h1>{#paymentThreeAttachment#}</h1>
  <ul id="paymentFileList3">
    {section name=f3 loop=$order.paymentfiles3}
      <li><a target="blank" href="{$order.paymentfiles3[f3].datei}">{$order.paymentfiles3[f3].name}:{$order.paymentfiles3[f3].revision}</a></li>
    {/section}
  </ul>
  <hr/>

  <h1>{#quality#}</h1>
  <ul id="qualityList">
    {section name=q loop=$order.qualities}
      <li><a target="blank" href = "/managequality.php?action=showproject&id={$order.project}&orderId={$order.ID}">{$order.qualities[q].action_no}</a></li>
    {/section}
  </ul>
  <div style="float:right;padding:8px;">
    {if $userRole == "1" || $userRole == "6" || $userRole == "7" || $userRole == "8" ||$userRole == "9" }
      <a class="butn_link" href = "/managequality.php?action=showproject&id={$order.project}&orderId={$order.ID}">{#addquality#}</a>
    {/if}
  </div>
  <div class="clear_both"></div>
  <hr/>

  <h1>{#ecnname#}</h1>
  <ul id="ecnList">
    {section name=e loop=$order.ecns}
      <li><a target="blank" href="{$order.ecns[e].datei}">{$order.ecns[e].documentName}:{$order.ecns[e].revision}</a></li>
    {/section}
  </ul>
  <div style="float:right;padding:8px;">
    
  </div>
</div>
</body>