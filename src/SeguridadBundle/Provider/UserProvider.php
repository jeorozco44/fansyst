<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 13/9/2018
 * Time: 10:04
 */
namespace SeguridadBundle\Provider;

use Doctrine\ORM\EntityManagerInterface;
use SeguridadBundle\Entity\Usuario;
use SeguridadBundle\Repository\UsuarioRepository;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Doctrine\Common\Persistence\ObjectRepository;
use Doctrine\ORM\NoResultException;



class UserProvider implements UserProviderInterface
{

    protected $userRepository;

    public function __construct(EntityManagerInterface $userRepository){
        $this->userRepository = $userRepository;
    }

    public function loadUserByUsername($username)
    {
        return $this->fetchUser($username);
    }

    public function refreshUser(UserInterface $user)
    {
        if (!$user instanceof Usuario) {
            throw new UnsupportedUserException(
                sprintf('Instances of "%s" are not supported.', get_class($user))
            );
        }

        $username = $user->getUsername();

        return $this->fetchUser($username);
    }

    public function supportsClass($class)
    {
        return Usuario::class === $class;
    }

    private function fetchUser($username)
    {
        $q = $this->userRepository->getRepository(Usuario::class)->findUserByUserNamme($username);
        try {
            $user = $q;
        } catch (NoResultException $e) {
            $message = sprintf(
                'Unable to find an active admin AcmeDemoBundle:User object identified by "%s".',
                $username
            );
            throw new UsernameNotFoundException($message, 0, $e);
        }

        return $user;
    }
}
