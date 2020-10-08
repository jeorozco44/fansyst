<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 13:56
 */

namespace SeguridadBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * @ORM\Entity()
 * @ORM\Table(
 *     name="elemento_menu",
 *     schema="seguridad"
 * )
 * @UniqueEntity(fields={"path"})
 */
class Menu
{

    /**
     * @ORM\Id
     * @ORM\GeneratedValue(
     *     strategy="AUTO"
     * )
     * @ORM\Column(
     *     type="integer",
     *     nullable=false
     *     )
     */
    private $id;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=true,
     *     length=255
     * )
     */
    private $path;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=false,
     *     length=100
     * )
     */
    private $texto;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=true,
     *     length=100
     * )
     */
    private $icono;

    /**
     * @ORM\Column(
     *     type="integer",
     *     nullable=false
     * )
     */
    private $posicion;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Menu",
     *     inversedBy="elementosHijos"
     * )
     * @ORM\JoinColumn(nullable=true)
     */
    private $elementoPadre;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=true
     * )
     */
    private $parametros;

    /**
     * @ORM\Column(
     *     type="boolean",
     *     nullable=false
     * )
     */
    private $activo;

    /**
     * @ORM\OneToMany(
     *     targetEntity="SeguridadBundle\Entity\Menu",
     *     mappedBy="elementoPadre"
     * )
     */
    private $elementosHijos;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Permiso",
     *     inversedBy="elementosMenu"
     * )
     * @ORM\JoinTable(
     *     "permiso_elemento_menu",
     *     schema="seguridad"
     * )
     */
    private $permisos;


    public function __construct()
    {
        $this->permisos = new ArrayCollection();
    }

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
    public function getPath()
    {
        return $this->path;
    }

    /**
     * @param mixed $path
     */
    public function setPath($path)
    {
        $this->path = $path;
    }

    /**
     * @return mixed
     */
    public function getTexto()
    {
        return $this->texto;
    }

    /**
     * @param mixed $texto
     */
    public function setTexto($texto)
    {
        $this->texto = $texto;
    }

    /**
     * @return mixed
     */
    public function getIcono()
    {
        return $this->icono;
    }

    /**
     * @param mixed $icono
     */
    public function setIcono($icono)
    {
        $this->icono = $icono;
    }

    /**
     * @return mixed
     */
    public function getPosicion()
    {
        return $this->posicion;
    }

    /**
     * @param mixed $posicion
     */
    public function setPosicion($posicion)
    {
        $this->posicion = $posicion;
    }

    /**
     * @return Menu
     */
    public function getElementoPadre()
    {
        return $this->elementoPadre;
    }

    /**
     * @param Menu $elementoPadre
     */
    public function setElementoPadre($elementoPadre)
    {
        $this->elementoPadre = $elementoPadre;
    }

    /**
     * @return mixed
     */
    public function getActivo()
    {
        return $this->activo;
    }

    /**
     * @param mixed $activo
     */
    public function setActivo($activo)
    {
        $this->activo = $activo;
    }


    /**
     * @return ArrayCollection|Menu[]
     */
    public function getElementosHijos()
    {
        return $this->elementosHijos;
    }

    /**
     * @param ArrayCollection|Menu[] $elementosHijos
     */
    public function setElementosHijos($elementosHijos)
    {
        $this->elementosHijos = $elementosHijos;
    }

    /**
     * @return ArrayCollection|Permiso[]
     */
    public function getPermisos()
    {
        return $this->permisos;
    }

    /**
     * @param ArrayCollection|Permiso[] $permisos
     */
    public function setPermisos($permisos)
    {
        $this->permisos = $permisos;
    }

    /**
     * @return mixed
     */
    public function getParametros()
    {
        return $this->parametros;
    }

    /**
     * @param mixed $parametros
     */
    public function setParametros($parametros)
    {
        $this->parametros = $parametros;
    }

}