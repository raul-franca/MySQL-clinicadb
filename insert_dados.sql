
-- Inserir dados de Clinicas
INSERT INTO `clinicas` (cnpj, nome, telefone, email, logradouro, bairro, cep, numero, complemento, cidade, uf, ativo)
VALUES
('00.000.000/0001-00', 'Clínica A', '11988887777', 'contato@clinicaa.com', 'Rua A', 'Bairro A', '12345-678', '100', 'Sala 1', 'São Paulo', 'SP', 1),
('11.111.111/0001-11', 'Clínica B', '11999990000', 'contato@clinicab.com', 'Av B', 'Bairro B', '87654-321', '200', NULL, 'Rio de Janeiro', 'RJ', 1);

-- Inserir dados de Clinica Customização
INSERT INTO `clinica_customizacao` (clinicas_id, logo, nome)
VALUES
(1, 'logo_clinica_a.png', 'Clínica A - Customização'),
(2, 'logo_clinica_b.png', 'Clínica B - Customização');

-- Inserir dados de Especialidades
INSERT INTO `especialidades` (especialidade, ativo)
VALUES
('Cardiologia', 1),
('Pediatria', 1);

-- Inserir dados de Pacientes
-- Usaremos CPFs formatados com pontos e traço (14 caracteres), assim como definido no CHAR(14)
INSERT INTO `pacientes` (nome, cpf, telefone, email, logradouro, bairro, cep, numero, complemento, cidade, uf, ativo)
VALUES
('José da Silva',     '111.222.333-44', '(11)99999-1111', 'jose.silva@email.com', 'Rua C', 'Bairro C', '12345-111', '10', NULL, 'São Paulo', 'SP', 1),
('Maria Oliveira',    '222.333.444-55', '(11)99999-2222', 'maria.oliveira@email.com', 'Rua D', 'Bairro D', '12345-222', '20', 'Apto 101', 'São Paulo', 'SP', 1),
('João Pereira',      '333.444.555-66', '(21)99999-3333', 'joao.pereira@email.com', 'Rua E', 'Bairro E', '12345-333', '30', NULL, 'Rio de Janeiro', 'RJ', 1),
('Ana Santos',        '444.555.666-77', '(21)99999-4444', 'ana.santos@email.com', 'Rua F', 'Bairro F', '12345-444', '40', NULL, 'Rio de Janeiro', 'RJ', 1);

-- Associar pacientes às clínicas
INSERT INTO `clinicas_pacientes` (paciente_id, clinica_id, ativo)
VALUES
(1, 1, 1), -- José da Silva na Clínica A
(2, 1, 1), -- Maria Oliveira na Clínica A
(3, 2, 1), -- João Pereira na Clínica B
(4, 2, 1); -- Ana Santos na Clínica B

-- Inserir dados de Médicos
-- CRM com 7 caracteres: iremos usar '0000001', etc.
INSERT INTO `medicos` (nome, telefone, email, crm, especialidade_id, logradouro, bairro, cep, complemento, numero, uf, cidade, ativo)
VALUES
('Dr. João', '(11)99999-5555', 'joao@medico.com', '0000001', 1, 'Rua Medica 1', 'Bairro Med', '12345-999', NULL, '101', 'SP', 'São Paulo', 1),
('Dra. Maria', '(11)99999-6666', 'maria@medico.com', '0000002', 1, 'Rua Medica 2', 'Bairro Med', '12345-999', NULL, '102', 'SP', 'São Paulo', 1),
('Dr. Carlos', '(21)99999-7777', 'carlos@medico.com', '0000003', 2, 'Rua Medica 3', 'Bairro Med2', '12345-888', 'Casa', '103', 'RJ', 'Rio de Janeiro', 1),
('Dra. Ana', '(21)99999-8888', 'ana@medico.com', '0000004', 2, 'Rua Medica 4', 'Bairro Med2', '12345-888', 'Apto 2', '104', 'RJ', 'Rio de Janeiro', 1);

-- Associar médicos às clínicas
INSERT INTO `clinicas_medicos` (clinica_id, medico_id, ativo)
VALUES
(1, 1, 1), -- Dr. João atende na Clínica A
(1, 2, 1), -- Dra. Maria atende na Clínica A
(2, 3, 1), -- Dr. Carlos atende na Clínica B
(2, 4, 1); -- Dra. Ana atende na Clínica B

-- Inserir alguns usuários
INSERT INTO `usuarios` (clinica_id, nome, email, senha, ativo)
VALUES
(1, 'Admin A', 'admin.a@clinicaa.com', 'senha-hash-a', 1),
(2, 'Admin B', 'admin.b@clinicab.com', 'senha-hash-b', 1);

-- Inserir dados de Consultas
-- Formato DATETIME: 'YYYY-MM-DD HH:MM:SS'
-- Criaremos consultas em datas diferentes para ter períodos e filtragens
INSERT INTO `consultas` (medico_id, paciente_id, clinica_id, data)
VALUES
-- Clínica A
(1, 1, 1, '2024-12-21 10:00:00'), -- Dr. João com José da Silva na Clínica A
(2, 2, 1, '2024-12-22 14:00:00'), -- Dra. Maria com Maria Oliveira na Clínica A

-- Clínica B
(3, 3, 2, '2024-12-21 09:00:00'), -- Dr. Carlos com João Pereira na Clínica B
(4, 4, 2, '2024-12-22 16:00:00'); -- Dra. Ana com Ana Santos na Clínica B