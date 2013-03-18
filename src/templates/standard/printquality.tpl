{config_load file=lng.conf section = "strings" scope="global" }
<head>
  <link rel="stylesheet" href="templates/standard/css/print.css" type="text/css"  />
</head>
<body>
  <div class='actions'>
    <button onclick="window.print();">{#print#}</button>
  </div>
  <div class='print-content'>
    <h2>Quality-{$quality.action_no}</h1>
    <ul>
      
        <li>
          <div class='title'>{#actionNo#}</div>
          <div class='content'>{$quality.action_no}</div>
        </li>
      
        <li>
          <div class='title'>{#qualityNo#}</div>
          <div class='content'>{$quality.quality_no}</div>
        </li>
      
        <li>
          <div class='title'>{#issueDate#}</div>
          <div class='content'>{$quality.issue_date|truncate:"10":""}</div>
        </li>
      
        <li>
          <div class='title'>{#productNo#}</div>
          <div class='content'>{$quality.product_no}</div>
        </li>
      
        <li>
          <div class='title'>{#productDesc#}</div>
          <div class='content'>{$quality.product_desc}</div>
        </li>
      
        <li>
          <div class='title'>{#shipNo#}</div>
          <div class='content'>{$quality.ship_no}</div>
        </li>
      
        <li>
          <div class='title'>{#statusUpdate#}</div>
          <div class='content'>{$quality.status_update}</div>
        </li>
      
        <li>
          <div class='title'>{#lotQuantity#}</div>
          <div class='content'>{$quality.lot_quantity}</div>
        </li>
      
        <li>
          <div class='title'>{#sampleSize#}</div>
          <div class='content'>{$quality.Sample_size}</div>
        </li>
      
        <li>
          <div class='title'>{#defects#}</div>
          <div class='content'>{$quality.defects}</div>
        </li>
      
        <li>
          <div class='title'>{#rejectRate#}</div>
          <div class='content'>{$quality.reject_rate}%</div>
        </li>
      
        <li>
          <div class='title'>{#quantityInInventory#}</div>
          <div class='content'>{$quality.quantity_in_inventory}</div>
        </li>
      
        <li>
          <div class='title'>{#quantityInProcess#}</div>
          <div class='content'>{$quality.quantity_in_process}</div>
        </li>
      
        <li>
          <div class='title'>{#containmentDesc#}</div>
          <div class='content'>{$quality.containment_desc}</div>
        </li>
      
        <li>
          <div class='title'>{#acknowledgeBy#}</div>
          <div class='content'>{$quality.acknowledge_by}</div>
        </li>
      
        <li>
          <div class='title'>{#acknowledgeDate#}</div>
          <div class='content'>{$quality.acknowledge_date|truncate:"10":""}</div>
        </li>
      
        <li>
          <div class='title'>{#verifiedForClosureBy#}</div>
          <div class='content'>{$quality.verified_for_closure_by}</div>
        </li>
      
        <li>
          <div class='title'>{#verificationDate#}</div>
          <div class='content'>{$quality.verification_date|truncate:"10":""}</div>
        </li>
    </ul>
    <!-- Quality Details -->
    {section name=entry loop=$details}
      <div class="details-section">
        {include file="printQualityDetails.tpl" entry=$details[entry]}
      </div>
    {/section}
  </div>
</body>