DECLARE
    I INT := 0;
BEGIN
    FOR I IN 1..10000 LOOP
        GamesAdminPackage.AddGame(
dbms_random.value(1, 4),
        dbms_random.value(1, 4),
        dbms_random.value(1, 4),
        Util.RandomString(50),
        dbms_random.value(1, 1000)
        );
    END LOOP;
END;
SELECT * FROM GAMES;
--SEQ_SCAN (TABLE ACCESS FULL)	 table: GAMES;	19407	109.0	cpu_cost = 7650476, io_cost = 108

CREATE INDEX games_idx ON GAMES(ID, SUPPLIER, AUTHOR, GAME_TYPE, NAME, COST);
--SEQ_SCAN (TABLE ACCESS FULL)	 table: GAMES;	11335	108.0	cpu_cost = 5632476, io_cost = 108