CREATE OR REPLACE PACKAGE Util
IS
    FUNCTION RandomString(length int) RETURN VARCHAR2;
    FUNCTION RandomChar RETURN CHAR;

    PROCEDURE GetPositionByName(pName Positions.NAME%TYPE, outId OUT Positions.ID%TYPE);
    PROCEDURE GetGameTypeByName(pName GameTypes.NAME%TYPE, outId OUT GameTypes.ID%TYPE);
    PROCEDURE GetAuthorByName(pName Authors.NAME%TYPE, outId OUT Authors.ID%TYPE);
    PROCEDURE GetSupplierByName(pName Suppliers.NAME%TYPE, outId OUT Suppliers.ID%TYPE);
    PROCEDURE GetGameByName(pName Games.NAME%TYPE, outId OUT Games.ID%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY Util
IS
    PROCEDURE GetPositionByName(pName Positions.NAME%TYPE, outId OUT Positions.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Positions WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetGameTypeByName(pName GameTypes.NAME%TYPE, outId OUT GameTypes.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM GameTypes WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetAuthorByName(pName Authors.NAME%TYPE, outId OUT Authors.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Authors WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetSupplierByName(pName Suppliers.NAME%TYPE, outId OUT Suppliers.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Suppliers WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetGameByName(pName Games.NAME%TYPE, outId OUT Games.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Games WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    FUNCTION RandomChar RETURN CHAR IS
    BEGIN
        RETURN chr(dbms_random.value(65, 90));
    END;

    FUNCTION RandomString(length int) RETURN VARCHAR2 IS
        OUTPUT VARCHAR2(50);
    BEGIN
        FOR I IN 1..length LOOP
            OUTPUT := OUTPUT || RandomChar();
        END LOOP;
        RETURN OUTPUT;
    END;
END;
