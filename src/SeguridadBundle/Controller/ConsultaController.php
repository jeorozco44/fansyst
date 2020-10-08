<?php 

namespace SeguridadBundle\Controller;

use Doctrine\ORM\EntityManagerInterface; 
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Routing\ClassResourceInterface;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use FOS\RestBundle\View\View;
use SeguridadBundle\Entity\Proyecto;
use JasperPHP\JasperPHP as JasperPHP;

class ConsultaController extends FOSRestController
{    
	
     /**
     * @Rest\Get("/sera")
     */ 
    public function indexAction()
    {
     header('Access-Control-Allow-Origin: *');
     header('Access-Control-Allow-Methods: GET, POST');
     $repo = 'ReporteDptoMunicipio';
     $FecIni ='2019-01-01';
     $FecFin ='2019-05-20';
     //$PathReport=("c:/xampp/htdocs/young-tor-10133/web/");
    // $PathReport=('c:\\xampp\\htdocs\\young-tor-10133\\web\\');
     $PathReport = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR;   
   
   
     $pdf=new JasperPHP();
     $pdf->process($PathReport.$repo.".jasper", $PathReport.$repo, array("pdf"), array("fec_ini"=>$FecIni,"fec_fin"=>$FecFin), array("driver"=>"postgres","username"=>"postgres","password"=>"1234","host"=>"localhost","database"=>"apiMjti") )->execute();
    //$pdf->process($PathReport.$repo.".jasper", $PathReport.$repo, array("pdf"), array("fec_ini"=>$FecIni,"fec_fin"=>$FecFin), array("driver"=>"postgres","username"=>"postgres","password"=>"1234","host"=>"localhost","database"=>"apiMjti") )->execute();

     //header("location: ../Lib/PDFJS/web/viewer.html?file=../../../prueba/".$repo.".pdf");
     header('Content-type: application/pdf');
     header('Content-disposition: attachment; filename="'.$repo.'".pdf');
     readfile(''.$repo.'.pdf');  
     //exec($pdf->output().' 2>&1', $output);
    

    }


}