DROP TABLE IF EXISTS user;
CREATE TABLE user(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) COMMENT '用户姓名',
`username` VARCHAR(50) COMMENT '账号名',
`password` VARCHAR(256) COMMENT '密码',
`phone` VARCHAR(11) COMMENT '联系电话',
`qq` VARCHAR(11) COMMENT 'QQ',
`status` enum('启用', '禁用') DEFAULT '启用' COMMENT '1-启用, 2-禁用',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户表';

DROP TABLE IF EXISTS role;
CREATE TABLE role(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL COMMENT '角色名',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '角色表';

DROP TABLE IF EXISTS user2role;
CREATE TABLE user2role(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`user_id` INT COMMENT 'crm_user 表 id',
`role_id` INT COMMENT 'crm_role 表 id',
`created_at` INT,
`updated_at` INT
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户关联角色表';

