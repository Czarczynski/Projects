CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Categories" (
    "CategoryId" INTEGER NOT NULL CONSTRAINT "PK_Categories" PRIMARY KEY AUTOINCREMENT,
    "Category" TEXT NOT NULL,
    "PhotoPath" TEXT NULL
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "Tags" (
    "TagId" INTEGER NOT NULL CONSTRAINT "PK_Tags" PRIMARY KEY AUTOINCREMENT,
    "Tag" TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Voivodeships" (
    "VoivodeshipId" INTEGER NOT NULL CONSTRAINT "PK_Voivodeships" PRIMARY KEY AUTOINCREMENT,
    "Voivodeship" TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Cities" (
    "CityId" INTEGER NOT NULL CONSTRAINT "PK_Cities" PRIMARY KEY AUTOINCREMENT,
    "City" TEXT NOT NULL,
    "VoivodeshipId" INTEGER NOT NULL,
    CONSTRAINT "FK_Cities_Voivodeships_VoivodeshipId" FOREIGN KEY ("VoivodeshipId") REFERENCES "Voivodeships" ("VoivodeshipId") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Users" (
    "UserId" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
    "Email" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Surname" TEXT NOT NULL,
    "PhotoPath" TEXT NULL,
    "CityId" INTEGER NOT NULL,
    "Birthday" TEXT NOT NULL,
    CONSTRAINT "FK_Users_Cities_CityId" FOREIGN KEY ("CityId") REFERENCES "Cities" ("CityId") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Events" (
    "EventId" INTEGER NOT NULL CONSTRAINT "PK_Events" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "StartDate" TEXT NOT NULL,
    "CityId" INTEGER NOT NULL,
    "Address" TEXT NOT NULL,
    "HostUserId" INTEGER NOT NULL,
    "CategoryId" INTEGER NOT NULL,
    "PhotoPath" TEXT NULL,
    CONSTRAINT "FK_Events_Categories_CategoryId" FOREIGN KEY ("CategoryId") REFERENCES "Categories" ("CategoryId") ON DELETE CASCADE,
    CONSTRAINT "FK_Events_Cities_CityId" FOREIGN KEY ("CityId") REFERENCES "Cities" ("CityId") ON DELETE CASCADE,
    CONSTRAINT "FK_Events_Users_HostUserId" FOREIGN KEY ("HostUserId") REFERENCES "Users" ("UserId") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "EventsTags" (
    "EventId" INTEGER NOT NULL,
    "TagId" INTEGER NOT NULL,
    CONSTRAINT "PK_EventsTags" PRIMARY KEY ("EventId", "TagId"),
    CONSTRAINT "FK_EventsTags_Events_EventId" FOREIGN KEY ("EventId") REFERENCES "Events" ("EventId") ON DELETE CASCADE,
    CONSTRAINT "FK_EventsTags_Tags_TagId" FOREIGN KEY ("TagId") REFERENCES "Tags" ("TagId") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "EventsUsers" (
    "EventId" INTEGER NOT NULL,
    "UserId" INTEGER NOT NULL,
    CONSTRAINT "PK_EventsUsers" PRIMARY KEY ("EventId", "UserId"),
    CONSTRAINT "FK_EventsUsers_Events_EventId" FOREIGN KEY ("EventId") REFERENCES "Events" ("EventId") ON DELETE CASCADE,
    CONSTRAINT "FK_EventsUsers_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("UserId") ON DELETE CASCADE
);
CREATE INDEX "IX_Cities_VoivodeshipId" ON "Cities" ("VoivodeshipId");
CREATE INDEX "IX_Events_CategoryId" ON "Events" ("CategoryId");
CREATE INDEX "IX_Events_CityId" ON "Events" ("CityId");
CREATE INDEX "IX_Events_HostUserId" ON "Events" ("HostUserId");
CREATE INDEX "IX_EventsTags_TagId" ON "EventsTags" ("TagId");
CREATE INDEX "IX_EventsUsers_UserId" ON "EventsUsers" ("UserId");
CREATE INDEX "IX_Users_CityId" ON "Users" ("CityId");
