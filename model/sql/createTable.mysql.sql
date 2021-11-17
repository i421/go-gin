DROP TABLE IF EXISTS users;
CREATE TABLE users(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) COMMENT '用户姓名',
`username` VARCHAR(50) COMMENT '账号名',
`password` VARCHAR(256) COMMENT '密码',
`status` enum('1', '0') DEFAULT '1' COMMENT '1-启用, 0-禁用',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户表';

DROP TABLE IF EXISTS roles;
CREATE TABLE roles(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL COMMENT '角色名',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '角色表';

DROP TABLE IF EXISTS role_users;
CREATE TABLE role_users(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT COMMENT 'users 表 id',
`role_id` INT COMMENT 'roles 表 id',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户关联角色表';

DROP TABLE IF EXISTS companys;
CREATE TABLE companys(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT,
`name` varchar(50) COMMENT '公司名称',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '公司';

