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



--p.163 tbl_board
create table tbl_board(

	bno int PRIMARY KEY AUTO_INCREMENT COMMENT '게시물 번호', 
	title varchar(200) not null COMMENT '제목', 
	content text COMMENT '내용', 
	writer varchar(200) not null COMMENT '이름', 
	regdate Timestamp default now() COMMENT '이름', 
	viewcnt int default 0 COMMENT '조회수' 
	
);	

INSERT INTO tbl_board ( title, content, writer) 

	VALUES ('제목', '내용' , '글쓴이');


-- 제약 조건 추가
ALTER TABLE tbl_member
   ADD UNIQUE KEY`uc_email`(email);

   
--    member_level 추가
alter table tbl_member add ( member_level INT DEFAULT 1);

INSERT  INTO tbl_member (userid, userpw, username, email, member_level) 
	VALUE ( 'braverokmc' , '815BD3BAB386F0D425511BE6FAC7A406EC469351FA17C1A15B061A0577B5378448263D37268128052E08898B64311C818F8B6956FFF0BC77796F49A6735497A7' , '최준호', 'braverokmc79@gmail.com' , 15 );
	
	

-- free board 생성

create VIEW free_board as 
	( select b.bno, b.content, b.title, b.viewcnt, m.email, m.member_level, b.regdate, m.username, b.writer, m.userid
	
	from tbl_member m, tbl_board b where m.userid =b.writer 
	
);

	
	
	
	
