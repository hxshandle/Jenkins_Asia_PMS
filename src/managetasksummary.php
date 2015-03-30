<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

require("./init.php");

$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}


$jUtils = new JUtils();

switch ($action) {
  case "showtasks":
    $customers = $jUtils->getAllCustomers();
    $projectLeaders = $jUtils->getAllProjectLeaders();
    $customerLeaders = $jUtils->getAllCustomerLeaders();
    $template->assign("customers",$customers);
    $template->assign("projectLeaders",$projectLeaders);
    $template->assign("customerLeaders",$customerLeaders);
    $template->display("taskSummary.tpl");
    break;
  case "filterTasks":
    $customer = getArrayVal($_GET, "customer");
    $projectLeader = getArrayVal($_GET,"projectLeader");
    $customerLeader = getArrayVal($_GET,"customerLeader");
    $task = new task();
    if(empty($customerLeaders)){
        $tasks = $task->getTaskSummaryByCustomerLeader($customerLeader);
    }else{
        if(empty($projectLeader)){
          $tasks = $task->getTaskSummaryByCustomerName($customer);
        }else{
          $tasks = $task->getTaskSummaryByProjectLeader($projectLeader);
        }
    }
    
    $template->assign("tasks",$tasks);
    $template->assign("groupedTasks",$tasks);
    $template->display("_tasksGroupedByProject.tpl");
    break;
  case "exportPDF":
    $customer = getArrayVal($_POST, "customer");
    $projectLeader = getArrayVal($_POST,"projectLeader");
    $customerLeader = getArrayVal($_GET,"customerLeader");
    $task = new task();
    if(empty($customerLeaders)){
        $tasks = $task->getTaskSummaryByCustomerLeader($customerLeader);
    }else{
        if(empty($projectLeader)){
          $tasks = $task->getTaskSummaryByCustomerName($customer);
        }else{
          $tasks = $task->getTaskSummaryByProjectLeader($projectLeader);
        }
    }
    
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true);
    $pdf->SetHeaderData("", 0, "" , "Task Summary");

    $pdf->setHeaderFont(Array(PDF_FONT_NAME_DATA, '', 20));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', 8));
    $pdf->SetHeaderMargin(0);
    $pdf->SetFont(PDF_FONT_NAME_MAIN, "", 11);

    $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
    $pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);
    $pdf->setLanguageArray($l);

    $pdf->AliasNbPages();
    $pdf->AddPage();
    $htmlCnt = "<h1>Hello PDF</h1>";
    $template->assign("groupedTasks",$tasks);
    $template->assign("isPDF",true);
    $html = $template->fetch("_tasksGroupedByProject.tpl",null,null,false);
    $pdf->writeHTML($html, true, 0, true, 0);
    $pdf->Output("task-summary.pdf", "D");

    break;
  default:
    echo "coming soon...";
    break;
}


?>
