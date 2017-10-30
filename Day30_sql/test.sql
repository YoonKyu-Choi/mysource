/*
테이블명 : 주소록 (address book)
컬럼 : 
	번호 - num (number(5)-만단위)	- 기본키
	이름 - name (varchar2(30)),	- Not Null로 지정
	전화번호 - (varchar2(13)),	- Not Null로 지정
	이메일주소 - email (varchar2(30)),	- Unique Key
	집주소 - address (varchar2(100))		
*/
	drop table addressbook;
	
	create table addressbook(
		num number(5) primary key, 
		name varchar2(30) not null,
		phone_num varchar2(13) not null,
		email varchar2(30)	unique,
		address varchar2(100)	
	);
	
	insert into ADDRESSBOOK --(num,name,phone_num,email,address) 여긴 위에 create로 선언한 순서대로 넣으면 생략 가능
					values(1,'홍길동','010-1234-5678','a@a.com','서울시 종로구');
	insert into addressbook values(3,'최윤규','010-1111-2222',null,null);
	insert into addressbook values(6,'알로하','010-4111-2222',null,null);
	
	drop table addressbook;
	
	create table addressbook(
	num number(5),
	name varchar2(30) not null,			
	phone_num varchar2(13) not null,	--전화번호
	email varchar2(30),
	address varchar2(100),
	constraint pk_addressbook_num primary key(num), -- PK(Primary Key) 제약조건
	constraint uk_addressbook_email unique (email)  -- UK(Unique Key) 제약조건
	
	);
	
	alter table addressbook add(birthday date);
	alter table addressbook drop column birthday;
	
	insert into ADDRESSBOOK (num,name,phone_num) values (9,'김영수','02-111-1111');
	insert into ADDRESSBOOK values (7,'유명인','031-2222-2222','abc222@ab2c.com','성남시','1980-11-11');
	insert into ADDRESSBOOK values (2,'유명인','031-7777-2222','abc1@abc.com','성남시','1980-11-11');
	insert into ADDRESSBOOK values (10,'유재석','031-6666-2222','abc2@abc.com','판교시','1985-11-11');
	insert into ADDRESSBOOK values (11,'정준하','031-5555-2222','abc3@abc.com','서울시','1990-11-11');
	insert into ADDRESSBOOK values (12,'정형돈','031-4444-2222','abc4@abc.com','안양시','1995-11-11');
	insert into ADDRESSBOOK values (13,'노홍철','031-3333-2222','abc5@abc.com','파주시','1999-11-11');
	
	update addressbook set phone_num='02-111-2222' where num =1;
	update addressbook set address='주소 없음',birthday='0001-01-01' where address is null and birthday is null;
	update addressbook set address=null where num=3;
	
	delete from addressbook where num=5;
	
	delete from addressbook where name like '최%';
	
	delete from addressbook;
	
	select * from addressbook;
	
	
	select name,phone_num from addressbook
	select phone_num,address from addressbook where name='유재석';
	select distinct name from ADDRESSBOOK
	
	select * from ADDRESSBOOK where name !='유재석'and address like '서울%'
	select name,phone_num,birthday from addressbook where birthday between '1990/01/01' and '1995.12.31'
	select num,name,phone_num from addressbook where num in(1,7,9)
--	select name from addressbook order by name asc;
	select name from addressbook order by name asc ,num desc;
	
	select num, num*10 from ADDRESSBOOK
	
	select name||'씨' from addressbook
	select name||address from addressbook
	
	update addressbook set birthday = to_date('2015/11/20/10','yyyy/mm/dd/hh24miss')
	select birthday from addressbook
	
	select count(name)	from addressbook
	select num from addressbook order by num;
	update addressbook set birthday=sysdate
	
	
	
	
	select * from ADDRESSBOOK
	
	--시퀀스 생성
	delete from addressbook; -- 그 전에 만든거 지우고 새로 만들기
	
	
	create sequence addressbook_num_seq; 			-- 0부터 시작, 1씩 증가 
	insert into ADDRESSBOOK (num, name, phone_num) values(addressbook_num_seq.nextval,'이름','010-1111-2222');
	select * from addressbook order by num
	
	
	create sequence test_seq start with 10 increment by 5;	-- 시작은 10 증가는 5씩 증가
	
	select test_seq.nextval from dual -- dual : dummy table - from 절을 만들려고 넣는 가상테이블
	select sysdate from dual
	
	select addressbook_num_seq.nextval, addressbook_num_seq.currval, addressbook_num_seq.currval from dual
	
	
	
	
	select * from ADDRESSBOOK
	
	
	
	
	
	
	
	-- 제약조건이름 : 제약조건_테이블_컬럼
	
	
	
	/*
	 * 테이블 : 직원
	 * 
	 * 한글명		영문명		데이터타입		제약조건
	 * 직원ID
	 * 직원_이름
	 * 이메일
	 * 직급
	 * 연봉
	 * 입사일  
	 */
	
	
	
	create table employee(	
	e_id varchar2(20) primary key,
	e_name varchar2(20) not null,	
	e_email varchar2(30),
	e_position varchar2(20) not null,
	e_salary number(10) not null,
	e_date varchar2(10) not null	
	)
	
	
	
	
	
	
	
	
	
	
	
	
	
	