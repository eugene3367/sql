insert into member values('kkt','a1004','�����','�ɰ 123','010-1004-1004','2022-09-12');
insert into book values(bseq.nextval,'IT','�����������ӿ�ũ',38000,8,'�����','������','2022-09-10');
insert into sales values(sseq.nextval,1,'kkt',2,(select bookprice from book where bookid=1)*2,sysdate);/**/
alter table member add pt NUMBER default 0;
alter table member add visited number;

alter table member add email varchar2(40);
alter table member add areacode number;
alter table member drop column visited;/*�ذ�*/
alter table member rename column areacode to area;/*�ذ�*/
create table sales2 as select * from sales;

create table book2 as select * from book;
create table member2 as select * from member;
drop table sales2;
delete from member2 where id like '%j%';/*�ذ�*/
update member set pt=100;

update member set address='������ 27' where id ='jbj';
update member2 set reg_date=sysdate where tel like '031%';
update book2 set bookcount=5 where bookkind='HC';
delete from book2 where bookkind='TC';
alter table book2 add ckdata varchar(40);

update book2 set ckdata='���԰���' where bookcount<=7;/*�ذ�*/
alter table member2 add constraint m_pk primary key(id);
alter table book2 add constraint b_pk primary key(bookid), b_fk foreign key(bookkind) references book(bookkind);/**/
update book2 set bookcount=bookcount+5 where pubdate between '2022-01' and '2022-08';/*like '2022-08%' �ذ�?*/
select * from member;

select * from slaes where;/**/
select * from book where bookkind='IT';
select name, tel from member where id like '%k%';
select * from sales where amount>=2;
select booktitle, bookprice, author from book where bookprice>=19000 and bookprice<30000;
select booktitle, author, bookcount from book where pubcom='�Ѻ��̵��' or pubcom='�������Ͻ�';

select * from book where pubdate like '2022%';
select id, name, tel from member where length(password)>=5;/*�ƴϸ� where password like '_____' *like : ����˻�*/
select * from book order by pubdate asc and bookid desc;/**/
select bookkind, booktitle,pubcom from book where bookcount<10 order by author asc;

select bookid,booktitle,author from book where bookkind not in('IT','NV','TC') order by pubdate desc;
select * from sales as '���ŰǼ�';/**/
select id, count(*) as '���ŰǼ�' from sales group by id order by id asc;/**/
select bno, sum(money) as '�Ǹűݾ��հ�' from sales group by bno;/**/
select max(money),id,bno,money from sales;/**/

select * from member;
select * from book where rownum<=5 order by bookcount;
select sno, bno, id from sales where rownum<=3 order by money;

/*���ŰǼ����� select id, count(*) as '���ŰǼ�' from sales group by id order by id asc*/
/*�հ�ݾ׹��� select bno, sum(money) as '�Ǹűݾ��հ�' from sales group by bno */
/*���� ū �Ǹűݾ� ���� max*/
/*5���ǹ��� select * from book where rownum<=5 order by bookcount*/
/**/

/*���������ִ� ȸ���̸�*/
select * from sales;
select distinct name from member where id in(select id from sales));/*distinct: �ߺ�����, select�� �ΰ� : �������� ��������*/
select distinct a.name from member a inner join sales b on a.id=b.id;/*����*/
select distinct a.name from member a left outer join sales b on a.id=b.id;/*left : �������̺� ��� */

select distinct b.bno from member a right outer join sales b on a.id=b.id;/*right : ���������̺� ���*/

/*������������ ȸ���̸�*/
select distinct name from member where id not in(select id from sales));

/*ȸ�� ���� �� �����*/
create view tot_member as select * from member union select * from member2/*union : ������*/
select * from tot_member;

/*�ߺ� ȸ�� �� �����*/
create view cross_member as select * from member intersect select * from memeber2;/*intersection : ������*/

/*ȸ��1���� �ִ� ȸ�� �� �����*/
create view ori_member as select * from minus select * from member2/*minus : ������*/

/**/









