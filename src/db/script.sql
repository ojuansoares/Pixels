DROP DATABASE IF EXISTS pixels;
CREATE DATABASE IF NOT EXISTS pixels;
USE pixels;



CREATE TABLE IF NOT EXISTS usuario(
    user_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    user_type INT NOT NULL DEFAULT '1',
    user_photo VARCHAR(255),
    user_dn DATE NOT NULL,
    user_cpf VARCHAR(11) NOT NULL,
    user_grau_parentesco VARCHAR(50) NOT NULL,
    user_profissao VARCHAR(100) NOT NULL,
    user_como_chegou VARCHAR(100) NOT NULL,
    endereco_id BIGINT
);

CREATE TABLE IF NOT EXISTS endereco(
    endereco_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    user_id BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS post(
    post_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(255) NOT NULL,
    post_content TEXT NOT NULL,
    post_date DATE NOT NULL,
    post_img BLOB,
    post_status BOOLEAN DEFAULT FALSE,
    post_category VARCHAR(200) NOT NULL,
    user_id BIGINT NOT NULL
);



CREATE TABLE IF NOT EXISTS comentario(
    com_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    com_title VARCHAR(255) NOT NULL,
    com_content TEXT NOT NULL,
    com_date DATE NOT NULL,
    post_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
);


ALTER TABLE comentario ADD (
    FOREIGN KEY (user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id)
);

ALTER TABLE usuario ADD (
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);

ALTER TABLE post ADD (
    FOREIGN KEY (user_id) REFERENCES usuario(user_id)
);

ALTER Table endereco ADD (
    FOREIGN KEY (user_id) REFERENCES usuario(user_id)
);