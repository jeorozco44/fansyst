<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
require_once "../Lib/JasperPHP/JasperPHP.php";


$repo = $_GET['dat'];
$FecIni =$_GET['FIni'];
$FecFin =$_GET['FFin'];
//$aFI = explode("/",'07/01/2017');
//$aFF = explode("/",date("d/m/Y"));
//$FecIni = $aFI[2]."-".$aFI[1]."-".$aFI[0];
//$FecFin = $aFF[2]."-".$aFF[1]."-".$aFF[0];
$PathReport = "C:\\xampp\\htdocs\\apiplataforma\\reportes\\prueba\\";

//print_r("Reporte=".$repo." FecIni=".$FecIni." FecFin=".$FecFin);
//die();


$pdf=new JasperPHP();
$pdf->process($PathReport.$repo.".jasper", $PathReport.$repo, array("pdf"), array("fec_ini"=>$FecIni,"fec_fin"=>$FecFin), array("driver"=>"postgres","username"=>"postgres","password"=>"1234","host"=>"localhost","database"=>"apiMjti") )->execute();

//header("location: ../Lib/PDFJS/web/viewer.html?file=../../../prueba/".$repo.".pdf");
header('Content-type: application/pdf');
header('Content-disposition: attachment; filename="'.$repo.'".pdf');
readfile(''.$repo.'.pdf'); 
?>


