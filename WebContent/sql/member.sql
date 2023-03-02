drop table member;
create table member(
ID varchar(20) primary key,
PW varchar(32) not null,
name varchar(20) not null,
tel varchar(20)
);

--dummy
insert into member values ('user01','user1','mem01','010-0000-0001');
insert into member values ('user02','user2','mem02','010-0000-0002');
insert into member values ('user03','user3','mem03','010-0000-0003');
insert into member values ('user04','user4','mem04','010-0000-0004');
