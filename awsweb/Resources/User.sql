create table atmospheretable(
id int auto_increment,
temperature smallint,
humidity smallint,
created_time datetime,
PRIMARY KEY (id)
);

insert into atmospheretable(temperature,humidity,created_time) values(38.6,26,'2018-09-12');

insert into atmospheretable(temperature,humidity,created_time) values(46.9,12,'2018-09-12');

insert into atmospheretable(temperature,humidity,created_time) values(37.6,77,'2018-09-12');

insert into atmospheretable(temperature,humidity,created_time) values(28.4,98,'2018-09-12');

insert into atmospheretable(temperature,humidity,created_time) values(22.6,32,'2018-09-12');

insert into atmospheretable(temperature,humidity,created_time) values(59.8,51,'2018-09-12');