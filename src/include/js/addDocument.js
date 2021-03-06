var g_lastProjectId = -1;
function afterUploadFile(fileId) {
    var el = document.getElementById('fileId');
    el.value = "" + fileId;
}


function autoFullNewDocForm(el, name, docNo, project, order, quality, visible) {
    if (!el.checked) {
        return;
    }
    $("name").value = name;
    $("project").value = project;
    $("project").onchange();
    setTimeout(function () {
        $("order").value = order;
        $("quality").value = quality;
        $("documentNo").value = docNo;
    }, 2000);

    var arrVisible = visible.split(',');
    var visibleOpts = $('visibility').options;
    var opt;
    for (var i = 0; i < visibleOpts.length; i++) {
        opt = visibleOpts[i];
        if (arrVisible.indexOf(opt.value) !== -1) {
            opt.selected = true;
        } else {
            opt.selected = false;
        }
    }
}


function onSelProjectChange(evt) {
    var val = evt.value;
    switch (val) {
        case "-1":
            g_lastProjectId = val;
            $("notify-outer").innerHTML = "";
            _clearProjectSubInfo();
            // window.__swfu.setButtonDisabled(true);
            $('documentNo').value = '';
            break;
        default:
            g_lastProjectId = val;
            getProjectSubInfo(val);
            getProjectNotifyList(val);
            // window.__swfu.setButtonDisabled(false);
            // window.__swfu.setPostParams({id: val, "userId": __userId});
            __projectId = val;
            getProjectNumber(val);
            break;
    }
}

function getProjectNotifyList(projectId) {
    var theUrl = "manageprojectajax.php?action=getProjectNotifyGroupedList&ulstyle=margin-left:140px&id=" + projectId;
    new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess: function (payload) {
            if (payload.responseText != "") {
                $("notify-outer").innerHTML = payload.responseText;
            }
        }
    });
}
function deleteDocument(id) {
    if(!window.confirm("Are you sure to delete the document?")){
      return false;
    }
    var theUrl = "managedocument.php?action=deleteDocument&&id=" + id;
    new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess: function (payload) {
            if (payload.responseText != "") {
                alert('deleted');
                window.location.reload();
            }
        }
    });
}

function editDocument(id) {
    var url = "managedocument.php?action=editDocument&id=" + id;
    J.openWindow(url);
}

function getProjectNumber(id) {
    var theUrl = "manageprojectajax.php?action=getProjectNumber&&id=" + id;
    new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess: function (payload) {
            if (payload.responseText != "") {
                var val = payload.responseText + '-';
                $('documentNo').value = val;
            }
        }
    });
}
function refreshFilteredDocuments() {
    onCriteriaProjectChange();
}
function getProjectSubInfo(id) {
    var theUrl = "manageprojectajax.php?action=getProjectSubInfo&&id=" + id;
    new Ajax.Request(theUrl, {
        method: 'get',
        onSuccess: function (payload) {
            if (payload.responseText != "") {
                var data = eval("(" + payload.responseText + ")");
                refreshProjectSubInfo(data);
            }
        }
    });
}

function _clearProjectSubInfo() {
    var taskSel = document.getElementById('task');
    var opts = taskSel.options;
    opts.length = 0;
    opts.add(new Option(unescape(MSGS.chooseone), "-1"));

    var orderSel = document.getElementById('order');
    orderSel.options.length = 0;
    orderSel.options.add(new Option(unescape(MSGS.chooseone), "-1"));
}

function refreshProjectSubInfo(data) {
    //refresh task
    var taskSel = document.getElementById('task');
    var opts = taskSel.options;
    _buildSelOpts(opts, data.tasks);

    //refresh order
    var orderSel = document.getElementById('order');
    opts = orderSel.options;
    _buildSelOpts(opts, data.orders);

    //refresh quality
    var qualitySel = document.getElementById('quality');
    opts = qualitySel.options;
    _buildSelOpts(opts, data.qualitys);
}

function _buildSelOpts(opts, data) {
    data = data || [];
    opts.length = 0;
    opts.add(new Option(unescape(MSGS.chooseone), "-1"));
    var dataRow;
    for (var i = 0; i < data.length; i++) {
        dataRow = data[i];
        opts.add(new Option(dataRow.name, "" + dataRow.id));
    }
}

function filterDocument(param) {

    var project = document.getElementById("project-filter-val").value;
    var order = document.getElementById("criteriaOrder").value;
    var customer = "-1";
    if (document.getElementById("criteriaCustomer")) {
        customer = document.getElementById("criteriaCustomer").value;
    }

    if(project =="-1" && order =="-1" && customer =="-1"){
        document.getElementById("documentTableContainer").innerHTML = "";
        return;
    }

    var theUrl = "managedocument.php?action=filterDocument";
    var thePost = param || "";
    new Ajax.Request(theUrl, {
        method: 'post',
        postBody: thePost,
        onSuccess: function (payload) {
            if (payload.responseText != "") {
                document.getElementById("documentTableContainer").innerHTML = payload.responseText;
            }
        }
    });
}

function _buildFilterParam() {
    //var project = document.getElementById("criteriaProject").value;
    // for new project filter
    var project = document.getElementById('project-filter-val').value;
    var order = document.getElementById("criteriaOrder").value;
    var customer = "-1";
    if (document.getElementById("criteriaCustomer")) {
        customer = document.getElementById("criteriaCustomer").value;
    }
    var ret = "";
    ret = "projectId=" + project + "&orderId=" + order + "&customerName=" + customer;
    return ret;
}

function disableUploadBtn() {
    // window.__swfu.setButtonDisabled(true);
}

function onCriteriaProjectChange(el) {
    filterDocument(_buildFilterParam());
}

function onCriteriaCustomerChange(el) {
    filterDocument(_buildFilterParam());
}

function onCriteriaOrderChange(el) {
    filterDocument(_buildFilterParam());
}

function nextElementSibling(el) {
    if (el.nextElementSibling) return el.nextElementSibling;
    do { el = el.nextSibling } while (el && el.nodeType !== 1);
    return el;
}

function toggleOldVersion(target){
    var isShow = target.getAttribute("data-show") == "true" ? true:false;
    var displayTxt = !isShow ? "Hide old versions" : "Show old versions";
    target.setAttribute("data-show",isShow? "false":"true");
    target.innerHTML = displayTxt;
    var toggleEl = nextElementSibling(target.parentNode);
    if(isShow){
        toggleEl.style.display = "none";
    }else{
        toggleEl.style.display = "block";
    }
}

(function () {
    var el = document.getElementById("form_adddocument");
    el.style.display = "none";
    // function disableUploadButton() {
    //     if (window.__swfu && window.__swfu.setButtonDisabled) {
    //         //window.__swfu.setButtonDisabled(true);
    //         var el = document.getElementById("form_adddocument");
    //         el.style.display = "none";
    //     } else {
    //         setTimeout(disableUploadButton, 500);
    //     }
    // }
    //
    // setTimeout(disableUploadButton, 500);


})();
