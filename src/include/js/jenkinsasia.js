var J = {};

J.validationAddTask=function(form,errCss,startDate,endDate){
  var ret = true;
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

J.testFunc=function(scope){
  scope.blur();
}