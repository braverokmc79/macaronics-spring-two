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


-- galler 

create table tbl_gallery (
	
	idx NUMBER not null,
	fileName VARCHAR2(100),
	fileTypes varchar2(10) ,
	filePath varchar2(100),
	fileSize long,
	createDate date DEFAULT sysdate,
	updateDate DATE 
	
);

create SEQUENCE gallery_seq 
	start with 1 INCREMENT BY 1;

commit;




create TABLE tbl_attach (
	fullName varchar2(150) not null, --첨부파일 이름
	bno number not null, --게시물 번호
	regdate date default sysdate, --업로드 날짜
	primary key(fullName)
);

-- bno 컬럼에 foreign key 설정
alter table tbl_attach add CONSTRAINT fk_board_attach
FOREIGN KEY (bno) REFERENCES  tbl_board(bno);

commit;

-- tbl_board 테이블의 bno 컬럼을 위한 시퀀스 생성
create sequence seq_board
start with 1 INCREMENT by 1;

-- 게시판의 기존 게시물들은 삭제

delete from tbl_reply;
delete from tbl_board;

commit;



-- 상품 테이블
create table product(

    product_id number ,	
    category_idx number,
	category_bno number,
	category_rno number,
 	product_name varchar2(150),
 	price number default 0,
 	description varchar2(500),
 	picture_url varchar2(500),
 	regdate date default sysdate,
 	updatedate date,
	amount number default 100,
	PRODUCT_STATE VARCHAR2 (50) DEFAULT '보통',
	BIG_DESCRIPTION long,
	deliver  number,
	deliver_money number,
	
 	primary key(product_id)


);

-- product view 카운터 
alter table product add ( view_count number DEFAULT 0);

insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (1,'[투데이특가] 퀸 사이즈
극세사이불vs극세사토퍼',18900,'양면 모두 포근한 부드러운 극세사 원단으로 그레이색상에 세련된 플라워 디자인
극세사차렵이불세트로 컴퓨터 원헤드 퀄팅을 하여 솜뭉침을 방지하며 디자인이 살아나게끔 꼼꼼하게 퀄팅 처리 하였습니다.','1.jpg' , 
sysdate);

insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (2,'[투데이특가] 극세사
대형 토끼 담요 150x200',5900,'
부드럽고 촉감이 좋으며 털빠짐이 적습니다.
퀀사이즈의 대형크기로 아이들방/카페/캠핑 및 다용도로 활용하기 좋습니다.','2.jpg',sysdate);

insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (3,'[겨울시즌오프] 大 담요
포그니 극세사 이불담요',8900,'보들보들 부드러운 촉감으로 겨울에도 포근하게 사용이 가능하며,
 담요를 접고 풀어지지 않게 끈 혹은 밴드를 사용하여 깔끔하게 정리됩니다.','3.jpg',sysdate);


insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (4,'[겨울시즌마감] 카페트러그 세일하니 좋구나',
8900,'따뜻하고부드러운 감촉 위생까지 생각한 극세사
극세사는 매우 얇은 실을 촘촘하게 직조하여 면에 빈해
가볍고 따뜻하합니다. 극세사 제품은 섬유조직이 촘촘하기에
면에 비해흡수율이 좋으며 물세탁이 가능해 더욱 위생적입니다.','4.jpg',sysdate);



insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (5,'BLMG 블루밍홈 
철제 책상/테이블',28900,'블루밍홈 베이직 입식테이블은 고강도 철제 프레임으로 된 정교한
x자형 지지대가 있어 무거운 물픔을 올려놓아도 걱정이 없습니다.
또한 모서리가 라운딩처리되어 안전하게 테이블을 사용하실 수 있습니다.
다양하게 연출가능한 베이직 입식테이블 지금 한번 만나보세요~
어떤 분위기에도 잘 어울리는 옐로우비취와 화이트 두가지 색상이 있습니다.','5.jpg',sysdate);

insert into product (PRODUCT_ID, PRODUCT_NAME,
 PRICE, DESCRIPTION, PICTURE_URL ,regdate) values (6,'[투데이특가] 싱글침구
매트커버+베개커버+솜',89500,'(폴리에스테르 100%)
피치스킨 이란?
가공처리한 원단으로 표면이 매우 부드러우며 내구성이 우수합니다.
뛰어난 흡수력과 건조성으로 세탁이 간편합니다.','6.jpg',sysdate);


commit;

-- 장바구니 테이블

create table cart(
	cart_id number not null primary key,
	userid varchar2(50) not null,
	product_id number not null,
	amount number default 0
);

--foreign key 설정
-- 제약조건 추가
alter table cart add constraint cart_userid_fk
FOREIGN KEY (userid) REFERENCES tbl_member(userid);

alter table cart add constraint cart_productid_fk
foreign key(product_id) REFERENCES  product(product_id);


-- 시퀀스 추가
create SEQUENCE  seq_cart start WITH 1 
 INCREMENT by 1;
 

 
 
create or replace view v_cart as  
select  
	c.CART_ID , p.price,  c.AMOUNT, c.PRODUCT_ID, c.USERID, m.USERNAME ,p.PRODUCT_NAME ,p.PICTURE_URL, 
	 p.AMOUNT as product_amount  ,p.PRODUCT_STATE, (price*c.amount) as money  , c.CART_REGDATE 
	from 
	 cart c, TBL_MEMBER m, PRODUCT p
	where  c.USERID=m.USERID and c.PRODUCT_ID =p.PRODUCT_ID ; 

commit;

-- cart_regdate 추가

alter table cart add ( cart_regdate date default sysdate);
commit;


--중복 상품 그룹바이 처리

	select  sum(price*amount) as money , PRODUCT_ID , product_name  ,price, sum(amount) as amount, 
		
		PICTURE_URL,PRODUCT_STATE,USERNAME,USERID
	
	from V_CART 

	WHERE userid=#{userid}

	group by product_id, product_name,price, PICTURE_URL,PRODUCT_STATE, USERNAME, USERID 
;


-- 주문 테이블 추가


create table tbl_product_order (
	
	idx varchar2(200) not null primary key ,
	money number ,
	product_id number,
	product_name varchar2(200),
	price number,
	amount number,
	sum number,
	total_deliver_money number,
	total_sum number,
	picture_url varchar2(200),
	product_state varchar2(50),
	username varchar2(100),
	userid varchar2(100),
	
	
	regdate date default sysdate

); 	




-- 주문 테이블 제약 조건 추가
alter table TBL_PRODUCT_ORDER add CONSTRAINT  order_userid_fk
FOREIGN KEY (userid) REFERENCES tbl_member(userid);

alter table TBL_PRODUCT_ORDER add constraint order_product_fk
foreign key (product_id) references product(product_id);

-- 주문 테이블 시퀀스 추가
create SEQUENCE  seq_order 
 start WITH 1  INCREMENT by 1;
 

commit;



--관리자 계정

create table tbl_admin(
	userid varchar2(150) not null,
	userpw varchar2(150) not null,
	username varchar2(50) not null,
	email varchar2(100),
	regdate  date default sysdate ,
	updatedate date default sysdate,
	primary key(userid)
	
);

-- 멤버 이메일로 유니크 제약조건 
ALTER TABLE tbl_admin
   ADD CONSTRAINT tbl_admin_email UNIQUE (email) VALIDATE;



   
-- 회원 레벨 컬럼 추가
alter TABLE  tbl_admin ADD  ( member_level  number default 1 );



INSERT INTO tbl_admin (USERID,
                        USERPW,
                        USERNAME,
                        EMAIL,
                        REGDATE,
                        UPDATEDATE,
                        MEMBER_LEVEL)
     VALUES ('admin',
             '$2a$10$hFgGQ08l4MSkvOZ2B6PWwOeudZ/7ZnCcp9IOcHzesKPEVMD2HiJGO',
             '최준호',
             'braverokmc79@gmail.com',
             TO_DATE ('01/07/2017 22:08:55', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('01/07/2017 22:08:55', 'MM/DD/YYYY HH24:MI:SS'),
             15);

COMMIT;



-- 카테고리

create  table tbl_category_one (
	
	idx number PRIMARY KEY ,
	title VARCHAR2(100)
);


create  table tbl_category_two(
	bno number PRIMARY KEY, 
	idx_one number  ,
	title VARCHAR2(100)
);



create  table tbl_category_three(
	rno	 number PRIMARY KEY ,
	idx_one number , 
	idx_two number  ,
	title VARCHAR2(100)
);



--foreign key 설정
-- 카테고리 제약조건 추가
alter table TBL_CATEGORY_TWO add constraint category_two_idx_fk
FOREIGN KEY (idx_one) REFERENCES tbl_category_one(idx);


alter table tbl_category_three add constraint category_three_idx_one_fk
foreign key(idx_one) REFERENCES  tbl_category_one(idx);


alter table TBL_CATEGORY_THREE add constraint category_three_idx_two_fk
FOREIGN KEY (idx_two) REFERENCES tbl_category_two(bno)

;

-- 카테고리 시퀀스 추가
create sequence seq_category_one start with 1
	increment by 1;

create sequence seq_category_two start with 1
	increment by 1;
	
create sequence seq_category_three start with 1
 increment by 1;


insert into TBL_CATEGORY_ONE (IDX, TITLE) 
	values (seq_category_one.nextval , '과일');

insert into tbl_category_two (BNO, IDX_ONE, TITLE) 

VALUES (2, 1, '참외' );


insert into TBL_CATEGORY_THREE (RNO, IDX_ONE, IDX_TWO, TITLE)

VALUES (1, 1, 1, '맛있다'); 	


insert into TBL_CATEGORY_THREE (RNO, IDX_ONE, IDX_TWO, TITLE)

VALUES (2, 1, 2, '참외맛있다'); 	
	
	
delete from TBL_CATEGORY_THREE WHERE RNO =2;


select idx , bno, rno, one.title as category_one, two.TITLE as category_two, three.TITLE as category_three from 

	TBL_CATEGORY_ONE one, TBL_CATEGORY_TWO two, TBL_CATEGORY_THREE three
	
	where one.IDX=two.idx_one and two.bno=three.IDX_TWO
;

--연속 삭제로 제약 조건 변경
ALTER TABLE tbl_category_two
   ADD CONSTRAINT category_two_idx_fk FOREIGN KEY (idx_one)
       REFERENCES spring.tbl_category_one (idx) ON DELETE CASCADE
       VALIDATE;

ALTER TABLE tbl_category_three
   ADD CONSTRAINT category_three_idx_one_fk FOREIGN KEY (idx_one)
       REFERENCES spring.tbl_category_one (idx) ON DELETE CASCADE
       VALIDATE;       
       
ALTER TABLE tbl_category_three
   ADD CONSTRAINT category_three_idx_two_fk FOREIGN KEY (idx_two)
       REFERENCES spring.tbl_category_two (bno) ON DELETE CASCADE
       VALIDATE;
       

       
       
-- 상품 첨부파일 테이블 생성
create table tbl_product_attach(
	fullname VARCHAR2(200) not null,
	PRODUCT_ID int not null,
	regdate date default sysdate,
	PRIMARY key(fullname)

);


-- 제약 조건 추가
alter table tbl_product_attach add CONSTRAINT 
	fk_product_attach FOREIGN KEY (product_id) 
	REFERENCES  product (product_id) on DELETE CASCADE VALIDATE ;

	
	
-- 상품 테이블  시퀀스 추가

create SEQUENCE  seq_product START WITH 10
  INCREMENT BY 1;	

  
  
-- 상품 뷰 생성

create view v_product as

(

select  

p.PRODUCT_ID, p.AMOUNT, p.BIG_DESCRIPTION, p.CATEGORY_BNO, p.CATEGORY_IDX, p.CATEGORY_RNO,p.DELIVER

,p.DELIVER_MONEY, p.DESCRIPTION, p.PICTURE_URL, p.PRICE, p.PRODUCT_NAME,p.PRODUCT_STATE,p.REGDATE,p.UPDATEDATE

,p.view_count
, c1.title as category1_title  ,  c2.title as category2_title   , c3.TITLE as category3_title
		
	from product p , TBL_CATEGORY_ONE c1, TBL_CATEGORY_TWO c2, TBL_CATEGORY_THREE c3
	
	where p.category_idx =c1.IDX and p.category_bno=c2.BNO and p.category_rno =c3.RNO

);  
  





-- long 타입을 clob 타입으로 변경후 자가 복제

DECLARE
BEGIN
   DECLARE
      CURSOR CURSOR_NAME
      IS
         SELECT PRODUCT_ID, PRODUCT_NAME, PRICE, DESCRIPTION, PICTURE_URL, REGDATE, AMOUNT, PRODUCT_STATE, BIG_DESCRIPTION,
                CATEGORY_IDX, CATEGORY_BNO, CATEGORY_RNO, DELIVER, DELIVER_MONEY, UPDATEDATE,VIEW_COUNT
           FROM product2;
   BEGIN
      FOR I IN CURSOR_NAME
      LOOP
         INSERT INTO product2 (PRODUCT_ID, PRODUCT_NAME, PRICE, DESCRIPTION, PICTURE_URL, REGDATE, AMOUNT, PRODUCT_STATE, BIG_DESCRIPTION,
                CATEGORY_IDX, CATEGORY_BNO, CATEGORY_RNO, DELIVER, DELIVER_MONEY, UPDATEDATE,VIEW_COUNT
				)
              VALUES (seq_product.NEXTVAL,  I.PRODUCT_NAME, I.PRICE,  I.DESCRIPTION,  I.PICTURE_URL,   I.REGDATE,
                     
                      I.AMOUNT,  I.PRODUCT_STATE, I.BIG_DESCRIPTION,  I.CATEGORY_IDX, I.CATEGORY_BNO,
                      I.CATEGORY_RNO,   I.DELIVER,I.DELIVER_MONEY,  I.UPDATEDATE,
                       I.VIEW_COUNT);
         
      END LOOP;
   END;
END;


-- p.BIG_DESCRIPTION, 제거
create view view_product as 

(

select  rownum as rn,

p.PRODUCT_ID, p.AMOUNT,  p.CATEGORY_BNO, p.CATEGORY_IDX, p.CATEGORY_RNO,p.DELIVER

,p.DELIVER_MONEY, p.DESCRIPTION, p.PICTURE_URL, p.PRICE, p.PRODUCT_NAME,p.PRODUCT_STATE,p.REGDATE,p.UPDATEDATE

,p.view_count
, c1.title as category1_title  ,  c2.title as category2_title   , c3.TITLE as category3_title
		
	from product p , TBL_CATEGORY_ONE c1, TBL_CATEGORY_TWO c2, TBL_CATEGORY_THREE c3
	
	where p.category_idx =c1.IDX and p.category_bno=c2.BNO and p.category_rno =c3.RNO

); 


-- p.BIG_DESCRIPTION, 포함
create view view2_product as 

(

select  

p.PRODUCT_ID, p.AMOUNT,  p.CATEGORY_BNO, p.CATEGORY_IDX, p.CATEGORY_RNO,p.DELIVER

,p.DELIVER_MONEY, p.DESCRIPTION, p.PICTURE_URL, p.PRICE, p.PRODUCT_NAME,p.PRODUCT_STATE,p.REGDATE,p.UPDATEDATE

,p.view_count
, c1.title as category1_title  ,  c2.title as category2_title   , c3.TITLE as category3_title
		
	from product p , TBL_CATEGORY_ONE c1, TBL_CATEGORY_TWO c2, TBL_CATEGORY_THREE c3
	
	where p.category_idx =c1.IDX and p.category_bno=c2.BNO and p.category_rno =c3.RNO

);  
  	
 commit;
 
 
-- 상품 테이블 검색 쿼리 설정


select * from

(

select rownum as rn , A.*
	from (
	
	select  rownum ,

p.PRODUCT_ID, p.AMOUNT,  p.CATEGORY_BNO, p.CATEGORY_IDX, p.CATEGORY_RNO,p.DELIVER

,p.DELIVER_MONEY, p.DESCRIPTION, p.PICTURE_URL, p.PRICE, p.PRODUCT_NAME,p.PRODUCT_STATE,p.REGDATE, p.UPDATEDATE

,p.view_count
, c1.title as category1_title  ,  c2.title as category2_title   , c3.TITLE as category3_title
		
	from product p , TBL_CATEGORY_ONE c1, TBL_CATEGORY_TWO c2, TBL_CATEGORY_THREE c3
	
	where p.category_idx =c1.IDX and p.category_bno=c2.BNO and p.category_rno =c3.RNO
	
	
	order by p.PRODUCT_ID desc , p.REGDATE desc
	)
	
	A 
		
)		where  rn BETWEEN  1 and 10 ;


-- 추천 상품 테이블
create table tbl_recommend_product (
	
	recommendCode number PRIMARY KEY ,
	product_id number

) 
 -- 제약 조건 추가
alter table tbl_recommend_product add constraint

	fk_recommend_product FOREIGN KEY (product_id)
	REFERENCES  product(product_id) on DELETE CASCADE VALIDATE ;	
	

	
-- 샘플 등록

	
insert into TBL_RECOMMEND_PRODUCT (RECOMMENDCODE, PRODUCT_ID) 
 VALUES (1, 11);
 
 commit;
 
 
 
-- 쿠폰 테이블 생성

create table tbl_coupon (
	
	idx NUMBER PRIMARY KEY ,
	title varchar2(200),
	content long,
	view_count number,
	img_url varchar2(200),
	regdate date default sysdate
	
);
create sequence seq_coupon

start with 1 increment by 1;

 
 -- 카테고리 별 상품 개수	
	
select 
  count(c3.title) product_count , c3.TITLE as category_name
		
	from product p , TBL_CATEGORY_ONE c1, TBL_CATEGORY_TWO c2, TBL_CATEGORY_THREE c3
	
	where p.category_idx =c1.IDX and p.category_bno=c2.BNO and p.category_rno =c3.RNO
	
group by c3.TITLE order by c3.TITLE asc




-- 이메일 테이블

create TABLE  tbl_email (
	idx number PRIMARY  KEY ,
	senderName varchar2(100),
	senderMail varchar2(100),
	receiveMail varchar2(100),
    subject varchar2(100),
	message long,
	regdate date default sysdate
	 
);

CREATE  SEQUENCE seq_mail
 START WITH 1 INCREMENT BY 1;
 
 
 
select * from (
select rownum as rn, A.* from ( select rownum , IDX, SENDERNAME, SENDERMAIL, RECEIVEMAIL, SUBJECT, 
regdate from tbl_email order by regdate desc) A 
)
WHERE rn between 200 and 300;
--

-- 한줄 메모장
create SEQUENCE  seq_memo
start with 1 INCREMENT  by 1;
commit;
CREATE TABLE tbl_memo (
	
	idx NUMBER PRIMARY KEY ,
	userid VARCHAR2(100) not NULL ,
	friendName VARCHAR2(100) NOT NULL ,
	memo VARCHAR2(4000) not null,
	email VARCHAR2(100) null,
	phone VARCHAR2(100) null,
	post_date date default sysdate
);


insert INTO TBL_MEMO (IDX, WRITER, MEMO) 

 values ( seq_memo.nextval, 'writer' , 'memo'); 
 
select * from tbl_memo;
 
--


 select * from ( select rownum  as rn, A.*  from 
 
  ( select rownum ,  EMAIL, friendName, idx, memo, phone, post_date from tbl_memo 
	 
	where userid='braverokmc' order by idx desc )  A
 
 ) where  rn BETWEEN 50 and 56 ;
	 

 
  -- 페이스북의 게시물 정보

create table tbl_facebook_feed(
	idx NUMBER not null PRIMARY KEY ,
	id VARCHAR2(500) not null  ,
	name VARCHAR2(50),
	message long,
	picture VARCHAR2(500),
	created_time VARCHAR2(100)

);


create SEQUENCE seq_facebook_feed 

 start WITH 1 increment by 1;

