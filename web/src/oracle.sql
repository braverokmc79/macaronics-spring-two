-- 관리자 계정으로 접속
-- 12g oracle
sqlplus system/1234
-- 11g  호환
alter session set "_ORACLE_SCRIPT" =true;

--테이블 스페이스 생성
create tablespace spring
datafile 'd:/spring.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;
--사용자 계정 만들기
create user spring identified by 1234
default tablespace spring;
-- 사용 권한 부여
grant connect, resource, dba to spring;








