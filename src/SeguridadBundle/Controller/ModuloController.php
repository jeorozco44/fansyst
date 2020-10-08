<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 14/9/2018
 * Time: 11:57
 */

namespace SeguridadBundle\Controller;


use Doctrine\ORM\EntityManagerInterface;
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Routing\ClassResourceInterface;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use SeguridadBundle\Entity\Modulo;
use SeguridadBundle\Form\ModuloForm;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class ModuloController
 * @package SeguridadBundle\Controller
 *
 * @Rest\Route("/modulo")
 */
class ModuloController extends FOSRestController implements ClassResourceInterface
{


    /**
     * @ApiDoc(
     *     section="Modulo",
     *      description="listar todos los modulos sin paginacion asdasdasdasdasdasdasdasdasdsadasdasd",
     *      output = "SeguridadBundle\Entity\Modulo",
     *     statusCodes = {
     *     200 = "retorna cuando la peticion se encuentra sin errores",
     *     400 = "retorna cuando hay errores o no se encuentra ningun usuario"
     *   }
     * )
     * @Rest\Get("/lista", name="modulo_lista")
     */
    public function moduloListaAction()
    {
        $em = $this->getDoctrine()->getManager();
        $modulo = $em->getRepository(Modulo::class)->findAll();
        if (!$modulo) {
            return $this->view(null, 400);
        }
        return $this->view(['data' => $modulo], 200);
    }


    /**
     * @ApiDoc(
     *     section="Modulo",
     *      description="crear un nuevo formulario para modulo",
     * )
     * @Rest\get("/formulario", name="modulo_formulario" )
     */
    public function usuarioFormAction(){
        $form=$this->getForm(new Modulo());
        $data = array("form"=>$form);
        $view = $this->view(['data'=>$data]);
        return $this->handleView($view);
    }

    /**
     * @param Request $request
     * @return \FOS\RestBundle\View\View|Response
     * @ApiDoc(
     *     section="Modulo",
     *      description="crear un nuevo usuario",
     *     input={
     *          "class"="SeguridadBundle/Entity/Modulo"
     *     },
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
        $form = $this->createForm(ModuloForm::class,null);
        $data=$request->request->all();
        $form->submit($data);
        if(!$form->isValid()){
            //return $this->view(['status' => 'error', 'data' => $this->formErrorSerializ->convertFormToArray($form)], Response::HTTP_BAD_REQUEST);
            return $this->handleView($this->view($form));
        }
        /**
         * @var $modulo Modulo
         */
        $modulo=$form->getData();
        $modulo->setFechaCreacion(new \DateTime());
        $modulo->setUsuarioCreador($this->getUser());
        $em=$this->getDoctrine()->getManager();
        $em->persist($modulo);
        $em->flush();
        return $this->view(['status'=>'ok'],Response::HTTP_CREATED);
    }


    /**
     * @param Modulo $modulo
     * @return mixed
     * @ApiDoc(
     *     section="Modulo",
     *     description="asdasda"
     * )
     * @Rest\Get("getfromulario")
     */
    public function getForm(Modulo $modulo){
        $form = $this->createForm(ModuloForm::class,$modulo,['csrf_protection' => false]);
        return $this->get('liform')->transform($form);
    }

}