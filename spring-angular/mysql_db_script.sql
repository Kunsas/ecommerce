/* create database with name spring_ecommerce */
create database spring_ecommerce;

/* use database spring_ecommerce to perform database operations */
use spring_ecommerce;

/* create table - user */
create table user(id int auto_increment not null, username varchar(255) not null, first_name varchar(255) not null, last_name varchar(255) not null, 
email varchar(255) not null, password varchar(255) not null, phone varchar(20) not null, address varchar(255) not null, usertype varchar(20) not null, primary key(id));

/* create table - category */
create table category(id int auto_increment not null, name varchar(255) not null, description varchar(255), primary key(id));

/* create table - product */
create table product(id int auto_increment not null, name varchar(255) not null, description varchar(255) not null, price double not null,
stock_quantity int not null, image_url varchar(255) not null, category_id int not null, primary key(id), foreign key(category_id) references category(id));

/* create table - order */
create table orders(id int auto_increment not null, date datetime not null, shipping_address varchar(255) not null, billing_address varchar(255) not null,
total_amount double not null, status varchar(255) not null, user_id int not null, primary key(id), foreign key(user_id) references user(id));

/* create table - order_item */
create table order_item(id int auto_increment not null, quantity int not null, unit_price double not null, order_id int not null, product_id int not null,
primary key(id), foreign key(order_id) references orders(id), foreign key(product_id) references product(id));

/* create table - cart */
create table cart(id int auto_increment not null, created_date datetime not null, user_id int not null, primary key(id), foreign key(user_id) references user(id));

/* create table - cart_item */
create table cart_item(id int auto_increment not null, quantity int not null, cart_id int not null, product_id int not null,
primary key(id), foreign key(cart_id) references cart(id), foreign key(product_id) references product(id));

/* create table - payment */
create table payment(id int auto_increment not null, date datetime not null, method varchar(255) not null, status varchar(255) not null, amount double not null, order_id int not null,
primary key(id), foreign key(order_id) references orders(id));

/* create table - review */
create table review(id int auto_increment not null, rating int not null, comment varchar(255) not null, date datetime not null, user_id int not null, product_id int not null,
primary key(id), foreign key(user_id) references user(id), foreign key(product_id) references product(id));

/* create table - wishlist */
create table wishlist(id int auto_increment not null, created_date datetime not null, user_id int not null, primary key(id), foreign key(user_id) references user(id));

/* create table - wishlist_item */
create table wishlist_item(id int auto_increment not null, wishlist_id int not null, product_id int not null,
primary key(id), foreign key(wishlist_id) references wishlist(id), foreign key(product_id) references product(id));

/* create table - discount */
create table discount(id int auto_increment not null, code varchar(255) not null, description varchar(255) not null, type varchar(255) not null, value double not null,
start_date datetime not null, end_date datetime not null,  product_id int not null, category_id int not null,
primary key(id), foreign key(product_id) references product(id), foreign key(category_id) references category(id));

/* displaying schema of tables in spring_ecommerce */
desc user;
desc category;
desc product;
desc orders;
desc order_item;
desc cart;
desc cart_item;
desc payment;
desc review;
desc wishlist;
desc wishlist_item;
desc discount;