CREATE OR REPLACE PROCEDURE RANDOM_DATA(length int) AS
    I INT := 0;
BEGIN
    FOR I IN 1..length LOOP
        GamesAdminPackage.AddGame(
dbms_random.value(1, 4),
        dbms_random.value(1, 4),
        dbms_random.value(1, 4),
        Util.RandomString(50),
        dbms_random.value(1, 1000)
        );
    END LOOP;
END;

BEGIN
    RANDOM_DATA(100000);
end;

SELECT * FROM GAMES;

CREATE INDEX games_idx ON GAMES(ID, SUPPLIER, AUTHOR, GAME_TYPE, NAME, COST) ;
drop index games_idx;