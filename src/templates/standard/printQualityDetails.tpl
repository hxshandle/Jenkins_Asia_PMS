<ul>
    <li>
      <div class='details-title'>Details</div>
    </li>     
  
    <li>
      <div class='title'>{#status#}</div>
      <div class='content'>{dispstatus statusId = $entry.status}</div>
    </li>
  
    <li>
      <div class='title'>{#rejectDesc#}</div>
      <div class='content'>{$entry.reject_desc}</div>
    </li>
  
    <li>
      <div class='title'>{#quantity#}</div>
      <div class='content'>{$entry.quantity}</div>
    </li>
  
    <li>
      <div class='title'>{#requiredDesc#}</div>
      <div class='content'>{$entry.required_desc}</div>
    </li>
  
    <li>
      <div class='title'>{#rootCause#}</div>
      <div class='content'>{$entry.root_cause}</div>
    </li>
  
    <li>
      <div class='title'>{#containmentAction#}</div>
      <div class='content'>{$entry.containment_action}</div>
    </li>
  
    <li>
      <div class='title'>{#supplierShortTermCorrectiveAct#}</div>
      <div class='content'>{$entry.supplier_short_term_corrective_act}</div>
    </li>
  
    <li>
      <div class='title'>{#shotTermImplementationDate#}</div>
      <div class='content'>{$entry.shot_term_implementation_date}</div>
    </li>
  
    <li>
      <div class='title'>{#shortTermVerified#}</div>
      <div class='content'>{$entry.short_term_verified}</div>
    </li>
  
    <li>
      <div class='title'>{#supplierLongTermCorrectiveAct#}</div>
      <div class='content'>{$entry.supplier_long_term_corrective_act}</div>
    </li>
  
    <li>
      <div class='title'>{#longTermImplementationDate#}</div>
      <div class='content'>{$entry.long_term_implementation_date}</div>
    </li>
  
    <li>
      <div class='title'>{#vendorProcessAuditPlanRevision#}</div>
      <div class='content'>{$entry.vendor_process_audit_plan_revision}</div>
    </li>
  
    <li>
      <div class='title'>{#longTermVerified#}</div>
      <div class='content'>{$entry.long_term_verified}</div>
    </li>
    <li>
      <div class='title'>{#file#}</div>
      <div class='content'>
        {foreach from=$entry.files item=image}
          <img src="/thumb.php?pic={$image.datei}&width=480"></img>
        {/foreach}
      </div>
    </li>
</ul>