{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
  <div id="content-left" style="background:none">
    <div id="content-left-in">
      <div class="projects">
      <form action="manageprojectajax.php?action=addSample" method="post" enctype="multipart/form-data">
        <div class="dlgRow">
          <label  >{#samplename#}</label>
          <input id="sampleName" name="sampleName"></input>
        </div>
        <div class="dlgRow">
          <label >{#sampletag#}</label>
          <input id="sampleTag" name="sampleTag" value="JK0H-0000-SMP-"></input>
        </div>
        <div class="dlgRow">
          <label >{#totalcount#}</label>
          <input id="sampleTotalcount" name="sampleTotalcount" regexp="{literal}\d+{/literal}"></input>
        </div>
        <div class="dlgRow">
          <label >{#availablecount#}</label>
          <input id="sampleAvailablecount" name="sampleAvailablecount" regexp="{literal}\d+{/literal}"></input>
        </div>
        <div class="dlgRow">
          <label style='float:left'>{#mydocuments#}</label>
          <input type ='file' name='photo' id='photo' accept='image/*'/>
        </div>
        <div style="clear:both"></div>
        <div class="dlgRow">
          <label >{#sampledescription#}</label>
          <div style="margin-left:200px">
            <textarea  id="sampleDescription" name="sampleDescription"></textarea>
          </div>
        </div>
        <input type='hidden' name='projectId' value='{$project.ID}'></input>  
        <div class="dlgRow">
          <label >{#projectname#}</label>
          <label >{$project.name}</label>
        </div>

        <div  style="margin:10px 0 0 0">
        <button id="dlgBtnSaveSample" type='submit'>{#save#}</button>
        <button id="dlgBtnSaveSample" onclick='window.close();'>{#close#}</button>
        </div>
      </form>
    </div>
    </div>
  </div>
</body>

{literal}
  <script type="text/javascript">
    function addSampleValidator(){
      var ret = true;
      var newSampleName = $('newSampleName').value;
      if(newSampleName.length<1){
        $('newSampleName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }    

        
  </script>
{/literal}