drop table member;
create table member(id varchar2(12) primary key, -- ȸ�����̵�
password varchar2(12) not null, --��й�ȣ
name varchar2(20) not null,
address varchar2(100),
tel varchar2(20) not null,
reg_date date default sysdate);

drop table book cascade constraints;

create table book(bookid number(10) primary key,
bookkind varchar2(3) not null,
booktitle varchar2(50) not null,
bookprice number(10) not null,
bookcount number(5) not null,
author VARCHAR2(40),
pubcom VARCHAR2(40),
pubdate date);

create sequence bseq increment by 1 start with 1;

drop table sales;

create table sales(sno number primary key,
bno number(10) not null,
id varchar2(12) not null,
amount number(5) default 1,
money number,
salesday date default sysdate);

create sequence sseq increment by 1 star with 1;

commit;

insert into member values('ykh','a1234','������','������ 13','010-1111-2222','2022-09-13');
insert into member values('ihy','a3421','���Ͽ�','���ε� 888','031-2222-3333','2022 09-13');
insert into member values('ihn','b1111','���س�','�鼮�� 777','010-3333-4444','2022-09-14');
insert into member values('jbj','c456','������','���絿 178','010-4444-5555','2022-09-15');
insert into member values('jjs','z675','������','���ﵿ 75','031-4444-2222','2022-09-11');
insert into member values('cmj','q789','������','â���� 1004','010-5555-6666','2022-09-15');
insert into member values('hsy','g478','�ѽÿ�','â�ŵ� 128','010-6666-7777','2022-09-13');
insert into member values('hth','d666','������','��ŵ� 67','010-7777-8888','2022-09-14');
insert into member values('kyj','e964','������','ȭ���� 912','031-5555-2222','2022-09-05');
insert into member values('nsy','h369','������','�ﵵ�� 37','010-8888-9999','2022-09-16');

insert into book values(bseq.nextval,'IT','�̰��� �ڹٴ�',30000,10,'�ſ��','�Ѻ��̵��','2021-08-20');
insert into book values(bseq.nextval,'IT','�ڹ������߿�ũ��',31500,19,'���۰����ڵ���','�������Ͻ�','2022-08-04');
insert into book values(bseq.nextval,'NV','�Ͼ��',14400,15,'����','���е���','2022-08-03');
insert into book values(bseq.nextval,'NV','������������',12600,10,'��ȣ��','����������','2022-08-10');
insert into book values(bseq.nextval,'DV','������',15750,8,'��û','��������','2022-05-30');
insert into book values(bseq.nextval,'DV','�ڼҼ����̺�',18000,15,'����','���˵�','2022-08-25');
insert into book values(bseq.nextval,'HC','���Ź����ѱ���',17500,10,'tvn','����Ʈ������','2022-08-22');
insert into book values(bseq.nextval,'HC','�����ϱ�',14000,30,'�̼���','��Ÿ�Ͻ�','2022-07-27');
insert into book values(bseq.nextval,'TC','��¥���½ǹ�����',20000,10,'������','������','2022-02-15');
insert into book values(bseq.nextval,'TC','���������ΰ�����',25000,15,'������','�Ѻ��̵��','2020-12-21');

insert into book values(sseq.nextval,1,'ihy',1,(select bookprice from book where bookid=1)*1, sysdate);
insert into book values(sseq.nextval,2,'ykh',1,(select bookprice from book where bookid=2)*1, sysdate);
insert into book values(sseq.nextval,1,'jjs',2,(select bookprice from book where bookid=3)*2, sysdate);
insert into book values(sseq.nextval,9,'ihy',1,(select bookprice from book where bookid=4)*1, sysdate);
insert into book values(sseq.nextval,2,'cmj',5,(select bookprice from book where bookid=5)*5, sysdate);
insert into book values(sseq.nextval,2,'jjs',3,(select bookprice from book where bookid=6)*3, sysdate);
insert into book values(sseq.nextval,3,'yjh',2,(select bookprice from book where bookid=7)*2, sysdate);
insert into book values(sseq.nextval,5,'hsy',4,(select bookprice from book where bookid=8)*4, sysdate);
insert into book values(sseq.nextval,4,'nsy',8,(select bookprice from book where bookid=9)*8, sysdate);
insert into book values(sseq.nextval,1,'jbj',3,(select bookprice from book where bookid=10)*3, sysdate);
insert into book values(sseq.nextval,2,'kyj',4,(select bookprice from book where bookid=11)*4, sysdate);
insert into book values(sseq.nextval,7,'ihn',1,(select bookprice from book where bookid=12)*1, sysdate);
insert into book values(sseq.nextval,8,'hth',2,(select bookprice from book where bookid=13)*2, sysdate);
insert into book values(sseq.nextval,10,'cmj',5,(select bookprice from book where bookid=14)*5, sysdate);
insert into book values(sseq.nextval,1,'ihy',3,(select bookprice from book where bookid=15)*3, sysdate);
insert into book values(sseq.nextval,2,'cmj',2,(select bookprice from book where bookid=16)*2, sysdate);
insert into book values(sseq.nextval,2,'ihy',1,(select bookprice from book where bookid=17)*1, sysdate);
insert into book values(sseq.nextval,1,'ykh',3,(select bookprice from book where bookid=18)*3, sysdate);


