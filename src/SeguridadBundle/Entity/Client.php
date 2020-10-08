<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 13/9/2018
 * Time: 10:36
 */

namespace SeguridadBundle\Entity;

use FOS\OAuthServerBundle\Entity\Client as BaseClient;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="oauth2_clients",schema="oauth")
 * @ORM\Entity()
 */
class Client extends BaseClient
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    public function __construct()
    {
        parent::__construct();
    }
}