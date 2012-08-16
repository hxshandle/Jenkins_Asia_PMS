function afterUploadFile(){
}

(function(){

  function disableUploadButton(){
    if(window.__swfu && window.__swfu.setButtonDisabled){
      window.__swfu.setButtonDisabled(true);
    }else{
       setTimeout(disableUploadButton,500);
    }
  }
  setTimeout(disableUploadButton,500);


})();
