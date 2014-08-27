{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#option#}</label>
  <textarea  id="rejectSampleDescription"></textarea>
</div> 
  
<div  style="margin:10px 0 0 0">
<button id="dlgBtnRejectSampleRequest" onclick="rejectSample({$sampleRequest.ID});">{#reject#}</button>
<button id="dlgBtnClose" onclick="closeWindows()">{#close#}</button>
</div>

