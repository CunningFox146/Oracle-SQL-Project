CREATE OR REPLACE PACKAGE GamesAdminPackage
IS
    PROCEDURE AddGame(pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type);
    PROCEDURE RemoveGame(pId Games.ID%type);
    PROCEDURE UpdateGame(pId Games.ID%type, pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type);

    PROCEDURE AddGameType(pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type);
    PROCEDURE RemoveGameType(pId GameTypes.ID%type);
    PROCEDURE UpdateGameType(pId GameTypes.ID%type, pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type);

    PROCEDURE AddAuthor(pName Authors.NAME%TYPE, pPhone Authors.PHONE_NUMBER%TYPE, pAddress Authors.ADDRESS%TYPE);
    PROCEDURE RemoveAuthor(pId Authors.ID%TYPE);
    PROCEDURE UpdateAuthor(pId Authors.ID%TYPE, pName Authors.NAME%TYPE, pPhone Authors.PHONE_NUMBER%TYPE, pAddress Authors.ADDRESS%TYPE);

    PROCEDURE AddSupplier(pName Suppliers.NAME%TYPE, pAddress Suppliers.ADDRESS%TYPE, pPhone Suppliers.PHONE_NUMBER%TYPE);
    PROCEDURE RemoveGameType(pId Suppliers.ID%TYPE);
    PROCEDURE UpdateSupplier(pId Suppliers.ID%TYPE, pName Suppliers.NAME%TYPE, pAddress Suppliers.ADDRESS%TYPE, pPhone Suppliers.PHONE_NUMBER%TYPE);

    PROCEDURE AddOrder(pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);
    PROCEDURE RemoveOrder(pId Orders.ID%TYPE);
    PROCEDURE UpdateOrder(pId Orders.ID%TYPE, pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);

    PROCEDURE AddClient(pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE);
    PROCEDURE RemoveClient(pId Clients.ID%TYPE);
    PROCEDURE UpdateClient(pId Clients.ID%TYPE, pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE);

    PROCEDURE AddStaff(pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE);
    PROCEDURE RemoveStaff(pId Staff.ID%TYPE);
    PROCEDURE UpdateStaff(pId Staff.ID%TYPE, pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE);

    PROCEDURE AddPosition(pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE);
    PROCEDURE RemovePosition(pId Positions.ID%TYPE);
    PROCEDURE AddPosition(pId Positions.ID%TYPE, pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY GamesAdminPackage
IS
    PROCEDURE AddGame(pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type) IS
    BEGIN
        INSERT INTO Games(SUPPLIER, AUTHOR, GAME_TYPE, NAME, COST) VALUES (pSupplier, pAuthor, pGameType, pName, pCost);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveGame(pId Games.ID%type) IS
    BEGIN
        DELETE FROM GAMES WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateGame(pId Games.ID%type, pSupplier Games.SUPPLIER%type, pAuthor Games.AUTHOR%type, pGameType Games.GAME_TYPE%type, pName Games.NAME%type, pCost Games.COST%type) IS
    BEGIN
        UPDATE GAMES SET SUPPLIER = pSupplier, AUTHOR = pAuthor, GAME_TYPE = pGameType, NAME = pName, COST = pCost
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddGameType(pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type) IS
    BEGIN
        INSERT INTO GameTypes(NAME, PLAYERS_COUNT) VALUES (pName, pCount);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveGameType(pId GameTypes.ID%type) IS
    BEGIN
        DELETE FROM GameTypes WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateGameType(pId GameTypes.ID%type, pName GameTypes.NAME%Type, pCount GAMETYPES.PLAYERS_COUNT%Type) IS
    BEGIN
        UPDATE GameTypes SET NAME = pName, PLAYERS_COUNT = pCount
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddAuthor(pName Authors.NAME%TYPE, pPhone Authors.PHONE_NUMBER%TYPE, pAddress Authors.ADDRESS%TYPE) IS
    BEGIN
        INSERT INTO Authors(NAME, PHONE_NUMBER, ADDRESS) VALUES (pName, pPhone, pAddress);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveAuthor(pId Authors.ID%TYPE) IS
    BEGIN
        DELETE FROM Authors WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateAuthor(pId Authors.ID%TYPE, pName Authors.NAME%TYPE, pPhone Authors.PHONE_NUMBER%TYPE, pAddress Authors.ADDRESS%TYPE) IS
    BEGIN
        UPDATE Authors SET NAME = pName, ADDRESS = pAddress, PHONE_NUMBER = pPhone
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddSupplier(pName Suppliers.NAME%TYPE, pAddress Suppliers.ADDRESS%TYPE, pPhone Suppliers.PHONE_NUMBER%TYPE) IS
    BEGIN
        INSERT INTO Suppliers(NAME, ADDRESS, PHONE_NUMBER) VALUES (pName, pAddress, pPhone);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveGameType(pId Suppliers.ID%TYPE) IS
    BEGIN
        DELETE FROM Suppliers WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE UpdateSupplier(pId Suppliers.ID%TYPE, pName Suppliers.NAME%TYPE, pAddress Suppliers.ADDRESS%TYPE, pPhone Suppliers.PHONE_NUMBER%TYPE) IS
    BEGIN
        UPDATE Suppliers SET NAME = pName, ADDRESS = pAddress, PHONE_NUMBER = pPhone
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddOrder(pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        INSERT INTO Orders(GAME, CLIENT, STAFF, ORDER_DATE) VALUES (pGame, pClient, pStaff, pDate);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveOrder(pId Orders.ID%TYPE) IS
    BEGIN
        DELETE FROM Orders WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateOrder(pId Orders.ID%TYPE, pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        UPDATE Orders SET GAME = pGame, CLIENT = pClient, STAFF = pStaff, ORDER_DATE = pDate
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddClient(pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE) IS
    BEGIN
        INSERT INTO Clients (NAME, ADDRESS, PHONE_NUMBER, LOGIN, PASSWORD) VALUES (pName, pAddress, pPhone, pLogin, pPassword);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE RemoveClient(pId Clients.ID%TYPE) IS
    BEGIN
        DELETE FROM Clients WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE UpdateClient(pId Clients.ID%TYPE, pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE) IS
    BEGIN
        UPDATE Clients SET NAME = pName, ADDRESS = pAddress, PHONE_NUMBER = pPhone, LOGIN = pLogin, PASSWORD = pPassword
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddStaff(pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE) IS
    BEGIN
        INSERT INTO Staff(POSITION, PHONE_NUMBER, NAME) VALUES (pPosition, pPhone, pName);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveStaff(pId Staff.ID%TYPE) IS
    BEGIN
        DELETE FROM Staff WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateStaff(pId Staff.ID%TYPE, pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE) IS
    BEGIN
        UPDATE Staff SET POSITION = pPosition, PHONE_NUMBER = pPhone, NAME = pName
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE AddPosition(pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE) AS
    BEGIN
        INSERT INTO Positions(NAME, SALARY) VALUES (pName, pSalary);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemovePosition(pId Positions.ID%TYPE) AS
    BEGIN
        DELETE FROM Positions WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE AddPosition(pId Positions.ID%TYPE, pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE) AS
    BEGIN
        UPDATE Positions SET NAME = pName, SALARY = pSalary
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

END;

