<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 13:43
 */

namespace SeguridadBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * @ORM\Entity()
 * @ORM\Table(
 *     name="permiso",
 *     schema="seguridad"
 * )
 * @UniqueEntity(
 *     fields={"nombre"},
 *     message="El nombre del permiso ya esta en uso!"
 * )
 */
class Permiso
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
     *     nullable=false,
     *     length=100,
     *     unique=true
     * )
     */
    private $nombre;

    /**
     * @ORM\Column(
     *     type="text",
     *     nullable=false
     * )
     */
    private $descripcion;

    /**
     * @ORM\Column(
     *     type="boolean",
     *     nullable=false
     * )
     */
    private $activo;

    /**
     * @ORM\Column(
     *     type="datetime",
     *     nullable=false
     * )
     */
    private $fechaCreacion;

    /**
     * @ORM\Column(
     *     type="datetime",
     *     nullable=true
     * )
     */
    private $fechaModificacion;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Usuario"
     * )
     * @ORM\JoinColumn(nullable=false)
     */
    private $usuarioCreador;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Usuario"
     * )
     * @ORM\JoinColumn(nullable=true)
     */
    private $usuarioModificador;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Usuario",
     *     mappedBy="permisos"
     * )
     */
    private $usuarios;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Rol",
     *     mappedBy="permisos"
     * )
     */
    private $roles;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Menu",
     *     mappedBy="permisos"
     * )
     */
    private $elementosMenu;


    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Modulo"
     * )
     * @ORM\JoinColumn(nullable=false)
     */
    private $modulo;

    /**
     * @return ArrayCollection|Rol[]
     */
    public function getRoles()
    {
        return $this->roles;
    }

    public function addRole(Rol $rol)
    {

        if ($this->roles->contains($rol)) {
            return;
        }

        $this->roles->add($rol);
        $rol->addPermiso($this);
    }

    public function removeRole(Rol $rol)
    {
        if (!$this->roles->contains($rol)) {
            return;
        }

        $this->roles->removeElement($rol);
        $rol->removePermiso($this);
    }

    public function __construct()
    {
        $this->usuarios = new ArrayCollection();
        $this->roles = new ArrayCollection();
        $this->elementosMenu = new ArrayCollection();
    }

    /**
     * @return mixed
     */
    public function getElementosMenu()
    {
        return $this->elementosMenu;
    }

    /**
     * @return ArrayCollection|Usuario[]
     */
    public function getUsuarios()
    {
        return $this->usuarios;
    }

    public function addUsuario(Usuario $usuario)
    {
        if ($this->usuarios->contains($usuario)) {
            return;
        }

        $this->usuarios->add($usuario);
        $usuario->addPermiso($this);
    }

    public function removeUsuario(Usuario $usuario)
    {
        if (!$this->usuarios->contains($usuario)) {
            return;
        }

        $this->usuarios->removeElement($usuario);
        $usuario->removePermiso($this);
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
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
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
    public function getfechaModificacion()
    {
        return $this->fechaModificacion;
    }

    /**
     * @param mixed $fechaModificacion
     */
    public function setfechaModificacion($fechaModificacion)
    {
        $this->fechaModificacion = $fechaModificacion;
    }

    /**
     * @return Usuario
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
     * @return Usuario
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
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getModulo()
    {
        return $this->modulo;
    }

    /**
     * @param mixed $modulo
     */
    public function setModulo($modulo)
    {
        $this->modulo = $modulo;
    }



}