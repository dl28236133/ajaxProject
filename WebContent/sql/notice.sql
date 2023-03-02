drop table notice;
create table notice(
   num int primary key auto_increment,
   id varchar(20),
   sub varchar(40) default '제목없음',
   hiredate TIMESTAMP default now(),
   content text,
   cnt int default 0,
   foreign key (id) references member(id)
);

insert into notice values (0,'user01','test1',now(),'testing...',0);
insert into notice values (0,'user02','test2',now(),'testing...',0);
insert into notice values (0,'user03','test3',now(),'testing...',0);
insert into notice values (0,'user04','test4',now(),'testing...',0);