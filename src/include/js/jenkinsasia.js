var J = {};

J.validationAddTask=function(form,errCss){
  var ret = true;
  var startDate = substr($("tips_startDate").innerHTML,2);
  var endDate = substr($("tips_endDate").innerHTML,2);
  var deliverStartDate = new Date(Date.parse(startDate));
  var deliverEndDate = new Date(Date.parse(endDate));
  var taskStartDate = new Date(Date.parse(document.getElementsByName("start")[0].value));
  var taskEndDate = new Date(Date.parse(document.getElementsByName("end")[0].value));
  ret = taskStartDate >= deliverStartDate && taskStartDate <= deliverEndDate && taskEndDate >= deliverStartDate && taskEndDate <= deliverEndDate && taskEndDate > taskStartDate

  if(!ret){
    $(document.getElementsByName("start")[0].id).addClassName("hiErrorField");
    $(document.getElementsByName("end")[0].id).addClassName("hiErrorField");
  }
  if(ret){
    ret = validateCompleteForm(form,errCss);
  }else{
    validateCompleteForm(form,errCss);
  }
  return ret;
}

J.approveProject=function(projectId){
  document.submitForm.action="manageproject.php?action=approveProject&id="+projectId;
  document.submitForm.method="POST";
  document.submitForm.submit();
}

J.rejectProject=function(projectId){
  document.submitForm.action="manageproject.php?action=rejectProject&id="+projectId;
  document.submitForm.method="POST";
  document.submitForm.submit();
}

J.showSystemMsg=function(msg,isWarning){
  var _str = '<span class="info_in_green">'+msg+'</span>';
  $("systemmsg").innerHTML=_str;
  systemMsg('systemmsg');
}
J.testFunc=function(scope){
  scope.blur();
}