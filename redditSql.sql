create user fox IDENTIFIED by 1111;

grant dba to fox;

create table visit(
    id number primary key,
    u_id varchar2(20) references users(id),
    content clob not null,
    regdate date
);

create table users(
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(20) not null
);

create table photo(
    id number primary key,
    u_id varchar2(20) references users(id),
    content clob not null,
    uri clob not null,
    filename varchar2(30) not null,
    regdate date
);

commit;

insert into users values('khh','1234','김현호');
select * from users;

create SEQUENCE seq_visit_id;
insert into visit values(seq_visit_id.nextval,'khh','첫방명록입니다',sysdate);
select * from visit order by regdate desc;

create sequence seq_photo_id;

commit;
select * from photo;
drop table photo;

delete from visit where id = 3;
