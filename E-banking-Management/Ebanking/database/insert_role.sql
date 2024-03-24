use e-banking;

insert into role(role) values ('ADMIN');
insert into role(role) values ('CUSTOMER');

insert into user(firstName, lastName, gender, email, phone, nationality, city, salary, username, password)
values('Thuy Duong', 'Nguyen', 'Female', 'ntduong712@gmail.com', '0965503476', 'Viet Nam', 'Ha Noi', 5000000, 'ntduong0712', '$2a$10$70rM/ScLA.l2uDF7f6mZG.JAcK.8Ae9GnqKwLzmm5Vhd3uA4hO6ki');
insert into user(firstName, lastName, gender, email, phone, nationality, city, salary, username, password)
values('Xuan Dai', 'Nguyen', 'Male', 'daibeodeptrai@gmail.com', '0379695784', 'Viet Nam', 'Ha Noi', 10000000, 'daimiu2607', '$2a$10$70rM/ScLA.l2uDF7f6mZG.JAcK.8Ae9GnqKwLzmm5Vhd3uA4hO6ki');

insert into user_role(user_id, role_id) values (1,1);
insert into user_role(user_id, role_id) values (2,2);