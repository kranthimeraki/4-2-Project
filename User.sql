create table atmospheretable(
id int auto_increment,
temperature smallint,
humidity smallint,
created_time datetime,
raining_value smallint unsigned,
PRIMARY KEY(id)
);

create table productdetailtable(
id int auto_increment,
fullname varchar(200),
color varchar(50),
mrp smallint,
discount smallint,
brand varchar(50),
waranty smallint,
podavailable boolean,
replaceperiod smallint,
category varchar(50),
PRIMARY KEY(id)
);

insert into productdetailtable(fullname,color,mrp,discount,brand,waranty,podavailable,replaceperiod,category) values('JBL wireless in-ear earphones ASDFGHJKL 13123123','Black',2500,20,'JBL',1,true,40,'Earphones');

insert into productdetailtable(fullname,color,mrp,discount,brand,waranty,podavailable,replaceperiod,category) values('Sony in-ear earphones ASDdfgd 1d3434f','Black',4300,10,'SONY',2,true,20,'Earphones');

insert into productdetailtable(fullname,color,mrp,discount,brand,waranty,podavailable,replaceperiod,category) values('JBL wireless in-ear earphones ASDFGHJKL 13123123','Black',2500,25,'boAt',0,false,40,'Headphones');

insert into productdetailtable(fullname,color,mrp,discount,brand,waranty,podavailable,replaceperiod,category) values('JBL wireless in-ear earphones ASDFGHJKL 13123123','Black',2500,20,'JBL',1,true,40,'Earphones');

insert into productdetailtable(fullname,color,mrp,discount,brand,waranty,podavailable,replaceperiod,category) values('JBL wireless in-ear earphones ASDFGHJKL 13123123','Black',2500,20,'JBL',1,true,40,'Earphones');

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(38.6,26,'2018-09-12',300);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(46.9,12,'2018-09-12',255);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(37.6,77,'2018-09-12',280);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(28.4,98,'2018-09-12',1000);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(22.6,32,'2018-09-12',800);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(59.8,51,'2018-09-12',1500);
