CREATE OR REPLACE PACKAGE GamesAdminPackage
IS
    PROCEDURE AddGame(pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type);
    PROCEDURE RemoveGame(pId Games.ID%type);
    PROCEDURE UpdateGame(pId Games.ID%type, pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type);

    PROCEDURE AddGameType(pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type);
    PROCEDURE RemoveGameType(pId GameTypes.ID%type);
    PROCEDURE UpdateGameType(pId GameTypes.ID%type, pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type);
END;

CREATE OR REPLACE PACKAGE BODY GamesAdminPackage
IS
    PROCEDURE AddGame(pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type) IS
    BEGIN
        INSERT INTO Games(SUPPLIER, AUTHOR, GAME_TYPE, NAME, COST) VALUES (pSupplier, pAuthor, pGameType, pName, pCost);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveGame(pId int) IS
    BEGIN
        DELETE FROM GAMES WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateGame(pId int, pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type) IS
    BEGIN
        UPDATE GAMES SET SUPPLIER = pSupplier, AUTHOR = pAuthor, GAME_TYPE = pGameType, NAME = pName, COST = pCost
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE AddGameType(pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type) IS
    BEGIN
        INSERT INTO GameTypes(NAME, PLAYERS_COUNT) VALUES (pName, pCount);
    END;

    PROCEDURE RemoveGameType(pId GameTypes.ID%type) IS
    BEGIN
        DELETE FROM GameTypes WHERE ID = pId;
    END;

    PROCEDURE UpdateGameType(pId GameTypes.ID%type, pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type) IS
    BEGIN
        UPDATE GameTypes SET NAME = pName, PLAYERS_COUNT = pCount;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
END;


