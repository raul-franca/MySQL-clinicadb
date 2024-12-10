CREATE TABLE `clinica_customizacao`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clinicas_id` BIGINT NOT NULL,
    `logo` VARCHAR(255) NOT NULL,
    `nome` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `clinica_customizacao` ADD INDEX `clinica_customizacao_clinicas_id_index`(`clinicas_id`);
CREATE TABLE `especialidades`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `especialidade` VARCHAR(45) NOT NULL,
    `ativo` TINYINT NOT NULL
);
CREATE TABLE `clinicas_pacientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `paciente_id` BIGINT NOT NULL,
    `clinica_id` BIGINT NOT NULL,
    `ativo` TINYINT NOT NULL DEFAULT '1'
);
ALTER TABLE
    `clinicas_pacientes` ADD INDEX `clinicas_pacientes_paciente_id_index`(`paciente_id`);
ALTER TABLE
    `clinicas_pacientes` ADD INDEX `clinicas_pacientes_clinica_id_index`(`clinica_id`);
CREATE TABLE `clinicas_medicos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clinica_id` BIGINT NOT NULL,
    `medico_id` BIGINT NOT NULL,
    `ativo` TINYINT NOT NULL DEFAULT '1'
);
ALTER TABLE
    `clinicas_medicos` ADD INDEX `clinicas_medicos_clinica_id_index`(`clinica_id`);
ALTER TABLE
    `clinicas_medicos` ADD INDEX `clinicas_medicos_medico_id_index`(`medico_id`);
CREATE TABLE `usuarios`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `clinica_id` BIGINT NOT NULL,
    `nome` VARCHAR(75) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `senha` VARCHAR(255) NOT NULL,
    `ativo` TINYINT NOT NULL DEFAULT '1'
);
ALTER TABLE
    `usuarios` ADD INDEX `usuarios_clinica_id_index`(`clinica_id`);
CREATE TABLE `pacientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `cpf` CHAR(14) NOT NULL,
    `telefone` CHAR(15) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `logradouro` VARCHAR(100) NOT NULL,
    `bairro` VARCHAR(100) NOT NULL,
    `cep` CHAR(9) NOT NULL,
    `numero` CHAR(20) NULL,
    `complemento` VARCHAR(100) NULL,
    `cidade` VARCHAR(100) NOT NULL,
    `uf` CHAR(2) NOT NULL,
    `ativo` TINYINT(1) NOT NULL DEFAULT '1'
);
ALTER TABLE
    `pacientes` ADD UNIQUE `pacientes_cpf_unique`(`cpf`);
CREATE TABLE `medicos`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `telefone` VARCHAR(20) NULL,
    `email` VARCHAR(100) NOT NULL,
    `crm` CHAR(7) NOT NULL,
    `especialidade_id` INT NOT NULL,
    `logradouro` VARCHAR(100) NOT NULL,
    `bairro` VARCHAR(100) NOT NULL,
    `cep` CHAR(9) NOT NULL,
    `complemento` VARCHAR(100) NULL,
    `numero` VARCHAR(20) NULL,
    `uf` CHAR(2) NOT NULL,
    `cidade` VARCHAR(100) NOT NULL,
    `ativo` TINYINT(1) NOT NULL DEFAULT '1'
);
ALTER TABLE
    `medicos` ADD UNIQUE `medicos_email_unique`(`email`);
ALTER TABLE
    `medicos` ADD UNIQUE `medicos_crm_unique`(`crm`);
CREATE TABLE `consultas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `medico_id` BIGINT NOT NULL,
    `paciente_id` BIGINT UNSIGNED NOT NULL,
    `clinica_id` BIGINT NOT NULL,
    `data` DATETIME NOT NULL
);
ALTER TABLE
    `consultas` ADD INDEX `consultas_medico_id_index`(`medico_id`);
ALTER TABLE
    `consultas` ADD INDEX `consultas_data_index`(`data`);
CREATE TABLE `clinicas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cnpj` CHAR(18) NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `telefone` CHAR(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `logradouro` VARCHAR(100) NOT NULL,
    `bairro` VARCHAR(100) NOT NULL,
    `cep` CHAR(9) NOT NULL,
    `numero` VARCHAR(20) NULL,
    `complemento` VARCHAR(100) NULL,
    `cidade` VARCHAR(100) NOT NULL,
    `uf` CHAR(2) NOT NULL,
    `ativo` TINYINT(1) NOT NULL DEFAULT '1'
);
ALTER TABLE
    `clinicas` ADD UNIQUE `clinicas_cnpj_unique`(`cnpj`);
ALTER TABLE
    `usuarios` ADD CONSTRAINT `usuarios_clinica_id_foreign` FOREIGN KEY(`clinica_id`) REFERENCES `clinicas`(`id`);
ALTER TABLE
    `clinica_customizacao` ADD CONSTRAINT `clinica_customizacao_clinicas_id_foreign` FOREIGN KEY(`clinicas_id`) REFERENCES `clinicas`(`id`);
ALTER TABLE
    `clinicas_medicos` ADD CONSTRAINT `clinicas_medicos_clinica_id_foreign` FOREIGN KEY(`clinica_id`) REFERENCES `clinicas`(`id`);
ALTER TABLE
    `consultas` ADD CONSTRAINT `consultas_clinica_id_foreign` FOREIGN KEY(`clinica_id`) REFERENCES `clinicas`(`id`);
ALTER TABLE
    `clinicas_pacientes` ADD CONSTRAINT `clinicas_pacientes_paciente_id_foreign` FOREIGN KEY(`paciente_id`) REFERENCES `pacientes`(`id`);
ALTER TABLE
    `clinicas_pacientes` ADD CONSTRAINT `clinicas_pacientes_clinica_id_foreign` FOREIGN KEY(`clinica_id`) REFERENCES `clinicas`(`id`);
ALTER TABLE
    `consultas` ADD CONSTRAINT `consultas_paciente_id_foreign` FOREIGN KEY(`paciente_id`) REFERENCES `pacientes`(`id`);
ALTER TABLE
    `clinicas_medicos` ADD CONSTRAINT `clinicas_medicos_medico_id_foreign` FOREIGN KEY(`medico_id`) REFERENCES `medicos`(`id`);
ALTER TABLE
    `consultas` ADD CONSTRAINT `consultas_medico_id_foreign` FOREIGN KEY(`medico_id`) REFERENCES `medicos`(`id`);
ALTER TABLE
    `medicos` ADD CONSTRAINT `medicos_especialidade_id_foreign` FOREIGN KEY(`especialidade_id`) REFERENCES `especialidades`(`id`);
