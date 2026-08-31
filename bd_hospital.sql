
CREATE DATABASE hospital2;
USE hospital2;

CREATE TABLE pacientes(
id_pac VARCHAR(8) NOT NULL PRIMARY KEY,
nome_pac VARCHAR(100) NOT NULL,
cpf_pac VARCHAR(11) NOT NULL,
endereco_pac VARCHAR(100) NOT NULL,
idade_pac INT NOT NULL,
contato_pac VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL
);

CREATE TABLE medico(
id_medico VARCHAR(8) NOT NULL PRIMARY KEY,
nome_medico VARCHAR(100) NOT NULL,
cpf_medico VARCHAR(11) NOT NULL,
especializacao_med VARCHAR(100) NOT NULL,
cpf_pac VARCHAR(11) NOT NULL,
id_pac_fk VARCHAR(8) NOT NULL,
CONSTRAINT medico_paciente_fk FOREIGN KEY (id_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE enfermeiros(
id_enfer VARCHAR(8) NOT NULL PRIMARY KEY,
nome_enfer VARCHAR(100) NOT NULL,
cpf_enfer VARCHAR(11) NOT NULL,
cpf_pac_fk VARCHAR(11) NOT NULL,
CONSTRAINT enfermeiros_pacientes_fk FOREIGN KEY (cpf_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE farmaceuticos(
id_farm VARCHAR(8) NOT NULL PRIMARY KEY,
nome_farm VARCHAR(100) NOT NULL,
cpf_farm VARCHAR(11) NOT NULL,
cpf_enfer_fk VARCHAR(11) NOT NULL,
nome_remedio VARCHAR(100) NOT NULL,
CONSTRAINT farmaceuticos_enfemeiros_fk FOREIGN KEY (cpf_enfer_fk)
REFERENCES enfermeiros(id_enfer)
);

CREATE TABLE remedio(
id_remedio VARCHAR(8) NOT NULL PRIMARY KEY,
nome_remedio VARCHAR(100) NOT NULL,
qntd_remedio DECIMAL(4,2) NOT NULL,
dtv_remedio DATE NOT NULL,
horario_remedio TIME NOT NULL,
cpf_pac_fk VARCHAR(11) NOT NULL,
CONSTRAINT remedio_paciente_fk FOREIGN KEY (cpf_pac_fk)
REFERENCES pacientes(id_pac)
);

INSERT INTO pacientes (id_pac, nome_pac, cpf_pac, endereco_pac, idade_pac, contato_pac, data_nasc)
VALUES 
('PAC00001', 'Ana Silva', '12345678901', 'Rua das Flores, 123 - Centro', 29, '(11) 98765-4321', '1996-05-14'),
('PAC00002', 'Carlos Oliveira', '98765432100', 'Av. Brasil, 456 - Jardim América', 41, '(21) 99876-5432', '1984-11-20'),
('PAC00003', 'Mariana Souza', '45678912304', 'Rua das Palmeiras, 89 - Vila Nova', 18, 'mariana.souza@email.com', '2007-02-08'),
('PAC00004', 'Lucas Mendes', '32165498711', 'Rua São Paulo, 702 - Bela Vista', 32, '(31) 99123-4567', '1993-09-12'),
('PAC00005', 'Beatriz Santos', '65498732122', 'Av. Afonso Pena, 1500 - Funcionários', 55, 'beatriz.santos@email.com', '1970-12-03');

INSERT INTO medico (id_medico, nome_medico, cpf_medico, especializacao_med, id_pac_fk)
VALUES 
('MED00001', 'Dr. Roberto Alves', '11122233300', 'Cardiologia', 'PAC00001'),
('MED00002', 'Dra. Juliana Costa', '44455566600', 'Pediatria', 'PAC00002'),
('MED00003', 'Dr. Marcos Prado', '77788899900', 'Ortopedia', 'PAC00003'),
('MED00004', 'Dra. Patricia Lima', '22233344411', 'Dermatologia', 'PAC00004'),
('MED00005', 'Dr. Ricardo Nunes', '55566677722', 'Neurologia', 'PAC00005');

INSERT INTO enfermeiros (id_enfer, nome_enfer, cpf_enfer, cpf_pac_fk)
VALUES 
('ENF00001', 'Fernanda Oliveira', '11133355577', '12345678901'),
('ENF00002', 'Lucas Martins', '22244466688', '98765432100'),
('ENF00003', 'Beatriz Rocha', '33355577799', '45678912304'),
('ENF00004', 'Gabriel Almeida', '44466688800', '32165498711'),
('ENF00005', 'Carla Mendes', '55577799911', '65498732122');

INSERT INTO farmaceuticos (id_farm, nome_farm, cpf_farm, cpf_enfer_fk, nome_remedio)
VALUES 
('FAR00001', 'Juliana Ferreira', '99988877711', '11133355577', 'Dipirona 500mg'),
('FAR00002', 'Thiago Silva', '88877766622', '22244466688', 'Amoxicilina 500mg'),
('FAR00003', 'Vanessa Souza', '77766655533', '33355577799', 'Paracetamol 750mg'),
('FAR00004', 'Rodrigo Castro', '66655544444', '44466688800', 'Ibuprofeno 600mg'),
('FAR00005', 'Camila Duarte', '55544433355', '55577799911', 'Omeprazol 20mg');

INSERT INTO remedios (id_remedio, nome_remedio, qntd_remedio, dtv_remedio, horario_remedio, cpf_pac_fk)
VALUES 
('MED00001', 'Dipirona 500mg', 1.00, '2026-12-31', '08:00:00', '12345678901'),
('MED00002', 'Amoxicilina 500mg', 2.50, '2027-05-15', '14:00:00', '98765432100'),
('MED00003', 'Paracetamol 750mg', 1.00, '2026-10-20', '20:00:00', '45678912304'),
('MED00004', 'Ibuprofeno 600mg', 0.50, '2027-01-10', '06:00:00', '32165498711'),
('MED00005', 'Omeprazol 20mg', 1.00, '2028-03-25', '07:30:00', '65498732122');






