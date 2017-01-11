-- 관리자 계정으로 접속
-- 12g oracle
sqlplus system/1234
-- 11g  호환
alter session set "_ORACLE_SCRIPT" =true;

--테이블 스페이스 생성
create tablespace spring
datafile 'D:\\oracleDB\\XE\\spring.dbf' size 50m

autoextend on
next 10m
maxsize unlimited;


--사용자 계정 만들기
create user spring identified by 1234;
default tablespace spring;
-- 사용 권한 부여
grant connect, resource, dba to spring;

--p.126 tbl_member
create table tbl_member(
	userid varchar2(150) not null,
	userpw varchar2(150) not null,
	username varchar2(50) not null,
	email varchar2(100),
	regdate  date default sysdate ,
	updatedate date default sysdate,
	primary key(userid)
	
);

insert into tbl_member (userid, userpw, username, email)
values ('kim', '1234', '김철수', 'kim@nate.com');

select * from tbl_member;
commit;





--p.163 tbl_board
create table tbl_board(

	bno number not null,  --게시물 번호
	title varchar2(200) not null, --제목
	content varchar2(4000), --내용
	writer varchar2(50) not null, --이름
	regdate date default sysdate, --날짜
	viewcnt number default 0, --조회수
	PRIMARY key(bno)
);	


-- nvl(A, B) A 가 null 이면 B, null 이 아니면 A
insert into TBL_BOARD (BNO, TITLE, CONTENT, WRITER) 
 VALUES((select nvl(max(bno)+1,1) from tbl_board), '제목', '내용', 'kim');

select * from tbl_board;

commit; 
 
 


-- 멤버 이메일로 유니크 제약조건 
ALTER TABLE tbl_member
   ADD CONSTRAINT uc_email UNIQUE (email) VALIDATE;



   
-- 회원 레벨 컬럼 추가
alter TABLE  TBL_MEMBER ADD  ( member_level  number default 1 );




-- free board 생성

create VIEW v_free_board as 
	( select b.bno, b.content, b.title, b.viewcnt, m.email, m.member_level, b.regdate, m.username, b.writer, m.userid
	
	from tbl_member m, tbl_board b where m.userid =b.writer 
	
);



--페이지 나누기 쿼리


select * from
(
	select rownum as rn , A.*
 from	(select  rownum , bno, content, title, viewcnt, writer, userid, username 
 		from v_free_board  order by bno desc , regdate desc ) A
) where  rn BETWEEN  1 and 10

  and username like '%' || '2222' || '%' ;
		


-- 기존 게시물 삭제
delete from tbl_board;
commit;
-- 게시물 1000 개 입력

declare
 i number :=1;
begin 
 while i <= 1000 loop
  insert into tbl_board (bno, title, content, writer)
	values
   ( (select nvl(max(bno) +1, 1) from tbl_board )
  	, '제목'||i, '내용'||i, 'kim');	
	i :=i+1;
  end loop;
end;



-- Free Board 댓글 테이블 (p.370)
-- 게시판 : 댓글 (1:n , 1: 다)
-- 댓글 테이블 (p.370)


create table tbl_reply(

  rno number not null primary key,
  bno number default 0,
  replytext varchar2(1000) not null,
  replyer varchar2(50) not null,
  regdate date  default sysdate,
  updatedate date  default sysdate

);

-- foreing key 제약조건 추가

alter table tbl_reply add constraint fk_board

 foreign key(bno) REFERENCES  tbl_board(bno);

-- 시퀀스 생성

create sequence reply_seq

start with 1 increment by 1;


select reply_seq.nextval from dual;


-- 1000번 게시물에 대한 댓글

insert into tbl_reply(rno, bno, replytext, replyer)
 values (reply_seq.nextval, 1000,  '댓글 ...' , 'kim');

select rno, bno, replyer, r.regdate, r.updatedate, username

from  tbl_reply r, tbl_member m

where r.replyer = m.userid and bno =1000;



commit;

select USERNAME , r.REGDATE, r.UPDATEDATE,  REPLYTEXT,  REPLYER , rno, bno  from 

 	TBL_MEMBER m , TBL_REPLY r WHERE  m.USERID =r.REPLYER  and bno =1000
	order BY rno ;



	
-- v_free_board cnt 추가 	
	
drop VIEW v_free_board;

	
create VIEW v_free_board as 	
select b.bno, b.content, b.title, b.viewcnt, m.email, m.member_level, b.regdate, m.username, b.writer, m.userid,
	(select count(*) from tbl_reply  where bno =b.bno) as cnt
	from tbl_member m, tbl_board b where m.userid =b.writer ;	



-- 숨김 댓글 컬럼 추가 
alter table tbl_reply add (secret_reply char(1));
commit;


-- secret_reply null 을 n 으로 업데이트
update tbl_reply set secret_reply ='n' where SECRET_REPLY is null;	
	


-- 비밀 댓글 표시를 위한 쿼리 변경

select *
	from 
	(
   select rownum as rn , A.* 
   	from (
		select 	
			 rownum,  REPLYTEXT,  REPLYER ,  bno , m.USERNAME  , r.REGDATE, r.UPDATEDATE , rno ,
			 
			 (select writer  from tbl_board  where bno=1000) as writer
			 
			 from 
	 	  TBL_REPLY r , TBL_MEMBER m  WHERE  r.REPLYER =m.USERID 	
		  
		   and bno=1000 order by rno desc
		   ) A
		   
		   ) where rn BETWEEN  1 and 10;





--컬럼 추가

alter table tbl_board add ( show char(1) );

update tbl_board set show ='y';

select * from tbl_board;

delete from tbl_board where bno =5;

update tbl_board set show ='n' where bno =5;

select * from tbl_board where show='y';

commit;





drop VIEW v_free_board;

	
create VIEW v_free_board as 	
select b.bno, b.content, b.title, b.viewcnt, m.email, m.member_level, b.regdate, m.username, b.writer, m.userid, b.show,
		
	(select count(*) from tbl_reply  where bno =b.bno) as cnt
	from tbl_member m, tbl_board b where m.userid =b.writer ;	
	
commit;	
	


create table tbl_user (
 userid varchar2(50) not null,
 upw varchar2(50) not null,
 uname varchar2(100) not null,
 upoint number default 0,
 primary key(userid)

);

create table tbl_message (
 mid number not null,
 targetid varchar2(50) not null,
 sender varchar2(50) not null,
 message varchar2(4000) not null,
 opendate date,
 senddate date default sysdate,
 primary key(mid) 
);

-- 시권스 생성

create SEQUENCE message_seq START WITH 1

INCREMENT  BY 1;


alter table tbl_message add constraint fk_usertarget
 foreign key (targetid) references tbl_user(userid);


alter table tbl_message add constraint fk_usersender

foreign key (sender ) references tbl_user(userid);



insert into tbl_user (userid, upw, uname) 
	values ('user00', 'user00', 'kim');

insert into tbl_user (userid, upw, uname) 
	values ('user01', 'user01', 'park');
	
insert into tbl_user (userid, upw, uname)
 	values ('user02', 'user02', 'hong');
	 	
insert into tbl_user (userid, upw, uname)
	values ('user03', 'user02', 'choi');


insert into tbl_user (userid, upw, uname)
 	values ('user04', 'user04', 'lee');

 	

select * from tbl_user;

-- user02가 user00에기 메시지를 전송 	

