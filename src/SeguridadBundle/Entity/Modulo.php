<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 12:29
 */

namespace SeguridadBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class Modulo
 * @package SeguridadBundle\Entity
 * @ORM\Entity()
 * @ORM\Table(
 *     name="modulo",
 *     schema="seguridad"
 * )
 */
class Modulo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue(
     *     strategy="AUTO"
     * )
     * @ORM\Column(
     *     type="integer",
     *     nullable=false
     * )
     */
    private $id;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=false
     * )
     */
    private $nombreServicio;

    /**
     * @ORM\Column(
     *     type="text",
     *     nullable=false
     * )
     */
    private $descripcion;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=false
     * )
     */
    private $dominio;

    /**
     * @ORM\Column(
     *     type="boolean",
     *     nullable=false
     * )
     */
    private $estado;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Usuario",
     * )
     * @ORM\JoinColumn(nullable=false)
     */
    private $usuarioCreador;

    /**
     * @ORM\Column(
     *     type="datetime",
     *     nullable=false
     * )
     */
    private $fechaCreacion;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Usuario"
     * )
     * @ORM\JoinColumn(nullable=true)
     */
    private $usuarioModificador;

    /**
     * @ORM\Column(
     *     type="datetime",
     *     nullable=true
     * )
     */
    private $fechaModificacion;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getNombreServicio()
    {
        return $this->nombreServicio;
    }

    /**
     * @param mixed $nombreServicio
     */
    public function setNombreServicio($nombreServicio)
    {
        $this->nombreServicio = $nombreServicio;
    }

    /**
     * @return mixed
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * @param mixed $descripcion
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;
    }

    /**
     * @return mixed
     */
    public function getDominio()
    {
        return $this->dominio;
    }

    /**
     * @param mixed $dominio
     */
    public function setDominio($dominio)
    {
        $this->dominio = $dominio;
    }

    /**
     * @return mixed
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * @param mixed $estado
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;
    }

    /**
     * @return mixed
     */
    public function getUsuarioCreador()
    {
        return $this->usuarioCreador;
    }

    /**
     * @param mixed $usuarioCreador
     */
    public function setUsuarioCreador($usuarioCreador)
    {
        $this->usuarioCreador = $usuarioCreador;
    }

    /**
     * @return mixed
     */
    public function getFechaCreacion()
    {
        return $this->fechaCreacion;
    }

    /**
     * @param mixed $fechaCreacion
     */
    public function setFechaCreacion($fechaCreacion)
    {
        $this->fechaCreacion = $fechaCreacion;
    }

    /**
     * @return mixed
     */
    public function getUsuarioModificador()
    {
        return $this->usuarioModificador;
    }

    /**
     * @param mixed $usuarioModificador
     */
    public function setUsuarioModificador($usuarioModificador)
    {
        $this->usuarioModificador = $usuarioModificador;
    }

    /**
     * @return mixed
     */
    public function getFechaModificacion()
    {
        return $this->fechaModificacion;
    }

    /**
     * @param mixed $fechaModificacion
     */
    public function setFechaModificacion($fechaModificacion)
    {
        $this->fechaModificacion = $fechaModificacion;
    }


}