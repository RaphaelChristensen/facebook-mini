use facebook_mini;

create table if not exists users (
	u_id int auto_increment,
    u_name nvarchar(100),
    u_birthday date not null,
    u_email varchar(100) not null,
    u_password varchar(30) not null,
    u_theme varchar(10),
    u_log varchar(260)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists frendships (
	f_id int auto_increment,
    f_u1_id int not null,
    f_u2_id int not null,
    f_status int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists posts (
	p_id int auto_increment,
    p_u_id int not null,
    p_content text not null,
    p_img_link text,
    p_datetime datetime default current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists personal_chats (
	pc_id int auto_increment,
    pc_u1_id int not null,
    pc_u2_id int not null,
    pc_content text not null,
    pc_img_link text,
    pc_datetime datetime default current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists fb_groups (
	fbg_id int auto_increment,
    fbg_name nvarchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists fb_group_member (
	fbg_id int auto_increment,
    g_u_id int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists group_chats (
	gc_id int auto_increment,
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


