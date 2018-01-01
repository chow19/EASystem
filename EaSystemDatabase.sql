create database EA;
use ea;
create table accounts(
	id int not null primary key auto_increment,
    username varchar(20) unique not null,
    passwords varchar(20) not null
)default charset=utf8,auto_increment=10000;

create table role(
	id int not null primary key auto_increment,
    role_name varchar(20) not null,
    description varchar(45)
)default charset=utf8;

create table account_role(
	id int not null primary key auto_increment,
    account_id int not null,
    role_id int not null,
    foreign key(account_id) references accounts(id) on delete cascade on update cascade,
    foreign key(role_id) references role(id) on delete cascade on update cascade
)default charset=utf8;

create table user_info(
	account_id int not null primary key,
    firstname varchar(20) not null,
    lastname varchar(20) not null,
    sex enum('M','F') default 'M',
    birth date not null,
    phonenumber varchar(20) not null,
    eamil varchar(45) not null,
    image varchar(45) default 'default',
    information varchar(100),
    foreign key(account_id) references accounts(id) on delete cascade on update cascade
)default charset=utf8;

create table classroom(
	id int not null primary key auto_increment,
    name varchar(45) not null,
    description varchar(45)
)default charset=utf8;

create table class(
	id int not null primary key auto_increment,
    teacher_id int,
    classname varchar(45) not null,
    exist int default 0,
    superior_limit int default 120,
    credit int default 2,
    description varchar(45),
    foreign key(teacher_id) references accounts(id) on delete cascade on update cascade
)default charset=utf8,auto_increment=10000;

create table class_classroom(
    classroom int not null,
    class_time int not null,
    class int not null,
    primary key(classroom,class_time),
    foreign key(classroom) references classroom(id) on delete cascade on update cascade,
    foreign key(class) references class(id) on delete cascade on update cascade
)default charset=utf8;

create table performance(
	class_id int not null,
    student_id int not null,
    exam_method enum('0','1') default '0',
    daily_achievement int,
    test_scores int,
    final int not null,
    credit int not null,
    primary key(class_id,student_id),
    foreign key(class_id) references class(id) on delete cascade on update cascade,
    foreign key(student_id) references accounts(id) on delete cascade on update cascade
)default charset=utf8;

create table user_log(
	id int not null primary key auto_increment,
    account_id int,
    logtime timestamp,
    description varchar(45)
)default charset=utf8;

grant all privileges on ea.* to 'eamanager'@'%';

set password for 'eamanager'@'%'=password('eaea');

create table classorder(
	id int not null primary key,
    classtime varchar(20) not null
)default charset=utf8;

drop table class_classroom;

create table class_classroom(
    class_date date not null,
    class_order int not null,
    classroom int not null,
    class int not null,
    primary key(class_date,class_order,classroom),
    foreign key(class_order) references classorder(id) on delete cascade on update cascade,
    foreign key(classroom) references classroom(id) on delete cascade on update cascade,
    foreign key(class) references class(id) on delete cascade on update cascade
)default charset=utf8;

insert into role (role_name,description) values
('student','this is a student.'),
('teacher','this is a teacher'),
('manager','this is a manager');

insert into accounts (username,passwords) values
('chow','123456'),
('alber','654321'),
('choose','123654'),
('jun','654123');

insert into account_role (account_id,role_id) values
(10000,1),
(10001,1),
(10002,2),
(10003,3); 

insert into accounts (username,passwords) values
('anna','123321');

insert into account_role (account_id,role_id) values
(10004,2);

insert into class (teacher_id,classname) values
(10002,'高等数学'),
(10004,'大学英语');

alter table classroom change name roomname varchar(45) not null unique key;

insert into classroom (roomname) values
('博知101'),
('博知102'),
('博知103');

insert into classorder (id,classtime) values
(1,'8:00~8:50'),
(2,'9:00~9:50'),
(3,'10:10~11:00'),
(4,'11:00~11:50'),
(5,'13:30~14:20'),
(6,'14:30~15:20'),
(7,'15:30~16:20'),
(8,'16:30~17:20'),
(9,'18:30~19:20'),
(10,'19:30~20:20');

alter table performance change final final int;

alter table performance change credit credit int;

insert into performance (class_id,student_id) values
(10000,10000),
(10001,10001);

create table calendar(
	yearName int not null,
    weekName int not null,
    dayofMonday date,
    dayofTuesday date,
    dayofWednesday date,
    dayofThursday date,
    dayofFriday date,
    dayofSaturday date,
    dayofSunday date,
    primary key(yearName,weekName)
)default charset=utf8;