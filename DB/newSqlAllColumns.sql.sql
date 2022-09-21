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

/*Vagn 1 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,1,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,1,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,1,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,1,54);

/*Vagn 2 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,2,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,2,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,2,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,2,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,2,74);

/*Vagn 3 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,3,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,3,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,3,28);

/*Vagn 4 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,4,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,4,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,4,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,4,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,4,74);

/*Vagn 5 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,5,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,5,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,5,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,5,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,5,74);

/*Vagn 6 trainset 1*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,6,79);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,6,80);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,6,40);







/*Vagn 1 trainset 2*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,7,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,7,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,7,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,7,54);

/*Vagn 2 trainset 2*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,8,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,8,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,8,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,8,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,8,74);

/*Vagn 3 trainset 2*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,9,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,9,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,9,28);

/*Vagn 4 trainset 2*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,10,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,10,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,10,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,10,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,10,74);

/*Vagn 5 trainset 2*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,11,79);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,11,80);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,11,40);




/*Vagn 1 trainset 3*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,12,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,12,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,12,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,12,54);

/*Vagn 2 trainset 3*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,13,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,13,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,13,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,13,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,13,74);

/*Vagn 3 trainset 3*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,14,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,14,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,40);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,41);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,42);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,43);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,44);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,45);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,46);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,47);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,48);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,49);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,50);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,51);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,52);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,53);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,54);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,55);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,56);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,57);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,58);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,59);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,60);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,61);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,62);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,63);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,64);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,65);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,66);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,67);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,68);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,69);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,70);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,14,71);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,14,72);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,73);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,14,74);

/*Vagn 4 trainset 3*/
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,15,79);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(1,15,80);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,1);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,2);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,3);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,4);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,5);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,6);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,7);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,8);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,9);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,10);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,11);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,12);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,13);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,14);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,15);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,16);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,17);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,18);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,19);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,20);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,21);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,22);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,23);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,24);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,25);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,26);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,27);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,28);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,29);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,30);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,31);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,32);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,33);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,34);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,35);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,36);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,37);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,38);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,39);
INSERT INTO Seat(handicap, carriage_id, seatNumber) VALUES(0,15,40);