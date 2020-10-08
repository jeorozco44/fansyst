<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 14/9/2018
 * Time: 09:40
 */

namespace AppBundle\Controller;


use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;

/**
 * Class ApiController
 * @package AppBundle\Controller
 * @Rest\Route("/api")
 */
class ApiController extends FOSRestController
{
    /**
     *@Rest\Get("/checkToken", name="api_check_token")
     */
    public function checkTokenAction(){
        $data = array("token" => "true");
        $view = $this->view($data);
        return $this->handleView($view);
    }

}