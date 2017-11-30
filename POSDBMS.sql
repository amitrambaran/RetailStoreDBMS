drop table customer;
drop table item;
drop table payment;
drop table discount;
drop table myorder;
drop table iteminfo;
drop view debitCustomersWithEmail;

insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (1,4164575333, 'liluzivert','yaaaaaah@hotmail.com', 'cash', 4); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (2,6478853445, 'drake','ovosound@hotmail.com', 'debit', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (3,9053443324, 'bigsean','seandon@hotmail.com', 'credit', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (4,2165478864, 'weezy','fforphenomenal@hotmail.com', 'cash', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (5,4164499345, 'rocky','asvp@hotmail.com', 'cash', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (6,6475488837, 'meekmill','dreamchasers@hotmail.com', 'debit', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (7,9054838757, 'nav','brownboy@hotmail.com', 'credit', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (8,4169671111, 'future','freebandgang@hotmail.com', 'debit', NULL); 
insert into customer(customerid, phoneno, customername, email, methodofpayment, orderid) values (9,4165673343, 'birdman','cashmoneyrecords@hotmail.com', 'cash', 5); 
insert into discount(percentage, expirydate, discountid, pricededuction, orderid) values (20.00,17122017, 5678, 5.00, 4); 
insert into myorder(orderid, total, dateofpurchase) values (4, 150, 'Oct 31 2017');
insert into myorder(orderid, total, dateofpurchase) values (5, 350, 'Oct 30 2017');
insert into item(sku, finalsale)  values (456, 'NO');
insert into item(sku, finalsale)  values (457, 'NO');
insert into item(sku, finalsale)  values (458, 'NO');
insert into item(sku, finalsale)  values (459, 'YES');
insert into iteminfo(itemname, itemprice, sku) values ('Gucci Jacket', 3000.00, 456);
insert into iteminfo(itemname, itemprice, sku) values ('Louis Pouch', 500.00, 457);
insert into iteminfo(itemname, itemprice, sku) values ('Balenciaga Duffle', 4000.00, 458);
insert into iteminfo(itemname, itemprice, sku) values ('MCM Belt', 850.00, 459);
insert into payment(debitamount, creditamount, cashamount, paymentid, orderid) values (15.00,0,0,1234,4); 



create table customer(

customerid int,
phoneno int,
customername varchar(255),
email varchar(255),
methodofpayment varchar(255),
orderid int,
primary key (customerid),
foreign key (orderid) references myorder(orderid)
);


create table myorder(

orderid int,
total FLOAT(10),
dateofpurchase varchar(255),
primary key (orderid)
);


create table item(

sku int, 
finalsale varchar(5),
primary key (sku)
);

create table iteminfo(

itemname varchar(255),
itemprice FLOAT(5),
sku int,
primary key (itemname),
foreign key (sku) references item(sku)
);

create table payment(

debitamount FLOAT(5),
creditamount FLOAT(5),
cashamount FLOAT(5),
paymentid int,
orderid int,
primary key (paymentid),
foreign key (orderid) references myorder(orderid)
);

create table discount(

percentage int,
expirydate int,
discountid int,
pricededuction FLOAT(5),
orderid int,
primary key (discountid),
foreign key (orderid) references myorder(orderid)
);


select c.customerid, c.customername, c.methodofpayment, c.orderid, o.orderid
from customer c, myorder o
where c.methodofpayment = 'cash'
and c.orderid = o.orderid;


create view debitCustomersWithEmail
as
select c.CUSTOMERID ,
c.PHONENO ,
c.CUSTOMERNAME ,
c.EMAIL ,
c.METHODOFPAYMENT 
from customer c
where c.methodofpayment = 'credit'
and c.email <> 'NULL';

select * from debitCustomersWithEmail;


SELECT * 
FROM customer 
WHERE email LIKE 'j%' 
OR methodofpayment LIKE 'cash%';

SELECT pricededuction 
FROM discount 
WHERE percentage >= 5 
AND percentage <=35;

select c.customerid, o.orderid
from customer c, myorder o
where c.orderid = o.orderid
order by customerid;


select customername, customerid from customer
where orderid > 2;

select AVG(total) from myorder;

select count(methodofpayment)
from customer
where methodofpayment = 'debit';
