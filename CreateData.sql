BEGIN
    GamesAdminPackage.AddPosition('Junior', 500);
    GamesAdminPackage.AddPosition('Middle', 1500);
    GamesAdminPackage.AddPosition('Senior', 4000);
END;
SELECT * FROM Positions;

DECLARE
    JUN Positions.ID%TYPE;
    MID Positions.ID%TYPE;
    SEN Positions.ID%TYPE;
BEGIN
    Util.GETPOSITIONBYNAME('Junior', JUN);
    Util.GETPOSITIONBYNAME('Middle', MID);
    Util.GETPOSITIONBYNAME('Senior', SEN);

    GamesAdminPackage.AddStaff( JUN, '123', 'Narval');
    GamesAdminPackage.AddStaff( MID, '321', 'Kel');
    GamesAdminPackage.AddStaff( SEN, '321', 'JK');
END;
SELECT * FROM STAFF;

BEGIN
    GamesAdminPackage.AddGameType('Family friendly', 7);
    GamesAdminPackage.AddGameType('Two', 2);
    GamesAdminPackage.AddGameType('Party', 15);
    GamesAdminPackage.AddGameType('Lonely', 1);
end;
SELECT * FROM GAMETYPES;

BEGIN
   GamesAdminPackage.AddAuthor('Kol', '+385892', 'Cool street');
   GamesAdminPackage.AddAuthor('La', '+3851235892', 'Not cool street');
   GamesAdminPackage.AddAuthor('Rel', '+55385892', 'some street');
   GamesAdminPackage.AddAuthor('mmAa', '+8385892', 'mediocre street');
END;
SELECT * FROM AUTHORS;

BEGIN
   GamesAdminPackage.AddSupplier('Ka', '+12592', 'Meh street');
   GamesAdminPackage.AddSupplier('Las', '+45892', 'Wow street');
   GamesAdminPackage.AddSupplier('mvs', '+78865', 'Idk');
   GamesAdminPackage.AddSupplier('UUR', '+346346', 'Hello');
END;
SELECT * FROM SUPPLIERS;

BEGIN
    GamesAdminPackage.AddGame(1, 1, 1, 'Munchkin', 10);
    GamesAdminPackage.AddGame(2, 2, 5, 'Piggy pack', 15);
    GamesAdminPackage.AddGame(3, 3, 6, 'Smash or pass', 7);
    GamesAdminPackage.AddGame(4, 3, 7, 'Emotional damage', 8);
    GamesAdminPackage.AddGame(2, 4, 8, 'Wowza(TM)', 6);
end;
SELECT * FROM GAMES;

BEGIN


END;