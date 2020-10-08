<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 13:54
 */

namespace SeguridadBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * @ORM\Entity()
 * @ORM\Table(
 *     name="rol",
 *     schema="seguridad"
 * )
 * @UniqueEntity(
 *     fields={"nombre"},
 *     message="El nombre del rol ya esta siendo utilizado"
 * )
 */
class Rol
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
     *     length=50,
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
     * @ORM\ManyToOne(targetEntity="SeguridadBundle\Entity\Usuario")
     * @ORM\JoinColumn(nullable=false)
     */
    private $usuarioCreador;

    /**
     * @ORM\ManyToOne(targetEntity="SeguridadBundle\Entity\Usuario")
     * @ORM\JoinColumn(nullable=true)
     */
    private $usuarioModificador;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Permiso",
     *     inversedBy="roles"
     * )
     * @ORM\JoinTable(
     *     "rol_permiso",
     *     schema="seguridad"
     * )
     */
    private $permisos;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Usuario",
     *     mappedBy="rolesAsignados"
     * )
     */
    private $usuarios;

    /**
     * @return ArrayCollection|Usuario[]
     */
    public function getUsuarios()
    {
        return $this->usuarios;
    }

    public function addUsuario(Usuario $usuario) {
        if($this->usuarios->contains($usuario)) {
            return;
        }

        $this->usuarios[] = $usuario;
        $usuario->addRolesAsignado($this);
    }

    public  function removeUsuario(Usuario $usuario) {
        if(!$this->usuarios->contains($usuario)){
            return;
        }

        $this->usuarios->removeElement($usuario);
        $usuario->removeRolesAsignado($this);
    }

    /**
     * @return ArrayCollection|Permiso[]
     */
    public function getPermisos()
    {
        return $this->permisos;
    }


    public function addPermiso(Permiso $permiso) {

        if($this->permisos->contains($permiso)) {
            return;
        }

        $this->permisos->add($permiso);
        $permiso->addRole($this);

    }

    public function removePermiso(Permiso $permiso) {

        if(!$this->permisos->contains($permiso)) {
            return;
        }

        $this->permisos->removeElement($permiso);
        $permiso->removeRole($this);
    }

    public function __construct()
    {
        $this->permisos = new ArrayCollection();
        $this->usuarios = new ArrayCollection();
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

}