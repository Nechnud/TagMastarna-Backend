create DATABASE TrainMasters;

use TrainMasters;

create table Usr (
	id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	PhoneNumber VARCHAR(50),
	Password VARCHAR(50),
	PaymentMethod VARCHAR(50)
);
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (1, 'Conn', 'Mulheron', 'cmulheron0@archive.org', '220-221-5620', '4z63Kf', '3543341007010339');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (2, 'Linet', 'Blune', 'lblune1@free.fr', '961-220-2680', '2mN6NfHOV1', '30324180008466');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (3, 'Red', 'Sincock', 'rsincock2@linkedin.com', '174-436-9379', 'R8RfmfZ', '3554540578354283');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (4, 'Arri', 'Dawidowsky', 'adawidowsky3@independent.co.uk', '237-429-3597', 'Tvh4k0nC', '6767411336001598407');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (5, 'Tabbie', 'Penreth', 'tpenreth4@java.com', '442-364-0782', 'SRwffV', '3536747469323128');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (6, 'Roselle', 'Worthing', 'rworthing5@yale.edu', '722-591-4336', 'plJwyOI', '4844494121976440');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (7, 'Burlie', 'Bowdidge', 'bbowdidge6@aol.com', '337-130-0050', 'qG1NGyLEp', '3577540852135674');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (8, 'Mauricio', 'Bool', 'mbool7@tiny.cc', '809-162-7072', 'L7yBPw2UoQJp', '5602241033570897');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (9, 'Eliot', 'Robardey', 'erobardey8@icio.us', '252-905-6288', 'Tk9RirN32lQ', '3533775406417003');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (10, 'Violette', 'D''Adamo', 'vdadamo9@ft.com', '841-356-3700', 'sdjh3CZt31JY', '3584817336289603');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (11, 'Byron', 'Bamell', 'bbamella@google.com.br', '314-619-5533', 'RbtMdFbAnVX', '5536443773160167');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (12, 'Beauregard', 'Salt', 'bsaltb@eepurl.com', '198-181-5504', 'XS8qUw23e4M', '67598624634681815');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (13, 'Amandie', 'Mc Carrick', 'amccarrickc@free.fr', '904-627-0570', '5CqArzIl', '3569569356611534');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (14, 'Trevor', 'Boughton', 'tboughtond@bing.com', '321-731-0228', 'TiNE0Q', '4026279039668399');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (15, 'Dorry', 'Riglar', 'driglare@google.co.uk', '605-811-9204', 'xpuSyvx', '503850800763936074');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (16, 'Sig', 'Griswood', 'sgriswoodf@hibu.com', '590-238-6231', 'xQPd41', '3581819395438140');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (17, 'Paolo', 'Bouldon', 'pbouldong@netvibes.com', '127-347-7042', 'FK9P5hPMg', '3584701866072151');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (18, 'Baily', 'Falcus', 'bfalcush@miibeian.gov.cn', '463-860-3490', 'wVmjqcWCX', '5048376887930656');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (19, 'Zolly', 'Benjefield', 'zbenjefieldi@cornell.edu', '723-891-4270', 'wkZukyb', '3544820770345252');
insert into Usr (id, first_name, last_name, email, PhoneNumber, Password, PaymentMethod) values (20, 'Ruddy', 'Georgelin', 'rgeorgelinj@blogger.com', '993-655-7006', 'QNdPS2m', '5100176447866431');
create table Customer (
	id INT
);
create table Ticket (
	id INT
);
create table Booking (
	id INT
);
create table Locomotive (
	id INT
);
create table Carriage (
	id INT
);
create table Trainset (
	id INT
);
create table Seat (
	id INT
);
create table journey (
	id INT
);

create table Routes (
	id int NOT NULL AUTO_INCREMENT,
	startDest VARCHAR(50),
	endDest VARCHAR(50)
);

INSERT INTO Routes(startDest,endDest) VALUES("Stockholm C", "Göteborg C");
INSERT INTO Routes(startDest,endDest) VALUES("Göteborg C", "Stockholm C" );
INSERT INTO Routes(startDest,endDest) VALUES("Göteborg C", "Hyllie");
INSERT INTO Routes(startDest,endDest) VALUES("Hyllie", "Göteborg C");
INSERT INTO Routes(startDest,endDest) VALUES("Helsingborg C", "Trelleborg");
INSERT INTO Routes(startDest,endDest) VALUES("Trelleborg", "Helsingborg C");


create table Station (
	id int NOT NULL AUTO_INCREMENT,
	route_id int,
	stationName VARCHAR(50),
	arrival int,
	departure int,
	platform VARCHAR(50)
);

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

select * from Usr;