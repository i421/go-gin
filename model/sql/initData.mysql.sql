-- 初始化角色
INSERT INTO `role`(`id`, `name`, `created_at`, `updated_at`) VALUES (1, '管理员', 1602424045, 1602424045);
INSERT INTO `role`(`id`, `name`, `created_at`, `updated_at`) VALUES (2, '用户', 1602424045, 1602424045);

-- 初始化添加 admin
INSERT INTO `user`( `name`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES ('管理员', 'admin', 'admin', '1', 1602424045, 1602424045);
INSERT INTO `role_users`( `user_id`, `role_id`, `created_at`, `updated_at`) VALUES (1, 1, 1603198355, 1603198355);
