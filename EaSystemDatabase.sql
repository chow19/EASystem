create database EA;
use ea;
create table account(
	id int not null primary key auto_increment,
    username varchar(20) unique not null,
    passwork varchar(20) not null
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
    foreign key(account_id) references account(id) on delete cascade on update cascade,
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
    foreign key(account_id) references account(id) on delete cascade on update cascade
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
    foreign key(teacher_id) references account(id) on delete cascade on update cascade
)default charset=utf8;

alter table class auto_increment=10000;

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
    foreign key(student_id) references account(id) on delete cascade on update cascade
)default charset=utf8;

create table user_log(
	id int not null primary key auto_increment,
    account_id int,
    logtime timestamp,
    description varchar(45)
)default charset=utf8;

grant all privileges on ea.* to 'eamanger'@'%';

set password for 'eamanger'@'%'=password('eaea');
