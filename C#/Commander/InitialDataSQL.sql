INSERT INTO Commands VALUES(1,'How to create migrations','dotnet ef migrations add <Name of Migration>','EF Core');
INSERT INTO Commands VALUES(2,'How to run migrations','dotnet ef database update','EF Core');
INSERT INTO Commands VALUES(3,'Show files and directories','ls <Path>','All OSs');
INSERT INTO Commands VALUES(4,'Create a file','touch <File Name>','Linux, MacOS, Windwos');
INSERT INTO Commands VALUES(5,'Create a file','touch <File Name>','Linux, MacOS, Windwos');
INSERT INTO Categories VALUES(1,'Technical');
INSERT INTO Categories VALUES(2,'Kitchen');
INSERT INTO Categories VALUES(3,'School');
INSERT INTO CommandsCategories VALUES(1,1);
INSERT INTO CommandsCategories VALUES(2,1);
INSERT INTO CommandsCategories VALUES(3,1);
INSERT INTO CommandsCategories VALUES(4,2);
INSERT INTO CommandsCategories VALUES(2,2);
INSERT INTO CommandsCategories VALUES(1,3);
INSERT INTO CommandsCategories VALUES(4,3);
INSERT INTO sqlite_sequence VALUES('Commands',6);
INSERT INTO sqlite_sequence VALUES('Categories',3);

--sqlite3 -separator $'\t' -header CommanderDB "SELECT co.line, ca.name from Commands co join CommandsCategories cc on (co.id = cc.commandid) join Categories ca on (ca.id = cc.categoryid)"