<?php
/**
 * Created by PhpStorm.
 * User: atic
 * Date: 14-09-18
 * Time: 10:11 AM
 */

namespace SeguridadBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class PermisoForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options){
        $builder
            ->add('nombrePermiso',TextType::class,[
                "label" => "Nombre del Permiso:",
                "constraints" => [
                    new NotBlank(),
                    new Length([
                        "min" => 3,
                        "max" => 20,
                        "minMessage" => "El nombre del permiso debe tener al menos {{ limit }} caracteres.",
                        "maxMessage" => "El nombre del permiso no debe tener más de {{ limit }} caracteres"
                    ]),
                ]
            ])
            ->add('nombreDescripcion',TextType::class,[
                "label" => "Descripciòn del Permiso:",
                "constraints" => [
                    new NotBlank(),
                    new Length([
                        "min" => 3,
                        "max" => 20,
                        "minMessage" => "El nombre del permiso debe tener al menos {{ limit }} caracteres.",
                        "maxMessage" => "El nombre del permiso no debe tener más de {{ limit }} caracteres"
                    ]),
                ]
            ])
            ->add("activo",ChoiceType::class, [
                "choices" => [
                    "SI" => TRUE,
                    "NO" => FALSE
                ],
                "label" => "Habilitado:"
            ])
        ;
    }

}