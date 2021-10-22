-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Fri 22 Oct 2021 at 09:00 GMT+7
-- Server version: 5.7.23
-- PHP Version: 8.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

drop database if exists facebook_mini;
CREATE DATABASE facebook_mini
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

use facebook_mini;

create table if not exists users (
	u_id int auto_increment,
    u_name nvarchar(100),
    u_birthday date not null,
    u_email varchar(100) not null,
    u_password varchar(30) not null,
    u_theme varchar(10),
    u_log varchar(260),
    PRIMARY KEY (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists friendships (
	f_id int auto_increment,
    f_u1_id int not null,
    f_u2_id int not null,
    f_status int not null, /* 1: pending, 2: friend, when the value is null, this row will be deleted */
    PRIMARY KEY (f_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists posts (
	p_id int auto_increment,
    p_u_id int not null,
    p_content text not null,
    p_img_link text default null,
    p_datetime datetime default current_timestamp,
    PRIMARY KEY (p_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists personal_chats (
	pc_id int auto_increment,
    pc_u1_id int not null,
    pc_u2_id int not null,
    pc_content text not null,
    pc_img_link text default null,
    pc_datetime datetime default current_timestamp,
    PRIMARY KEY (pc_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists fb_groups (
	fbg_id int auto_increment,
    fbg_name nvarchar(100),
    PRIMARY KEY (fbg_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists fb_group_member (
	fbg_id int,
    g_u_id int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists group_chats (
	gc_id int auto_increment,
    u_id int,
    g_id int,
    gc_content text not null,
    gc_img_link text default null,
    gc_date datetime default current_timestamp,
    PRIMARY KEY (gc_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Constraints for all Table
alter table friendships
add constraint fk_friendships_users1 foreign key(f_u1_id) references users(u_id),
add constraint fk_friendships_users2 foreign key(f_u2_id) references users(u_id);
commit;

alter table posts
add constraint fk_posts_users foreign key(p_u_id) references users(u_id);
commit;

alter table personal_chats
add constraint fk_personalchat_user1 foreign key(pc_u1_id) references users(u_id),
add constraint fk_personalchat_user2 foreign key(pc_u2_id) references users(u_id);
commit;

alter table group_chats
add constraint fk_groupchat_user foreign key(u_id) references users(u_id),
add constraint fk_groupchat_fbgroups foreign key(g_id) references fb_groups(fbg_id);
commit;

alter table fb_group_member
add constraint fk_groupmember_users foreign key(g_u_id) references users(u_id),
add constraint fk_groupmember_fbgroups foreign key(fbg_id) references fb_groups(fbg_id);
commit;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;