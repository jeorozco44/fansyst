<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20180914140614 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('DROP SEQUENCE seguridad.servicio_id_seq CASCADE');
        $this->addSql('CREATE SEQUENCE seguridad.modulo_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE seguridad.modulo (id INT NOT NULL, usuario_creador_id INT NOT NULL, usuario_modificador_id INT NOT NULL, nombre_servicio VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, dominio VARCHAR(255) NOT NULL, estado BOOLEAN NOT NULL, fecha_creacion TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, fecha_modificacion TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C38B598691C4469F ON seguridad.modulo (usuario_creador_id)');
        $this->addSql('CREATE INDEX IDX_C38B59862DE240FD ON seguridad.modulo (usuario_modificador_id)');
        $this->addSql('ALTER TABLE seguridad.modulo ADD CONSTRAINT FK_C38B598691C4469F FOREIGN KEY (usuario_creador_id) REFERENCES seguridad.usuario (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE seguridad.modulo ADD CONSTRAINT FK_C38B59862DE240FD FOREIGN KEY (usuario_modificador_id) REFERENCES seguridad.usuario (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE seguridad.servicio');
        $this->addSql('ALTER TABLE seguridad.permiso ADD modulo_id INT NOT NULL');
        $this->addSql('ALTER TABLE seguridad.permiso ADD CONSTRAINT FK_36346284C07F55F5 FOREIGN KEY (modulo_id) REFERENCES seguridad.modulo (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_36346284C07F55F5 ON seguridad.permiso (modulo_id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'postgresql', 'Migration can only be executed safely on \'postgresql\'.');

        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE seguridad.permiso DROP CONSTRAINT FK_36346284C07F55F5');
        $this->addSql('DROP SEQUENCE seguridad.modulo_id_seq CASCADE');
        $this->addSql('CREATE SEQUENCE seguridad.servicio_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE seguridad.servicio (id INT NOT NULL, nombre_servicio VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, dominio VARCHAR(255) NOT NULL, estado BOOLEAN NOT NULL, usuario_creador INT NOT NULL, fecha_creacion TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, usuario_modificador INT DEFAULT NULL, fecha_modificacion TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('DROP TABLE seguridad.modulo');
        $this->addSql('DROP INDEX IDX_36346284C07F55F5');
        $this->addSql('ALTER TABLE seguridad.permiso DROP modulo_id');
    }
}
