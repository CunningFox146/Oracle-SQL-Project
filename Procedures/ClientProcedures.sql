CREATE OR REPLACE PACKAGE GamesClientPackage
IS
    PROCEDURE AddOrder(pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY GamesClientPackage
IS
    PROCEDURE AddOrder(pGame Orders.GAME%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        GamesAdminPackage.AddOrder(pGame, pClient, pStaff, pDate);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
END;

commit;