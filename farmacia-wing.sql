CREATE DATABASE db_farmacia_bem_estar;                     -- criou o banco
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (                               -- criar tabela
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias (nome, descricao) VALUES                      -- inserir registros
('Medicamentos', 'Produtos farmacêuticos para tratamentos de saúde.'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais.'),
('Suplementos', 'Produtos nutricionais e vitaminas.'),
('Higiene', 'Produtos para higiene pessoal e limpeza.'),
('Infantil', 'Produtos para cuidados infantis.');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (                      -- criou a tabela produtos
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, descricao, preco, estoque, categoria_id) VALUES               -- inserir 8 registros de produtos
('Paracetamol', 'Analgésico e antipirético', 15.00, 100, 1),
('Shampoo Anticaspa', 'Shampoo para controle de caspa', 25.50, 50, 2),
('Vitamina C', 'Suplemento de vitamina C', 30.00, 200, 3),
('Creme Dental', 'Creme dental para higiene bucal', 8.00, 300, 4),
('Fralda Infantil', 'Fralda para bebês', 35.00, 150, 5),
('Protetor Solar', 'Protetor solar FPS 50', 70.00, 80, 2),
('Ibuprofeno', 'Anti-inflamatório e analgésico', 20.00, 120, 1),
('Sabonete Líquido', 'Sabonete líquido para higiene pessoal', 12.00, 250, 4);


SELECT * FROM tb_produtos WHERE preco > 50.00;                                 -- mostra valores que sejam maior do que R$ 50,00


SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;               -- mostra valores esteja entre R$ 5,00 e R$ 60,00

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';                           -- Consulta produtos que possuam a letra C no atributo nome


SELECT p.id, p.nome, p.descricao, p.preco, p.estoque, c.nome AS categoria_nome      -- Une os dados da tabela tb_produtos com os dados da tabela tb_categorias
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;


SELECT p.id, p.nome, p.descricao, p.preco, p.estoque, c.nome AS categoria_nome        -- traz apenas os produtos que pertençam a categoria 'Cosméticos'
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos';