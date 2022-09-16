insert into member values('kkt','a1004','김기태','능곡동 123','010-1004-1004','2022-09-12');
insert into book values(bseq.nextval,'IT','스프링프레임워크',38000,8,'김기태','정복사','2022-09-10');
insert into sales values(sseq.nextval,1,'kkt',2,(select bookprice from book where bookid=1)*2,sysdate);/**/
alter table member add pt NUMBER default 0;
alter table member add visited number;

alter table member add email varchar2(40);
alter table member add areacode number;
alter table member drop column visited;/*해결*/
alter table member rename column areacode to area;/*해결*/
create table sales2 as select * from sales;

create table book2 as select * from book;
create table member2 as select * from member;
drop table sales2;
delete from member2 where id like '%j%';/*해결*/
update member set pt=100;

update member set address='지도동 27' where id ='jbj';
update member2 set reg_date=sysdate where tel like '031%';
update book2 set bookcount=5 where bookkind='HC';
delete from book2 where bookkind='TC';
alter table book2 add ckdata varchar(40);

update book2 set ckdata='재입고요망' where bookcount<=7;/*해결*/
alter table member2 add constraint m_pk primary key(id);
alter table book2 add constraint b_pk primary key(bookid), b_fk foreign key(bookkind) references book(bookkind);/**/
update book2 set bookcount=bookcount+5 where pubdate between '2022-01' and '2022-08';/*like '2022-08%' 해결?*/
select * from member;

select * from slaes where;/**/
select * from book where bookkind='IT';
select name, tel from member where id like '%k%';
select * from sales where amount>=2;
select booktitle, bookprice, author from book where bookprice>=19000 and bookprice<30000;
select booktitle, author, bookcount from book where pubcom='한빛미디어' or pubcom='남가람북스';

select * from book where pubdate like '2022%';
select id, name, tel from member where length(password)>=5;/*아니면 where password like '_____' *like : 유사검색*/
select * from book order by pubdate asc and bookid desc;/**/
select bookkind, booktitle,pubcom from book where bookcount<10 order by author asc;

select bookid,booktitle,author from book where bookkind not in('IT','NV','TC') order by pubdate desc;
select * from sales as '구매건수';/**/
select id, count(*) as '구매건수' from sales group by id order by id asc;/**/
select bno, sum(money) as '판매금액합계' from sales group by bno;/**/
select max(money),id,bno,money from sales;/**/

select * from member;
select * from book where rownum<=5 order by bookcount;
select sno, bno, id from sales where rownum<=3 order by money;

/*구매건수문제 select id, count(*) as '구매건수' from sales group by id order by id asc*/
/*합계금액문제 select bno, sum(money) as '판매금액합계' from sales group by bno */
/*가장 큰 판매금액 문제 max*/
/*5위권문제 select * from book where rownum<=5 order by bookcount*/
/**/

/*구매한적있는 회원이름*/
select * from sales;
select distinct name from member where id in(select id from sales));/*distinct: 중복제외, select가 두개 : 서브쿼리 이중쿼리*/
select distinct a.name from member a inner join sales b on a.id=b.id;/*조인*/
select distinct a.name from member a left outer join sales b on a.id=b.id;/*left : 왼쪽테이블 출력 */

select distinct b.bno from member a right outer join sales b on a.id=b.id;/*right : 오른쪽테이블 출력*/

/*구매한적없는 회원이름*/
select distinct name from member where id not in(select id from sales));

/*회원 통합 뷰 만들기*/
create view tot_member as select * from member union select * from member2/*union : 합집합*/
select * from tot_member;

/*중복 회원 뷰 만들기*/
create view cross_member as select * from member intersect select * from memeber2;/*intersection : 교집합*/

/*회원1에만 있는 회원 뷰 만들기*/
create view ori_member as select * from minus select * from member2/*minus : 차집합*/

/**/









