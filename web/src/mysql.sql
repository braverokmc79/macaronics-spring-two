create database hamansuk2 character set =utf8;

create user `ha1` @`localhost` IDENTIFIED by '1111';


grant all PRIVILEGES on hamansuk2.* to `ha1` @`localhost`;

create table tbl_member( 
	userid varchar(200)   PRIMARY KEY  not null,
	userpw varchar(200) not null,
	username varchar(50) not null,
	email varchar(100),
	regdate  TIMESTAMP  default now() ,
	updatedate DATETIME 	
);


create TRIGGER  `tbl_member_updatedate_insert`
	 BEFORE INSERT
	 ON tbl_member
	 FOR EACH ROW 
	 set new.updatedate =now();


insert into tbl_member (userid, userpw, username, email)
values ('kim', '1234', '김철수', 'kim@nate.com');


