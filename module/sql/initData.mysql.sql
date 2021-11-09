-- 初始化角色
INSERT INTO `i421`.`role`(`id`, `name`, `created_at`, `updated_at`) VALUES (1, '管理员', 1602424045, 1602424045);
INSERT INTO `i421`.`role`(`id`, `name`, `created_at`, `updated_at`) VALUES (2, '用户', 1602424045, 1602424045);

-- 初始化添加 admin
INSERT INTO `i421`.`user`( `name`, `username`, `password`, `phone`, `qq`, `status`, `created_at`, `updated_at`) VALUES ('管理员', 'admin', '8f4e328b96410d934856807460d5d791', '13540042615', '838190924', '启用', 1602424045, 1602424045);
INSERT INTO `i421`.`user2role`( `user_id`, `role_id`, `created_at`, `updated_at`) VALUES (1, 1, 1603198355, 1603198355);
