Drop table bookings;
Drop table images;
Drop table swap;
Drop table apartment;
Drop table user;

Create table `user` (
`name` varchar(45) NOT NULL,
`username` varchar(45) NOT NULL,
`password` varchar(45) NOT NULL,
`phone` int NOT NULL,
`user_id` int NOT NULL AUTO_INCREMENT,
PRIMARY KEY (user_id)
);

Create table `apartment` (
`apartment_id` int NOT NULL AUTO_INCREMENT,
`name` varchar(45) NOT NULL,
`available_from` varchar(10) NOT NULL,
`available_until` varchar(10) NOT NULL,
`city` varchar(255) NOT NULL,
`address` varchar(255) NOT NULL,
`price` DECIMAL(10,2) NOT NULL,
`capacity` int NOT NULL,
`up_rent` boolean NOT NULL default 0,
`up_swap` boolean NOT NULL default 0,
`user_id` int NOT NULL,
Primary key (apartment_id),
foreign key (user_id) references `user`(user_id)
);

Create table `bookings` (
`check_in` varchar(10) NOT NULL,
`check_out` varchar(10) NOT NULL,
`apartment_id` int NOT NULL,
`user_id` int NOT NULL,
`booking_id` int NOT NULL AUTO_INCREMENT,
Primary key (booking_id),
foreign key (user_id) references `user`(user_id),
foreign key (apartment_id) references `apartment`(apartment_id)
);

Create table `swap` (
`user_id` int NOT NULL,
`apartment_id` int NOT NULL,
`swap_id` int NOT NULL AUTO_INCREMENT,
Primary key (swap_id),
foreign key (user_id) references `user`(user_id),
foreign key (apartment_id) references `apartment`(apartment_id)
);

Create table images (
`image_url` TEXT NOT NULL,
`apartment_id` int NOT NULL,
`image_id` int NOT NULL auto_increment,
Primary key (image_id),
foreign key (apartment_id) references `apartment`(apartment_id)
);

Select * from apartment;