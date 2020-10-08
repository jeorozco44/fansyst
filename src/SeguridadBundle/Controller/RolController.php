<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 14:41
 */

namespace SeguridadBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

/**
 * Class RolController
 * @package SeguridadBundle\Controller
 * @Rest\Route("/rol")
 */
class RolController extends Controller
{
    /**
    * @Rest\Post("/nuevo", name="rol_crear" )
    */
    public function rolCrearAction(){

    }

    /**
     * @Rest\Get("/lista", name="rol_listar" )
     */
    public function rolListarAction(){

    }

    /**
     * @Rest\Put("/editar/{id}", name="rol_editar" )
     */
    public function rolEditarAction(){

    }

    /**
     * @Rest\Delete("/eliminar/{id}", name="rol_eliminar" )
     */
    public function rolEliminarAction(){

    }

}