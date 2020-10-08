<?php
/**
 * Created by PhpStorm.
 * User: tecnologias1
 * Date: 14/9/2018
 * Time: 12:01
 */

namespace SeguridadBundle\Form;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class ModuloForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombreServicio',TextType::class,[
                "label" => "Nombre de Servicio:",
                "constraints" => [
                    new NotBlank(),
                    new Length([
                        "min" => 8,
                        "max" => 20,
                        "minMessage" => "El nombre de usuario debe tener al menos {{ limit }} caracteres.",
                        "maxMessage" => "El nombre de usuario no debe tener más de {{ limit }} caracteres"
                    ]),
                ]
            ])
            ->add('descripcion',TextType::class)
            ->add('dominio',TextType::class)
            ->add('estado')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'SeguridadBundle\Entity\Modulo',
            'csrf_protection'=>false
        ]);
    }

}