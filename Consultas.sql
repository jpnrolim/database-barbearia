-- João Felipe Pansanato Tonini - RA: 2768399
-- João Pedro Nascimento Rolim - RA: 2768402

-- 1
SELECT
    Nome,
    Email,
    CONCAT(EndRua, ', ', EndNum, ' - ', EndBairro, ' - ', EndCidade, '/', EndEstado, ' - CEP: ', EndCEP) AS Endereço
FROM
    CLIENTE;

-- 2
SELECT
    CLIENTE.Nome,
    CLIENTE.Email,
    SERVICO.NomeServico,
    SERVICO.Descricao
FROM
    CLIENTE
JOIN
    AGENDAMENTO ON CLIENTE.CPF = AGENDAMENTO.Cliente_CPF
JOIN
    Agendamento_Has_Servico ON AGENDAMENTO.IDAgendamento = Agendamento_Has_Servico.Agendamento_IDAgendamento
JOIN
    SERVICO ON Agendamento_Has_Servico.Servico_IDServico = SERVICO.IDServico
WHERE
    AGENDAMENTO.Status = 'cancelado';

-- 3
SELECT
    AGENDAMENTO.DataHora,
    SERVICO.Descricao
FROM
    AGENDAMENTO
JOIN
    Agendamento_Has_Servico ON AGENDAMENTO.IDAgendamento = Agendamento_Has_Servico.Agendamento_IDAgendamento
JOIN
    SERVICO ON Agendamento_Has_Servico.Servico_IDServico = SERVICO.IDServico
WHERE
    AGENDAMENTO.Status = 'ativo'
    AND MONTH(AGENDAMENTO.DataHora) = 12
    AND YEAR(AGENDAMENTO.DataHora) = 2024
ORDER BY
    AGENDAMENTO.DataHora;

-- 4
SELECT
    AGENDAMENTO.DataHora,
    AGENDAMENTO.Status,
    SERVICO.NomeServico,
    CLIENTE.Nome
FROM
    AGENDAMENTO
JOIN
    USUARIO ON AGENDAMENTO.Usuario_Login = USUARIO.Login
JOIN
    CLIENTE ON AGENDAMENTO.Cliente_CPF = CLIENTE.CPF
JOIN
    Agendamento_Has_Servico ON AGENDAMENTO.IDAgendamento = Agendamento_Has_Servico.Agendamento_IDAgendamento
JOIN
    SERVICO ON Agendamento_Has_Servico.Servico_IDServico = SERVICO.IDServico
WHERE
    USUARIO.Nome = 'Paulo Oliveira'
ORDER BY
    AGENDAMENTO.DataHora;

-- 5
SELECT
    CLIENTE.Nome,
    CLIENTE.DataNasc,
    CONCAT(CLIENTE.EndRua, ', ', CLIENTE.EndNum, ' - ', CLIENTE.EndBairro, ' - ', CLIENTE.EndCidade, '/', CLIENTE.EndEstado) AS Endereço
FROM
    CLIENTE
JOIN
    AGENDAMENTO ON CLIENTE.CPF = AGENDAMENTO.Cliente_CPF
JOIN
    Agendamento_Has_Servico ON AGENDAMENTO.IDAgendamento = Agendamento_Has_Servico.Agendamento_IDAgendamento
JOIN
    SERVICO ON Agendamento_Has_Servico.Servico_IDServico = SERVICO.IDServico
WHERE
    AGENDAMENTO.Status = 'concluído'
    AND SERVICO.NomeServico = 'Corte Masculino'
ORDER BY
    CLIENTE.Nome;