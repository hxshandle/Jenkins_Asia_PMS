<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
$template->assign("currency", Currency::$Currencys);
$fs = Status::getStatusByType("finance");
$template->assign("financeStatus", $fs);
switch ($action) {
  case "showAddFinanceDlg":
    $proejctId = getArrayVal($_GET, "projectId");
    $template->assign("projectId", $proejctId);
    $template->display("addFinanceDlg.tpl");
    break;
  case "addFinance":
    $projectId = getArrayVal($_POST, "projectId");
    $incoming_payment_amount = getArrayVal($_POST, "incoming_payment_amount");
    $incoming_payment_amount_currency = getArrayVal($_POST, "incoming_payment_amount_currency");
    $customer_source = getArrayVal($_POST, "customer_source");
    $outgoing_payment_amount = getArrayVal($_POST, "outgoing_payment_amount");
    $outgoing_payment_amount_currency = getArrayVal($_POST, "outgoing_payment_amount_currency");
    $beneficiary = getArrayVal($_POST, "beneficiary");
    $project_number = getArrayVal($_POST, "project_number");
    $PO_number = getArrayVal($_POST, "PO_number");
    $invoice_number = getArrayVal($_POST, "invoice_number");
    $reason = getArrayVal($_POST, "reason");
    $planned_incoming_payment_date = getArrayVal($_POST, "planned_incoming_payment_date");
    $actual_incoming_payment_date = getArrayVal($_POST, "actual_incoming_payment_date");
    $difference1 = getArrayVal($_POST, "difference1");
    $incoming_payment_status = getArrayVal($_POST, "incoming_payment_status");
    $actual_incoming_payment_amount_received = getArrayVal($_POST, "actual_incoming_payment_amount_received");
    $planned_outgoing_payment_date = getArrayVal($_POST, "planned_outgoing_payment_date");
    $actual_outgoing_payment_date = getArrayVal($_POST, "actual_outgoing_payment_date");
    $difference2 = getArrayVal($_POST, "difference2");
    $outgoing_payment_status = getArrayVal($_POST, "outgoing_payment_status");
    $actual_outgoing_payment_amount_paid = getArrayVal($_POST, "actual_outgoing_payment_amount_paid");
    $finance = new Finance();
    $ins = $finance->add($projectId,$incoming_payment_amount,$incoming_payment_amount_currency,$customer_source,$outgoing_payment_amount,$outgoing_payment_amount_currency,$beneficiary,$project_number,$PO_number,$invoice_number,$reason,$planned_incoming_payment_date,$actual_incoming_payment_date,$difference1,$incoming_payment_status,$actual_incoming_payment_amount_received,$planned_outgoing_payment_date,$actual_outgoing_payment_date,$difference2,$outgoing_payment_status,$actual_outgoing_payment_amount_paid);
    $template->assign("callback", "reloadFinance");
    $template->display("successclose.tpl");
    break;
  case "showEditFinanceDlg":
    $id = getArrayVal($_GET, "id");
    $finance = new Finance();
    $f = $finance->get($id);
    $template->assign("finance",$f);
     $template->display("editfinancedlg.tpl");
    break;
  case "updateFinance":
    $id = getArrayVal($_POST,"financeId");
    $incoming_payment_amount = getArrayVal($_POST, "incoming_payment_amount");
    $incoming_payment_amount_currency = getArrayVal($_POST, "incoming_payment_amount_currency");
    $customer_source = getArrayVal($_POST, "customer_source");
    $outgoing_payment_amount = getArrayVal($_POST, "outgoing_payment_amount");
    $outgoing_payment_amount_currency = getArrayVal($_POST, "outgoing_payment_amount_currency");
    $beneficiary = getArrayVal($_POST, "beneficiary");
    $project_number = getArrayVal($_POST, "project_number");
    $PO_number = getArrayVal($_POST, "PO_number");
    $invoice_number = getArrayVal($_POST, "invoice_number");
    $reason = getArrayVal($_POST, "reason");
    $planned_incoming_payment_date = getArrayVal($_POST, "planned_incoming_payment_date");
    $actual_incoming_payment_date = getArrayVal($_POST, "actual_incoming_payment_date");
    $difference1 = getArrayVal($_POST, "difference1");
    $incoming_payment_status = getArrayVal($_POST, "incoming_payment_status");
    $actual_incoming_payment_amount_received = getArrayVal($_POST, "actual_incoming_payment_amount_received");
    $planned_outgoing_payment_date = getArrayVal($_POST, "planned_outgoing_payment_date");
    $actual_outgoing_payment_date = getArrayVal($_POST, "actual_outgoing_payment_date");
    $difference2 = getArrayVal($_POST, "difference2");
    $outgoing_payment_status = getArrayVal($_POST, "outgoing_payment_status");
    $actual_outgoing_payment_amount_paid = getArrayVal($_POST, "actual_outgoing_payment_amount_paid");
    $finance = new Finance();
    $ins = $finance->update($id,$incoming_payment_amount,$incoming_payment_amount_currency,$customer_source,$outgoing_payment_amount,$outgoing_payment_amount_currency,$beneficiary,$project_number,$PO_number,$invoice_number,$reason,$planned_incoming_payment_date,$actual_incoming_payment_date,$difference1,$incoming_payment_status,$actual_incoming_payment_amount_received,$planned_outgoing_payment_date,$actual_outgoing_payment_date,$difference2,$outgoing_payment_status,$actual_outgoing_payment_amount_paid);
    $template->assign("callback", "reloadFinance");
    $template->display("successclose.tpl");
    break;
    break;
    
}
?>
