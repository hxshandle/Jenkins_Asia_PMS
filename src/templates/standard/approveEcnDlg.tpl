{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#option#}</label>
  <textarea  id="approveEcnDescription"></textarea>
</div> 
  
<div  style="margin:10px 0 0 0">
<button id="dlgBtnApproveEcnRequest" onclick="approveEcn({$ecn.ID});">{#approve#}</button>
<button id="dlgBtnClose" onclick="closeWindows()">{#close#}</button>
</div>
