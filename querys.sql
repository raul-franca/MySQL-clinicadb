--  Listar todos os pacientes de uma clínica

    SELECT p.* FROM pacientes p
    JOIN clinicas_pacientes cp ON cp.paciente_id = p.id
    WHERE cp.clinica_id = 1
    order by p.nome;

--  Listar todos os médicos de uma clínica

    SELECT m.* FROM medicos m
    JOIN clinicas_medicos cm ON cm.medico_id = m.id
    WHERE cm.clinica_id = 2;

--  Listar todas as consultas de uma clínica

    SELECT e.especialidade, m.nome, m.crm, DATE_FORMAT(c.data, '%d/%m/%Y') as data,
           TIME_FORMAT(c.data, '%H:%i') as hora
        FROM consultas c
    JOIN pacientes p ON c.paciente_id = p.id
    JOIN medicos m ON c.medico_id = m.id
    JOIN especialidades e ON m.especialidade_id = e.id
    WHERE c.clinica_id = 1;

--  Listar todos os médicos de uma especialidade

    SELECT e.especialidade, m.nome, m.crm, m.telefone
    FROM medicos m
    JOIN especialidades e ON m.especialidade_id = e.id
    WHERE e.id = 1;

--  Listar todas as consultas de um médico

    SELECT e.especialidade, m.nome, m.crm, DATE_FORMAT(c.data, '%d/%m/%Y') as data,
           TIME_FORMAT(c.data, '%H:%i') as hora
    FROM consultas c
    JOIN medicos m ON c.medico_id = m.id
    JOIN especialidades e ON m.especialidade_id = e.id
    WHERE c.medico_id = 1 AND m.ativo = 1;

--  Listar todos os pacientes de um médico

    SELECT DISTINCT p.* -- DISTINCT para não repetir pacientes
    FROM pacientes p
    JOIN consultas co ON co.paciente_id = p.id
    WHERE co.medico_id = 1;

-- Listar todas as consultas de um paciente

    SELECT   p.nome as paciente , m.nome as medico , m.crm, e.especialidade,
             DATE_FORMAT(c.data, '%d/%m/%Y') as data,
           TIME_FORMAT(c.data, '%H:%i') as hora
        FROM consultas c
    JOIN pacientes p ON c.paciente_id = p.id
    JOIN medicos m ON c.medico_id = m.id
    JOIN especialidades e ON m.especialidade_id = e.id
    WHERE c.paciente_id = 1;


-- Listar todas as consultas de um paciente em uma clínica

    SELECT p.nome as paciente , m.nome as medico , m.crm,
             DATE_FORMAT(c.data, '%d/%m/%Y') as data,
           TIME_FORMAT(c.data, '%H:%i') as hora
        FROM consultas c
    JOIN pacientes p ON c.paciente_id = p.id
    JOIN medicos m ON c.medico_id = m.id
    WHERE c.paciente_id = 1 AND c.clinica_id = 1;

--  Listar todas as consultas de um médico em uma clínica

SELECT m.nome as medico , m.crm, DATE_FORMAT(c.data, '%d/%m/%Y') as data,
           TIME_FORMAT(c.data, '%H:%i') as hora
    FROM consultas c
    JOIN medicos m ON c.medico_id = m.id
    JOIN especialidades e ON m.especialidade_id = e.id
WHERE c.medico_id = 3 AND c.clinica_id = 2 AND m.ativo = 1;

--  Listar todos os médicos de uma clínica que atendem uma determinada especialidade

    SELECT e.especialidade, m.*
    FROM medicos m
    JOIN clinicas_medicos cm ON m.id = cm.medico_id
    JOIN especialidades e ON m.especialidade_id = e.id
    WHERE cm.clinica_id = 1 AND m.especialidade_id = 1;

--  Listar todos os pacientes de uma clínica que possuem consultas marcadas

    SELECT DISTINCT p.*
    FROM pacientes p
    JOIN clinicas_pacientes cp ON cp.paciente_id = p.id
    JOIN consultas c ON c.paciente_id = p.id
    WHERE cp.clinica_id = 1;

-- Listar todos os médicos de uma clínica que possuem consultas marcadas

    SELECT DISTINCT m.*
    FROM medicos m
    JOIN clinicas_medicos cm ON cm.medico_id = m.id
    JOIN consultas c ON c.medico_id = m.id
    WHERE cm.clinica_id = 1;

--  Listar todas as consultas de uma clínica que possuem pacientes

    SELECT c.*
    FROM consultas c
    JOIN pacientes p ON c.paciente_id = p.id

    WHERE c.clinica_id = 2;

--  Listar todas as consultas de uma clínica que possuem médicos

    SELECT c.*
    FROM consultas c
    JOIN medicos m ON c.medico_id = m.id
    WHERE c.clinica_id = 1;
--  Listar todas as consultas de uma clínica em uma determinada data

    SELECT c.*
    FROM consultas c
    WHERE c.clinica_id = 1
      AND DATE(c.data) = '2024-12-01';

--  Listar todas as consultas de uma clínica em um determinado período

    SELECT c.*
    FROM consultas c
    WHERE c.clinica_id = 2
      AND c.data BETWEEN '2024-12-01' AND '2024-12-31';

--  Listar todas as consultas de uma clínica em um determinado período de um médico

    SELECT c.*
    FROM consultas c
    WHERE c.clinica_id = 1
      AND c.medico_id = 1
      AND c.data BETWEEN '2024-12-01' AND '2024-12-31';


