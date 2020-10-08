<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 17:30
 */

namespace SeguridadBundle\Controller;


use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Request\ParamFetcherInterface;
use FOS\RestBundle\View\View;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use SeguridadBundle\Entity\Usuario;
use SeguridadBundle\Form\UsuarioForm;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;


/**
 * Class RolController
 * @package SeguridadBundle\Controller
 * @Rest\Route("/usuario")
 */
class UsuarioController extends FOSRestController
{

    /**
     * @ApiDoc(
     *     section="Usuario",
     *      description="crear un nuevo usuario",
     *      statusCodes={
     *         201="cuando se crear el usuario correctamente",
     *         403="cuando no se cuenta con el token o no tiene los permisos"
     *     }
     * )
     * @Rest\Post("/nuevo/asdas", name="usuario_crear")
     */
    public function usuarioCrearAction(Request  $fetcher){
        $usuario = new Usuario();die;
        /*$form= $this->getForm($usuario);
        $form->submit($fetcher->all(), true);

        if($form->isSubmitted() and $form->isValid()){
            $data = array("estado" => 'creado');
            $view = $this->view(['data'=>$data]);
            return $this->handleView($view);
        }
        $err = $form->getErrors();
        $errorsList = [];
        foreach ($err as $it) {
            $errorsList[(string)$it->getOrigin()->getPropertyPath()] = $it->getMessage();
        }

        return $this->view([$errorsList])->setTemplateVar('errors');*/
    }

    /**
     *
     * @ApiDoc(
     *     section="Usuario",
     *      description="listar todos los usuarios con paginacion",
     *      output = "SeguridadBundle\Entity\User",
     *     statusCodes = {
     *     200 = "retorna cuando la peticion se encuentra sin errores",
     *     400 = "retorna cuando hay errores o no se encuentra ningun usuario"
     *   }
     * )
     * @Rest\Get("/lista", name="usuario_listar" )
     *
     */
    public function usuarioListarAction(){
        $em = $this->getDoctrine()->getManager();
        $usuarios = $em->getRepository(Usuario::class)->findAll();
        if(!$usuarios)
        {
            return $this->view(null, 400);
        }
        return $this->view(['data'=>$usuarios], 200);
    }

    /**
     * @ApiDoc(
     *     section = "Usuario",
     *     description = "editar un usuario",
     * )
     * @Rest\Put("/editar/{id}", name="usuario_editar" )
     */
    public function rolEditarAction($id){

    }

    /**
     * @ApiDoc(
     *     section="Usuario",
     *  description="eliminar un usuario",
     * )
     * @Rest\Delete("/eliminar/{id}", name="usuario_eliminar" )
     */
    public function rolEliminarAction($id){

    }


    /**
     * @ApiDoc(
     *     section="Usuario",
     *      description="crear un nuevo formulario para usuario",
     * )
     * @Rest\get("/formulario", name="usuario_formulario" )
     */
    public function usuarioFormAction(){

        $usuario=new Usuario();
        /*$usuario->setNombreUsuario("lyoung");
        $usuario->setClaveRaw('123');
        $usuario->setFechaAlta(new \DateTime());
        $usuario->setFechaAsignacion(new \DateTime());
        $usuario->setUsuarioCreador($this->getUser());
        $usuario->setFechaCreacion(new \DateTime());
        $usuario->setActivo(true);
        $em=$this->getDoctrine()->getManager();
        $em->persist($usuario);
        $em->flush();
        dump($usuario);die;*/
        $form=$this->getForm($usuario);
        $data = array("form"=>$form);
        $view = $this->view(['data'=>$data]);
        return $this->handleView($view);
    }


    public function getForm(Usuario $usuario){
         $form=$this->createForm(UsuarioForm::class,$usuario,['csrf_protection' => false]);
        return $this->get('liform')->transform($form);
    }

    /**
     * @param Request $request
     * @return View|\Symfony\Component\Form\FormInterface
     * @ApiDoc(
     *     section="Usuario",
     *      description="crear un nuevo usuario",
     *     input="SeguridadBundle/Form/UsuarioForm",
     *     output="SeguridaBundle/Entity/Usuario",
     *      statusCodes={
     *         201="cuando se crear el usuario correctamente",
     *         403="cuando no se cuenta con el token o no tiene los permisos"
     *     }
     * )
     *
     * @Rest\Post("/nuevo")
     */
    public function postUserAction(Request $request){
        $form = $this->createForm(UsuarioForm::class,null);
        $form->submit($request->request->all());
        if(!$form->isValid()){
            return $this->view(['data'=>$form],Response::HTTP_BAD_REQUEST);
        }
        /**
         * @var $usuario Usuario
         */
        $usuario=$form->getData();
        $em=$this->getDoctrine()->getManager();
        $usuario->setFechaCreacion(new \DateTime());
        $usuario->setFechaAlta(new \DateTime());
        $usuario->setUsuarioCreador($this->getUser());
        dump($usuario);die;
        $em->persist($usuario);
        $em->flush();
        return $this->view(['data'=>$usuario],Response::HTTP_CREATED);
    }

}