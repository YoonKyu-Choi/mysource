/*
 *  테이블 : 부서 - department
 * 속성
 * 부서 ID : department_id number(3) PK
 * 부서이름 : department_name varchar2(50) NN
 * 위치 : location varchar2(50)
 *
 */

drop table department cascade constraint;

create table department(
	department_id number(3) primary key,
	department_name varchar2(50) not null,
	location varchar2(50)
);

insert into DEPARTMENT values(1,'사장실','서울');
insert into department values(2,'총무부','부산');
insert into department values(3,'인사부','대전');
insert into department values(4,'구매부','울산');
insert into department values(5,'개발부','인천');

select * from DEPARTMENT;

drop table employee cascade constraint;

create table employee(	
	e_id varchar2(20) primary key,
	e_name varchar2(20) not null,	
	e_email varchar2(30),
	e_position varchar2(20) not null,
	e_salary number(10) not null,
	e_date varchar2(10) not null,	
	
	department_id number(3), -- 부서 테이블 참조 키 컬럼
	constraint fk_employee_department foreign key(department_id) references department
		
	);
	-- employee의 department_id 컬럼은 department의 primary key 컬럼의 값을 참조한다.
	-- department 테이블의 pk 컬럼의 값만 가질 수 있다.
	
	insert into EMPLOYEE values('id-1','김사원','a@a.com','사원',20000000,'2015-10-10',4);
	insert into EMPLOYEE values('id-2','최사장','b@a.com','사원',30000000,'2016-10-10',1);
	insert into EMPLOYEE values('id-3','박사원','c@a.com','사원',25000000,'2017-10-10',5);
	insert into EMPLOYEE values('id-4','김과장','d@a.com','과장',50000000,'2018-10-10',null);
	insert into EMPLOYEE values('id-5','최부장','e@a.com','부장',40000000,'2019-10-10',null);
	
	
	select e_name, e_email, department_id from employee where e_id='id-1';
	
	select department_name,location from department where department_id=3;
	
	select e_name, department_name from employee,department where e_id='id-1' and employee.department_id=department.department_id;	
	
	select e.e_name, d.department_name from employee e, department d where e.department_id=d.department_id; 
	--이렇게 하는게 join 연산(2개의 테이블을 연결해서 조회), + from 에서 별명을 줘서 코드를 간단하게 만든다 
	
	select * from employee
	
	-- 직원 id가 id-3 인 직원의 이름, 직급, 연봉, 부서명, 부서위치를 조회
	select e.e_name,e.e_position,e.e_salary
	from employee e, department d
	where e.e_id='id-3' and e.department_id=d.department_id
	
	-- 부서명이 개발부인 부서의 부서_id, 부서명, 지역, (소속된) 직원_id, 직원이름을 조회
	select d.department_id,d.department_name, d.location, e.e_id, e.e_name
	from employee e, department d
	where d.department_name='개발부' and e.department_id=d.department_id
	
	select e.e_id,e.e_name,e.e_email,d.department_name
	from employee e, department d
	where e.e_id='id-4' and e.department_id=d.department_id(+) -- (+) 는 outer-join(외부조인) , join한 부분의 조건이 만족하지 않는 (null 일 경우) 쓴다.
	 
	select d.department_id, d.department_name, e.e_name
	from department d, employee e
	where d.department_id=e.department_id(+)
	
	-- 부모 테이블 조회 <- 자식 테이블 join ( outer join : 0|< (0~N) ) 
	-- 자식 테이블 조회 <- 부모 테이블 join ( outer join : FK-Nullable )
	
	select e_salary from employee;
	select avg(e_salary) from employee;
	select sum(e_salary) from employee;
	select min(e_salary) from employee;
	select max(e_salary) from employee;
	
	select count(salary) from employee;
	
	select count(*) from addressbook -- 결과 1행
	
	select * from addressbook order by num desc
	
	
	
	
	
	
	
	
	
	