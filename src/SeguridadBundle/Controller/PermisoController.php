<?php
/**
 * Created by PhpStorm.
 * User: atic
 * Date: 13-09-18
 * Time: 10:26 AM
 */

namespace SeguridadBundle\Controller;

use FOS\RestBundle\Controller\Annotations as Rest;

use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\View\View;
use SeguridadBundle\Entity\Permiso;
use SeguridadBundle\Form\PermisoForm;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class PermisoController
 * @package SeguridadBundle\Controller
 * @Rest\Route("/permiso")
 */
class PermisoController extends FOSRestController
{
    /**
     * @Rest\Post("/nuevo",name="permiso_crear")
     */
    public function permisoCrearAction(Request $request)
    {
        $form = $this->createForm(PermisoForm::class, null);
        $form->submit($request->request->all());
        if (!$form->isValid()) {
            return $this->view(['data' => $form], Response::HTTP_BAD_REQUEST);
        }
        $permiso = $form->getData();
        $em = $this->getDoctrine()->getManager();
        $em->persist($permiso);
        $em->flush();
        return $this->view(['data' => $permiso], Response::HTTP_CREATED);

    }

    /*public function permisoCrearAction1(Request $request)
    {
        $data = new Permiso;
        $nombre = $request->get('nombre');
        $descripcion = $request->get('descripcion');
        if (empty($nombre) || empty($descripcion)) {
            return new View("NULL VALUES ARE NOT ALLOWED", Response::HTTP_NOT_ACCEPTABLE);
        }
        $data->setName($name);
        $data->setRole($role);
        $em = $this->getDoctrine()->getManager();
        $em->persist($data);
        $em->flush();
        return new View("User Added Successfully", Response::HTTP_OK);
    }*/


    /**
     * @Rest\Get("/nuevo", name="permiso_listar")
     */
    public function permisoListarAction()
    {
        $em = $this->getDoctrine()->getManager();
        $permisos = $em->getRepository(Permiso::class)->findAll();

        if (!$permisos) {
            return $this->view(null, 204);
        }
        return $this->view(['data' => $permisos], 200);

    }

    /**
     * @Rest\Put("/nuevo", name="permiso_editar")
     */

    public function permisoEditarAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $permiso = $em->getDoctrine()->getRepository(Permiso::class)->find($id);
        if ($permiso === null) {
            return new View("user not found", Response::HTTP_NOT_FOUND);
        }
        return $permiso;
    }

    /**
     * @Rest\Delete("/nuevo", name="permiso_editar")
     */
    public function permisoElminarAction()
    {

    }
}