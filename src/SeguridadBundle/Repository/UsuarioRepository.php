<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 13/9/2018
 * Time: 11:32
 */

namespace SeguridadBundle\Repository;


use Doctrine\ORM\EntityRepository;

class UsuarioRepository extends EntityRepository
{

    public function findUserByUserNamme($nombre_usuario){
        return $this->createQueryBuilder('u')
            ->where('u.nombreUsuario = :username')
            ->setParameter('username', $nombre_usuario)
            ->getQuery()
            ->getSingleResult();
    }



}