DROP TABLE IF EXISTS Agendamento_Has_Servico;
DROP TABLE IF EXISTS AGENDAMENTO;
DROP TABLE IF EXISTS SERVICO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS USUARIO;

CREATE TABLE USUARIO (
    Login VARCHAR(50) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataNasc DATE NOT NULL,
    EndRua VARCHAR(100) NOT NULL,
    EndNum VARCHAR(10) NOT NULL,
    EndBairro VARCHAR(100) NOT NULL,
    EndCidade VARCHAR(100) NOT NULL,
    EndEstado CHAR(2) NOT NULL,
    EndCEP VARCHAR(10) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Tipo VARCHAR(20) NOT NULL,
    Senha VARCHAR(100) NOT NULL
);

CREATE TABLE CLIENTE (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataNasc DATE NOT NULL,
    EndRua VARCHAR(100) NOT NULL,
    EndNum VARCHAR(10) NOT NULL,
    EndBairro VARCHAR(100) NOT NULL,
    EndCidade VARCHAR(100) NOT NULL,
    EndEstado CHAR(2) NOT NULL,
    EndCEP VARCHAR(10) NOT NULL,
    Telefone VARCHAR(15) NOT NULL
);

CREATE TABLE SERVICO (
    IDServico INT AUTO_INCREMENT PRIMARY KEY,
    NomeServico VARCHAR(150) NOT NULL,
    Descricao TEXT,
    Valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE AGENDAMENTO (
    IDAgendamento INT AUTO_INCREMENT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Cliente_CPF VARCHAR(11) NOT NULL,
    Usuario_Login VARCHAR(50) NOT NULL,
    FOREIGN KEY (Cliente_CPF) REFERENCES CLIENTE(CPF),
    FOREIGN KEY (Usuario_Login) REFERENCES USUARIO(Login)
);

CREATE TABLE Agendamento_Has_Servico (
    Agendamento_IDAgendamento INT NOT NULL,
    Servico_IDServico INT NOT NULL,
    PRIMARY KEY (Agendamento_IDAgendamento, Servico_IDServico),
    FOREIGN KEY (Agendamento_IDAgendamento) REFERENCES AGENDAMENTO(IDAgendamento),
    FOREIGN KEY (Servico_IDServico) REFERENCES SERVICO(IDServico)
);



INSERT INTO USUARIO (Login, Nome, Email, DataNasc, EndRua, EndNum, EndBairro, EndCidade, EndEstado, EndCEP, Telefone, Tipo, Senha) VALUES
('adm_maria', 'Maria Souza', 'maria.adm@corp.com', '1985-05-15', 'Rua Central', '100', 'Centro', 'Cornélio Procópio', 'PR', '86300-000', '4399991111', 'Administrador', 'senha123'),
('func_paulo', 'Paulo Oliveira', 'paulo.oliver@corp.com', '1990-10-20', 'Rua das Rosas', '50', 'Jardim', 'Cornélio Procópio', 'PR', '86300-010', '4399992222', 'Funcionário', 'senha456');

INSERT INTO CLIENTE (CPF, Nome, Email, DataNasc, EndRua, EndNum, EndBairro, EndCidade, EndEstado, EndCEP, Telefone) VALUES
('42445829836', 'João Tonini', 'joao.tonini@gmail.com', '2006-08-25', 'Rua Antônio Mercadante Sobrinho', '558', 'Centro', 'Piraju', 'SP', '18803-022', '14998983990'),
('31378165190', 'João Rolim', 'jpn.rolim@gmail.com', '2007-11-09', 'Rua XV', '45', 'Vila Nova', 'Ibiporã', 'PR', '86015-080', '4396516310'),
('31971924344', 'Otávio Felício', 'tato.felicio@gmail.com', '2006-07-10', 'Av. Goiás', '734', 'Barreirinho', 'Nova Fátima', 'PR', '86310-000', '4396482333');

INSERT INTO SERVICO (NomeServico, Descricao, Valor) VALUES
('Corte Masculino', 'Serviço de corte de cabelo masculino com lavagem.', 35.00),
('Barba Clássica', 'Modelagem e hidratação de barba com toalha quente.', 30.00),
('Design de Sobrancelha', 'Modelagem de sobrancelhas com pinça.', 20.00);

INSERT INTO AGENDAMENTO (DataHora, Status, Cliente_CPF, Usuario_Login) VALUES
('2024-12-10 10:00:00', 'ativo', '42445829836', 'func_paulo'),
('2024-11-20 14:30:00', 'concluído', '31378165190', 'func_paulo'),
('2024-12-15 17:00:00', 'cancelado', '31971924344', 'adm_maria');

INSERT INTO Agendamento_Has_Servico (Agendamento_IDAgendamento, Servico_IDServico) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);