-- Schema mydb
USE `mydb` ;
--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

INSERT INTO `admin`
    (`email`, `password`)
    VALUES 
        ("admin@gmail.com","admin")
    ;

INSERT INTO `utilizador`
    (`email`, `nome`, `password`, `nivel`, `login`, `imagemURL`)
    VALUES 
        ("armando@gmail.com","Armando","123","0",false,"./images/InitialAvatar.png"),
        ("joana@gmail.com","Joana","12345","2", false,"./images/InitialAvatar.png"),
        ("andre@gmail.com","Andre","1234","4", false,"./images/InitialAvatar.png")
    ;
    
INSERT INTO `rota`
    (`nome`) 
    VALUES 
        ("Rota do Centro"),
        ("Rota Gualtar")
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
    (`nome`, `descricao`, `cidade`, `coordenadas`,`imagemURL`,`valido`) 
    VALUES 
        ("Prometeu","Uma estatua","Braga","41.559550978259956, -8.397245077052588","https://lh5.googleusercontent.com/p/AF1QipN4ZWGRZsrtbu_8C4I2tu-wW7-MUFuAcxleBCWW=w408-h544-k-no",1),
        ("Sameiro","Uma igreja","Braga","41.54228249141272, -8.367789523533432","https://lh5.googleusercontent.com/p/AF1QipMDJf4W7B1f4oi1oO3vX0zjVlQkBD7Qyy2NUel1=w408-h306-k-no",1),
        ("Bom Jesus","Um edificio com um comboio","Braga","41.555631223306015, -8.374821777940548","https://lh5.googleusercontent.com/p/AF1QipOi12zzLARNlQyYNg7-EGcsitA1r4ffm4DrAaxt=w408-h306-k-no",1),
        ("Carrinha de Gualtar","Wtf uma carrinha!","Braga","41.571004867707636, -8.375128305346506","https://lh5.googleusercontent.com/p/AF1QipNRoR9impCW5wGh12s-4Y7yJe7H7hJbsnz9Lq7d=w408-h544-k-no",1),
        ("Termas Romanas","Umas pedras antigas","Braga","41.546880618677335, -8.42640991437258","https://lh5.googleusercontent.com/p/AF1QipMPxRGPfS-RAX9MpbMhMuh138PqF2U53KtuePsS=w426-h240-k-no",1),
        ("Sé de Braga","Catedral bonita","Braga","41.55064540150164, -8.425433760040862","https://lh5.googleusercontent.com/p/AF1QipOrNJ_1zCVAZuq9ABjUm-tp_Pz7JC9Ps5YGx5bD=w408-h306-k-no",0)
    ;


INSERT INTO `utilizador_hasfavorite_pontointeresse`
    (`Utilizador_email`, `PontoInteresse_nome`) 
    VALUES 
        ("armando@gmail.com","Carrinha de Gualtar"),
        ("joana@gmail.com","Bom Jesus"),
        ("armando@gmail.com","Sameiro")
    ;

INSERT INTO `utilizador_hassugestao_pontointeresse`
    (`Utilizador_email`, `PontoInteresse_nome`) 
    VALUES 
        ("armando@gmail.com","Carrinha de Gualtar")
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
    (`idCategoria`, `descricao`) 
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
