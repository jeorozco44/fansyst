<?php

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

class UsuarioForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombreUsuario',TextType::class,[
                "label" => "Nombre de Usuario:",
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
            ->add("claveRaw", RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Las contraseñas deben coincidir.',
                'first_options'  => array(
                    'label' => '*Contraseña:',
                    "constraints" => [
                        new Length([
                            "min" => 5,
                            "max" => 30,
                            "minMessage" => "La contraseña debe tener al menos {{ limit }} caracteres",
                            "maxMessage" => "La contraseña no debe tener más de {{ limit }} caracteres"
                        ])
                    ],
                    "attr" => ["maxlength" => 30]
                ),
                'second_options' => array(
                    'label' => '*Repetir contraseña:',
                    "constraints" => [
                        new Length([
                            "min" => 5,
                            "max" => 30,
                            "minMessage" => "La confirmación de contraseña debe tener al menos {{ limit }} caracteres",
                            "maxMessage" => "La confirmación decontraseña no debe tener más de {{ limit }} caracteres"
                        ])
                    ],
                    "attr" => ["maxlength" => 30]
                ),
                'required' => true,
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

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'SeguridadBundle\Entity\Usuario',
            'csrf_protection'=>false
        ]);
    }
}
