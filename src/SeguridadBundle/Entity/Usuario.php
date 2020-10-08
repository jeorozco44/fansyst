<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 12/9/2018
 * Time: 12:15
 */

namespace SeguridadBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(
 *      repositoryClass="SeguridadBundle\Repository\UsuarioRepository"
 * )
 * @ORM\Table(
 *     name="usuario",
 *     schema="seguridad"
 * )
 * @UniqueEntity(
 *     fields={"nombreUsuario"},
 *     message="El nombre de usuario ya esta en uso!"
 * )
 */
class Usuario implements UserInterface
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
     *     unique=true
     * )
     */
    private $nombreUsuario;

    /**
     * @ORM\Column(
     *     type="string",
     *     nullable=false,
     *     length=256
     * )
     */
    private $clave;

    /**
     */
    private $claveRaw;

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
     * @ORM\JoinColumn(
     *     nullable=false
     *     )
     */
    private $usuarioCreador;

    /**
     * @ORM\ManyToOne(
     *     targetEntity="SeguridadBundle\Entity\Usuario"
     * )
     * @ORM\JoinColumn(
     *     nullable=true
     *     )
     */
    private $usuarioModificador;

    /**
     * @ORM\Column(
     *     type="date",
     *     nullable=false
     * )
     */
    private $fechaAsignacion;

    /**
     * @ORM\Column(
     *     type="date",
     *     nullable=false
     * )
     */
    private $fechaAlta;

    /**
     * @ORM\Column(
     *     type="date",
     *     nullable=true
     * )
     */
    private $fechaBaja;

    /**
     * @ORM\Column(
     *     type="boolean",
     *     nullable=false
     * )
     */
    private $activo;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Permiso",
     *     inversedBy="usuarios"
     * )
     * @ORM\JoinTable(
     *     "usuario_permiso",
     *     schema="seguridad"
     * )
     */
    private $permisos;

    /**
     * @ORM\ManyToMany(
     *     targetEntity="SeguridadBundle\Entity\Rol",
     *     inversedBy="usuarios"
     * )
     * @ORM\JoinTable(
     *     "usuario_rol",
     *     schema="seguridad"
     * )
     */
    private $rolesAsignados;

    public function __construct()
    {
        $this->permisos = new ArrayCollection();
        $this->rolesAsignados = new ArrayCollection();
    }


    /**
     * @return ArrayCollection|Rol[]
     */
    public function getRolesAsignados()
    {
        return $this->rolesAsignados;
    }

    public function addRolesAsignado(Rol $rol) {
        if($this->rolesAsignados->contains($rol)) {
            return;
        }
        $this->rolesAsignados[] = $rol;
        $rol->addUsuario($this);
    }

    public function removeRolesAsignado(Rol $rol) {
        if(!$this->rolesAsignados->contains($rol)) {
            return;
        }
        $this->rolesAsignados->removeElement($rol);
        $rol->removeUsuario($this);
    }

    /**
     * @return ArrayCollection|Permiso[]
     */
    public function getPermisos()
    {
        return $this->permisos;
    }

    public function addPermiso(Permiso $permiso) {

        if($this->permisos->contains($permiso)){
            return;
        }

        $this->permisos[] = $permiso;
        $permiso->addUsuario($this);
    }


    public function removePermiso(Permiso $permiso) {
        if(!$this->permisos->contains($permiso)) {
            return;
        }

        $this->permisos->removeElement($permiso);
        $permiso->removeUsuario($this);
    }


    /**
     * @return mixed
     */
    public function getFechaAlta()
    {
        return $this->fechaAlta;
    }

    /**
     * @param mixed $fechaAlta
     */
    public function setFechaAlta($fechaAlta)
    {
        $this->fechaAlta = $fechaAlta;
    }


    /**
     * @return mixed
     */
    public function getNombreUsuario()
    {
        return $this->nombreUsuario;
    }

    /**
     * @param mixed $nombreUsuario
     */
    public function setNombreUsuario($nombreUsuario)
    {
        $this->nombreUsuario = $nombreUsuario;
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
    public function getClaveRaw()
    {
        return $this->claveRaw;
    }

    /**
     * @param mixed $claveRaw
     */
    public function setClaveRaw($claveRaw)
    {
        $this->claveRaw = $claveRaw;
        // Fuerzo que el objeto parezca "dirty" a Doctrine. Evita
        // que "no" se guarde la clave si cambia este valor
        $this->clave = null;
    }

    /**
     * @return mixed
     */
    public function getClave()
    {
        return $this->clave;
    }

    /**
     * @param mixed $clave
     */
    public function setClave($clave)
    {
        $this->clave = $clave;
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
    public function getFechaAsignacion()
    {
        return $this->fechaAsignacion;
    }

    /**
     * @param mixed $fechaAsignacion
     */
    public function setFechaAsignacion($fechaAsignacion)
    {
        $this->fechaAsignacion = $fechaAsignacion;
    }


    /**
     * @return mixed
     */
    public function getFechaBaja()
    {
        return $this->fechaBaja;
    }

    /**
     * @param mixed $fechaBaja
     */
    public function setFechaBaja($fechaBaja)
    {
        $this->fechaBaja = $fechaBaja;
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



    public function getRoles()
    {
        $permisosAsignados = array("ROLE_USUARIO_LOGUEADO");

        foreach ( $this->getPermisos() as $permiso) {
            $permisosAsignados[] = $permiso->getNombre();
        }
        foreach($this->getRolesAsignados() as $rol) {
            foreach($rol->getPermisos() as $permiso){
                $permisosAsignados[] = $permiso->getNombre();
            }
        }
        return $permisosAsignados;
    }

    public function getPassword()
    {
        return $this->clave;
    }

    public function getSalt()
    {
        //No se usa por bcrypt
    }

    public function getUsername()
    {
        return $this->nombreUsuario;
    }

    public function eraseCredentials()
    {
        $this->claveRaw = null;
    }

}