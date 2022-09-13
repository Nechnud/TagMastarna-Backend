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
create table Station (
	id INT
);
create table Rout (
	id INT
);


select * from Usr;