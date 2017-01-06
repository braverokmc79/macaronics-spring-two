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









