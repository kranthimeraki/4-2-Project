create table atmospheretable(
id int auto_increment,
temperature smallint,
humidity smallint,
created_time datetime,
raining_value smallint unsigned,
PRIMARY KEY(id)
);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(38.6,26,'2018-09-12',300);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(46.9,12,'2018-09-12',255);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(37.6,77,'2018-09-12',280);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(28.4,98,'2018-09-12',1000);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(22.6,32,'2018-09-12',800);

insert into atmospheretable(temperature,humidity,created_time,raining_value) values(59.8,51,'2018-09-12',1500);
