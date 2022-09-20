create DATABASE TrainMasters;

use TrainMasters;

CREATE TABLE `Usr`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `traveler_id` INT NOT NULL,
    `paymentMethod` VARCHAR(255) NOT NULL,
    `password` VARCHAR(50) NOT NULL
);

CREATE TABLE `Customer`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);

CREATE TABLE `Routes`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `StartDest` VARCHAR(255) NOT NULL,
    `endDest` VARCHAR(255) NOT NULL
);

CREATE TABLE `Booking`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    `journey_id` INT NOT NULL,
    `cancellationProtection` TINYINT(1) NOT NULL
);

CREATE TABLE `Station`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `route_id` INT NOT NULL,
    `stationName` VARCHAR(255) NOT NULL,
    `arrival` INT NULL,
    `departure` INT NULL,
    `platform` VARCHAR(255) NOT NULL
);

CREATE TABLE `Locomotive`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `Carriage`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `trainSet_id` INT NOT NULL,
    `carriageType` INT NOT NULL
);

CREATE TABLE `Journey`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `route_id` INT NOT NULL,
    `trainSet_id` INT NOT NULL,
    `depFromFirstStationTime` DATETIME NOT NULL
);

CREATE TABLE `Ticket`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `travelerName` VARCHAR(255) NOT NULL,
    `travelerCategory` VARCHAR(255) NOT NULL,
    `booking_id` INT NOT NULL,
    `seat_id` INT NOT NULL,
    `departureTime` DATETIME NOT NULL,
    `startStartion_id` INT NOT NULL,
    `endStation_id` INT NOT NULL
);

CREATE TABLE `Seat`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `handicap` TINYINT(1) NOT NULL,
    `carriage_id` INT NOT NULL,
    `seatNumber` INT NOT NULL
);

CREATE TABLE `Trainset`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `locomotive_id` INT NOT NULL
);

ALTER TABLE
    `Usr` ADD CONSTRAINT `usr_traveler_id_foreign` FOREIGN KEY(`traveler_id`) REFERENCES `Customer`(`id`);
ALTER TABLE
    `Booking` ADD CONSTRAINT `booking_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customer`(`id`);
ALTER TABLE
    `Booking` ADD CONSTRAINT `booking_journey_id_foreign` FOREIGN KEY(`journey_id`) REFERENCES `Journey`(`id`);
ALTER TABLE
    `Station` ADD CONSTRAINT `station_route_id_foreign` FOREIGN KEY(`route_id`) REFERENCES `Routes`(`id`);
ALTER TABLE
    `Carriage` ADD CONSTRAINT `carriage_trainset_id_foreign` FOREIGN KEY(`trainSet_id`) REFERENCES `Trainset`(`id`);
ALTER TABLE
    `Journey` ADD CONSTRAINT `journey_route_id_foreign` FOREIGN KEY(`route_id`) REFERENCES `Routes`(`id`);
ALTER TABLE
    `Journey` ADD CONSTRAINT `journey_trainset_id_foreign` FOREIGN KEY(`trainSet_id`) REFERENCES `Trainset`(`id`);
ALTER TABLE
    `Trainset` ADD CONSTRAINT `trainset_locomotive_id_foreign` FOREIGN KEY(`locomotive_id`) REFERENCES `Locomotive`(`id`);
ALTER TABLE
    `Seat` ADD CONSTRAINT `seat_carriage_id_foreign` FOREIGN KEY(`carriage_id`) REFERENCES `Carriage`(`id`);
ALTER TABLE
    `Ticket` ADD CONSTRAINT `ticket_booking_id_foreign` FOREIGN KEY(`booking_id`) REFERENCES `Booking`(`id`);
ALTER TABLE
    `Ticket` ADD CONSTRAINT `ticket_seat_id_foreign` FOREIGN KEY(`seat_id`) REFERENCES `Seat`(`id`);
ALTER TABLE
    `Ticket` ADD CONSTRAINT `ticket_startstartion_id_foreign` FOREIGN KEY(`startStartion_id`) REFERENCES `Station`(`id`);
ALTER TABLE
    `Ticket` ADD CONSTRAINT `ticket_endstation_id_foreign` FOREIGN KEY(`endStation_id`) REFERENCES `Station`(`id`);


INSERT INTO Routes(startDest,endDest) VALUES("Stockholm C", "Göteborg C");
INSERT INTO Routes(startDest,endDest) VALUES("Göteborg C", "Stockholm C" );
INSERT INTO Routes(startDest,endDest) VALUES("Göteborg C", "Hyllie");
INSERT INTO Routes(startDest,endDest) VALUES("Hyllie", "Göteborg C");
INSERT INTO Routes(startDest,endDest) VALUES("Helsingborg C", "Trelleborg");
INSERT INTO Routes(startDest,endDest) VALUES("Trelleborg", "Helsingborg C");



INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Stockholm C',NULL,0,'16');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Sundbyberg',8,8,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Bålsta',28,28,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Enköping',41,41,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Västerås C',56,58,'5');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Köping',75,75,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Arboga',86,87,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Örebro C',108,118,'1b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Örebro Södra',121,121,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Kumla',131,131,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Hallsberg',139,141,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Laxå',156,156,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Töreboda',175,175,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Skövde C',204,205,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Falköping C',220,221,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Herrljunga',236,236,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Vårgårda',247,247,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Alingsås',258,258,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (1,'Göteborg C',286,NULL,'7');

INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Göteborg C',NULL,0,'7');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Alingsås',27,27,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Vårgårda',39,39,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Herrljunga',49,50,'5');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Falköping C',65,66,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Skövde C',80,81,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Töreboda',97,97,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Laxå',124,124,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Hallsberg',139,141,'5b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Kumla',148,148,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Örebro Södra',159,159,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Örebro C',162,178,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Arboga',199,199,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Köping',210,210,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Västerås C',227,229,'1a');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Enköping',244,244,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Bålsta',256,256,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Sundbyberg',277,277,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (2,'Stockholm C',285,NULL,'16');

INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Göteborg C',NULL,0,'14');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Mölndal',8,8,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Kungsbacka',19,19,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Åsa',29,29,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Varberg',46,48,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Falkenberg',64,64,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Halmstad C',83,84,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Laholm',96,96,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Båstad',102,102,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Ängelholm',114,114,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Helsingborg C',148,150,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Landskrona',161,161,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Lund C',177,179,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Malmö C',191,193,'2b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Triangeln',196,196,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (3,'Hyllie',200,NULL,'1b');

INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Hyllie',NULL,0,'4b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Triangeln',3,3,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Malmö C',7,9,'4a');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Lund C',21,23,'6');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Landskrona',37,37,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Helsingborg C',50,55,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Ängelholm',85,85,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Båstad',97,97,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Laholm',103,103,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Halmstad C',115,117,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Falkenberg',134,134,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Varberg',150,154,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Åsa',171,171,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Kungsbacka',180,180,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Mölndal',191,191,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (4,'Göteborg C',201,NULL,'14');

INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Helsingborg C',NULL,0,'2b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Ramlösa',2,3,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Rydebäck',7,7,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Glumslöv',10,10,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Landskrona',15,15,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Häljarp',19,19,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Dösjebro',24,24,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Kävlinge',29,29,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Gunnesbo',34,34,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Lund C',39,41,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Åkarp',46,46,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Burlöv',49,49,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Malmö C',55,57,'2b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Triangeln',60,60,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Hyllie',64,65,'2b');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Svågertorp / Malmö Syd',68,68,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Västra Ingelstad',75,75,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Östra Grevie',78,78,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (5,'Trelleborg',89,NULL,'2');

INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Trelleborg',NULL,0,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Östra Grevie',9,9,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Västra Ingelstad',12,12,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Svågertorp / Malmö Syd',19,19,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Hyllie',24,25,'3a');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Triangeln',28,28,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Malmö C',32,34,'3a');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Burlöv',39,39,'4');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Åkarp',42,42,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Lund C',48,50,'6');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Gunnesbo',53,53,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Kävlinge',59,59,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Dösjebro',64,64,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Häljarp',69,69,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Landskrona',73,73,'3');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Glumslöv',78,78,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Rydebäck',81,81,'1');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Ramlösa',86,86,'2');
INSERT INTO Station(route_id, stationName,arrival,departure,platform) VALUES (6,'Helsingborg C',91,NULL,'2b');

INSERT INTO locomotive() VALUES();
INSERT INTO locomotive() VALUES();
INSERT INTO locomotive() VALUES();

INSERT INTO trainset(locomotive_id) VALUES(1);
INSERT INTO trainset(locomotive_id) VALUES(2);
INSERT INTO trainset(locomotive_id) VALUES(3);

INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,1);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,3);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(1,4);

INSERT INTO carriage(trainSet_id, carriageType) VALUES(2,1);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(2,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(2,3);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(2,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(2,4);

INSERT INTO carriage(trainSet_id, carriageType) VALUES(3,1);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(3,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(3,2);
INSERT INTO carriage(trainSet_id, carriageType) VALUES(3,4);