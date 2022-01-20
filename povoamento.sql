-- Schema hermestravel
USE `hermestravel` ;
--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

INSERT INTO `utilizador`
    (`email`, `nome`, `password`, `nivel`, `login`)
    VALUES 
        ("armando@gmail.com","Armando","123","0",false),
        ("joana@gmail.com","Joana","12345","2", false),
        ("andre@gmail.com","Andre","1234","4", false)
    ;
    
INSERT INTO `rota`
    (`nome`) 
    VALUES 
        ("Rota do Centro"),
        ("Rota Gualtar"])
    ;

INSERT INTO `utilizador_hashistorico_rota`
    (`Utilizador_email`, `Rota_nome`) 
    VALUES 
        ("armando@gmail.com","Rota Gualtar")
    ;

INSERT INTO `utilizador_has_utilizador`
    (`Utilizador_email`, `Utilizador_email1`) 
    VALUES 
        ("armando@gmail.com","joana@gmail.com")
    ;

INSERT INTO `pontointeresse`
    (`nome`, `descricao`, `cidade`, `coordenadas`) 
    VALUES 
        ("Prometeu","Uma estatua","Braga","41.559550978259956, -8.397245077052588"),
        ("Sameiro","Uma igreja","Braga","41.54228249141272, -8.367789523533432"),
        ("Bom Jesus","Um edificio com um comboio","Braga","41.555631223306015, -8.374821777940548"),
        ("Carrinha de Gualtar","Wtf uma carrinha!","Braga","41.571004867707636, -8.375128305346506"),
        ("Termas Romanas","Umas pedras antigas","Braga","41.546880618677335, -8.42640991437258")
    ;

INSERT INTO `utilizador_hasfavorite_pontointeresse`
    (`Utilizador_email`, `PontoInteresse_nome`) 
    VALUES 
        ("armando@gmail.com","Carrinha de Gualtar"),
        ("joana@gmail.com","Bom Jesus"),
        ("armando@gmail.com","Sameiro")
    ;

INSERT INTO `rota_has_pontointeresse`
    (`Rota_nome`, `PontoInteresse_nome`) 
    VALUES 
        ("Rota Gualtar","Carrinha de Gualtar"),
        ("Rota Gualtar","Bom Jesus"),
        ("Rota Gualtar","Sameiro"),
        ("Rota do Centro","Termas Romanas")
    ;

INSERT INTO `categoria`
    (`idCategoria`, `Descricao`) 
    VALUES 
        (1,"Historico"),
        (2,"Religiao"),
        (3,"Cultural")
    ;

INSERT INTO `pontointeresse_has_categoria`
    (`PontoInteresse_nome`, `Categoria_idCategoria`) 
    VALUES 
        ("Carrinha de Gualtar",3),
        ("Bom Jesus",2),
        ("Sameiro",2)
    ;

INSERT INTO `avaliacao`
    (`idAvaliacao`, `avaliacao`, `descricao`, `PontoInteresse_nome`, `Utilizador_email`) 
    VALUES 
        (1,5,"Bom lugar para um piquenique.","Carrinha de Gualtar","armando@gmail.com"),
        (2,4,"Muitas escadas, dificil acesso!","Bom Jesus","joana@gmail.com")
    ;
