/*
 Navicat Premium Data Transfer

 Source Server         : Local MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : vc2

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 23/02/2024 04:50:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category_locations
-- ----------------------------
DROP TABLE IF EXISTS `category_locations`;
CREATE TABLE `category_locations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mall_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_locations_name_unique`(`name`, `mall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_locations
-- ----------------------------
INSERT INTO `category_locations` VALUES (1, NULL, 'Anchors', 1, NULL, '2024-02-21 23:57:45', '2024-02-21 23:57:45');
INSERT INTO `category_locations` VALUES (2, NULL, 'Entrances', 1, NULL, '2024-02-21 23:57:57', '2024-02-21 23:57:57');
INSERT INTO `category_locations` VALUES (3, NULL, 'Hallways', 1, NULL, '2024-02-21 23:58:19', '2024-02-21 23:58:19');

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `serial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_location_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `mall_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of devices
-- ----------------------------
INSERT INTO `devices` VALUES (1, 'M1FBS00001', NULL, '202223020292', NULL, 2, 2, 1, NULL, '2024-02-22 00:44:01', '2024-02-22 00:44:01');
INSERT INTO `devices` VALUES (2, 'M1FBS00002', NULL, '202222001090', NULL, 2, 2, 1, NULL, '2024-02-22 00:44:38', '2024-02-22 00:44:38');
INSERT INTO `devices` VALUES (3, 'M1FBS00003', NULL, '202222001020', NULL, 2, 2, 1, NULL, '2024-02-22 00:45:39', '2024-02-22 00:45:39');
INSERT INTO `devices` VALUES (4, 'M1FGF00004', NULL, '202222001037', NULL, 2, 4, 1, NULL, '2024-02-22 00:46:25', '2024-02-22 00:46:25');
INSERT INTO `devices` VALUES (5, 'M1FGF00005', NULL, '202222001055', NULL, 2, 4, 1, NULL, '2024-02-22 00:47:25', '2024-02-22 00:47:25');
INSERT INTO `devices` VALUES (6, 'M1FGF00006', NULL, '202222001102', NULL, 2, 4, 1, NULL, '2024-02-22 00:48:07', '2024-02-22 00:48:07');
INSERT INTO `devices` VALUES (7, 'M1FGF00007', NULL, '202222001035', NULL, 2, 4, 1, NULL, '2024-02-22 00:48:40', '2024-02-22 00:48:40');
INSERT INTO `devices` VALUES (8, 'M1FGF00008', NULL, '202222001094', NULL, 2, 4, 1, NULL, '2024-02-22 00:49:13', '2024-02-22 00:49:13');
INSERT INTO `devices` VALUES (9, 'M1FGF00009', NULL, '202222001003', NULL, 1, 3, 1, NULL, '2024-02-22 00:49:45', '2024-02-22 00:49:45');
INSERT INTO `devices` VALUES (10, 'M1FGF00010', NULL, '202222001027', NULL, 1, 3, 1, NULL, '2024-02-22 00:50:56', '2024-02-22 01:04:13');
INSERT INTO `devices` VALUES (11, 'M1FGF00011', NULL, '202222001105', NULL, 2, 4, 1, NULL, '2024-02-22 00:51:46', '2024-02-22 00:51:46');
INSERT INTO `devices` VALUES (12, 'M1FGF00012', NULL, '202222001091', NULL, 2, 4, 1, NULL, '2024-02-22 00:53:02', '2024-02-22 00:53:02');
INSERT INTO `devices` VALUES (13, 'M1FGF00013', NULL, '202222001057', NULL, 1, 3, 1, NULL, '2024-02-22 00:54:47', '2024-02-22 00:54:47');
INSERT INTO `devices` VALUES (14, 'M1FGF00014', NULL, '202222001065', NULL, 1, 3, 1, NULL, '2024-02-22 01:00:42', '2024-02-22 01:00:42');
INSERT INTO `devices` VALUES (15, 'M1FGF00015', NULL, '202223020409', NULL, 1, 3, 1, NULL, '2024-02-22 01:02:19', '2024-02-22 01:02:19');
INSERT INTO `devices` VALUES (16, 'M1FGF00016', NULL, '202222001044', NULL, 1, 3, 1, NULL, '2024-02-22 01:03:02', '2024-02-22 01:03:02');
INSERT INTO `devices` VALUES (17, 'M1FGF00017', NULL, '202222001002', NULL, 1, 3, 1, NULL, '2024-02-22 01:05:59', '2024-02-22 01:05:59');
INSERT INTO `devices` VALUES (18, 'M1FGF00018', NULL, '202222001107', NULL, 2, 4, 1, NULL, '2024-02-22 01:06:42', '2024-02-22 01:07:09');
INSERT INTO `devices` VALUES (19, 'M1FGF00019', NULL, '202222001076', NULL, 1, 3, 1, NULL, '2024-02-22 01:07:46', '2024-02-22 01:07:46');
INSERT INTO `devices` VALUES (20, 'M1FGF00020', NULL, '202222001081', NULL, 1, 3, 1, NULL, '2024-02-22 01:08:34', '2024-02-22 01:08:34');
INSERT INTO `devices` VALUES (21, 'M1FGF00021', NULL, '202222001038', NULL, 1, 3, 1, NULL, '2024-02-22 01:09:20', '2024-02-22 01:09:20');
INSERT INTO `devices` VALUES (22, 'M1FGF00022', NULL, '202222001104', NULL, 1, 3, 1, NULL, '2024-02-22 01:13:53', '2024-02-22 01:13:53');
INSERT INTO `devices` VALUES (23, 'M1FGF00023', NULL, '202222001013', NULL, 1, 3, 1, NULL, '2024-02-22 01:14:51', '2024-02-22 01:14:51');
INSERT INTO `devices` VALUES (24, 'M1FGF00024', NULL, '202222001066', NULL, 2, 4, 1, NULL, '2024-02-22 01:15:20', '2024-02-22 01:15:20');
INSERT INTO `devices` VALUES (25, 'M1FGF00025', NULL, '202222001087', NULL, 2, 4, 1, NULL, '2024-02-22 01:15:44', '2024-02-22 01:15:44');
INSERT INTO `devices` VALUES (26, 'M1FGF00026', NULL, '202222001096', NULL, 2, 4, 1, NULL, '2024-02-22 01:17:12', '2024-02-22 01:17:12');
INSERT INTO `devices` VALUES (27, 'M1FGF00027', NULL, '202222001032', NULL, 2, 4, 1, NULL, '2024-02-22 01:18:10', '2024-02-22 01:18:10');
INSERT INTO `devices` VALUES (28, 'M1FFF00028', NULL, '202223020441', NULL, 2, 7, 1, NULL, '2024-02-22 01:19:07', '2024-02-22 01:19:07');
INSERT INTO `devices` VALUES (29, 'M1FFF00029', NULL, '202222001056', NULL, 2, 7, 1, NULL, '2024-02-22 01:20:28', '2024-02-22 01:20:28');
INSERT INTO `devices` VALUES (30, 'M1FBS00030', NULL, '202222001064', NULL, 1, 1, 1, NULL, '2024-02-22 01:21:37', '2024-02-22 01:21:37');
INSERT INTO `devices` VALUES (31, 'M1FBS00031', NULL, '202222001101', NULL, 1, 1, 1, NULL, '2024-02-22 01:22:24', '2024-02-22 01:22:24');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mall_id` bigint(20) UNSIGNED NOT NULL,
  `category_location_id` bigint(20) NULL DEFAULT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinate_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coordinate_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES (1, 1, 1, 'BS', NULL, NULL, NULL, NULL, NULL, 'Basement', NULL, '2024-02-22 00:31:37', '2024-02-22 00:31:37');
INSERT INTO `locations` VALUES (2, 1, 2, 'BS', NULL, NULL, NULL, NULL, NULL, 'Basement', NULL, '2024-02-22 00:33:16', '2024-02-22 00:33:16');
INSERT INTO `locations` VALUES (3, 1, 1, 'GF', NULL, NULL, NULL, NULL, NULL, 'Ground Floor', NULL, '2024-02-22 00:34:03', '2024-02-22 00:34:03');
INSERT INTO `locations` VALUES (4, 1, 2, 'GF', NULL, NULL, NULL, NULL, NULL, 'Ground Floor', NULL, '2024-02-22 00:34:26', '2024-02-22 00:34:26');
INSERT INTO `locations` VALUES (5, 1, 2, 'OD', NULL, NULL, NULL, NULL, NULL, 'Outdoor', NULL, '2024-02-22 00:35:32', '2024-02-22 00:35:32');
INSERT INTO `locations` VALUES (6, 1, 1, 'FF', NULL, NULL, NULL, NULL, NULL, 'First Floor', NULL, '2024-02-22 00:36:41', '2024-02-22 00:36:41');
INSERT INTO `locations` VALUES (7, 1, 2, 'FF', NULL, NULL, NULL, NULL, NULL, 'First Floor', NULL, '2024-02-22 00:37:15', '2024-02-22 00:37:15');

-- ----------------------------
-- Table structure for log_apis
-- ----------------------------
DROP TABLE IF EXISTS `log_apis`;
CREATE TABLE `log_apis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `header` json NOT NULL,
  `body` json NOT NULL,
  `files` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_apis
-- ----------------------------

-- ----------------------------
-- Table structure for malls
-- ----------------------------
DROP TABLE IF EXISTS `malls`;
CREATE TABLE `malls`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `large_visitor_area` bigint(20) NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type_store` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Mall',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of malls
-- ----------------------------
INSERT INTO `malls` VALUES (1, 'ÆON Mall Deltamas', 'M1', 'Bekasi', 'Hegarmukti, Kec. Cikarang Pusat, Kabupaten Bekasi, Jawa Barat 17530', 85000, '-6.3519476', '107.1954218', NULL, 'Mall', NULL, '2024-02-21 23:55:23', '2024-02-23 04:45:31');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `menus_route_unique`(`route`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'Dashboard', 'dashboard', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (2, 'General Analysis', 'general-analysis', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (3, 'Trend By Location', 'trand-location', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (4, 'Trend By Devices', 'trand-devices', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (5, 'Demographics', 'demographics', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (6, 'Standard Deviation', 'standart-deviasi', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (7, 'Store Info', 'malls', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (8, 'Locations', 'locations', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (9, 'Devices', 'devices', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (10, 'Category Locations', 'category-locations', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (11, 'User Management', 'users', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (12, 'Menu Management', 'menus', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (13, 'Log Api', 'log', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (14, 'Heatmap', 'heatmap', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (15, 'User Profile', 'user-profile', 1, NULL, '2024-02-16 13:19:03', '2024-02-16 13:19:03');
INSERT INTO `menus` VALUES (16, 'Import Visitors', 'import-visitor', 1, NULL, '2024-02-16 14:07:09', '2024-02-16 14:07:09');
INSERT INTO `menus` VALUES (17, 'Widget', 'widgets', 1, NULL, '2024-02-18 20:21:14', '2024-02-18 20:56:02');
INSERT INTO `menus` VALUES (18, 'Anomali', 'anomalis', 1, NULL, '2024-02-18 21:12:32', '2024-02-18 21:12:32');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_01_31_072643_create_log_apis_table', 2);
INSERT INTO `migrations` VALUES (18, '2024_02_01_031123_create_devices_table', 4);
INSERT INTO `migrations` VALUES (19, '2024_02_01_031141_create_malls_table', 4);
INSERT INTO `migrations` VALUES (20, '2024_02_01_031602_create_locations_table', 4);
INSERT INTO `migrations` VALUES (21, '2024_02_01_031603_create_category_locations_table', 4);
INSERT INTO `migrations` VALUES (26, '2024_02_15_221052_create_menus_table', 6);
INSERT INTO `migrations` VALUES (31, '2024_02_18_170629_create_widgets_table', 7);
INSERT INTO `migrations` VALUES (34, '2024_01_31_172705_create_visitor_countings_table', 8);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', '2024-01-31 04:05:16', NULL, NULL, NULL, NULL, '$2y$10$RuNlmhxmUXratKx.2ZwymugJweljh3LHy/ADOsF2svR9IcHBK.TyS', 'NkzsVNKHeFhlpB82JfnQRCxu7DqtqV16I1wVJedl2ZTJLI3t7eM0WOBukjT7', NULL, '2024-01-31 04:05:16', '2024-01-31 04:05:16');
INSERT INTO `users` VALUES (2, 'admin2', 'admin2@gmail.com', NULL, '00000', 'indonesia', 'GANTENG1', 'profile_65c255dd0abce.jpg', '$2y$10$Savl0wgpUIx71SuGdXfpeecbKsGjd3zyS.fq4lEQpXRUbplj9KGH2', NULL, NULL, '2024-02-06 22:18:11', '2024-02-15 23:36:51');
INSERT INTO `users` VALUES (3, 'admin3', 'admin3@gmail.com', NULL, '08123', 'indonesia', NULL, NULL, '$2y$10$btjjobqEyijv3youcvGCK.Z7XsXBbbF4A0eJQ0LmhSC.s4WlPu9iG', NULL, NULL, '2024-02-06 22:18:49', '2024-02-06 22:18:49');
INSERT INTO `users` VALUES (4, 'admin4', 'admin4@gmail.com', NULL, '08123', 'indonesia', NULL, 'profile_65c255fedf75c.jpg', '$2y$10$PTd2JpKxe3483ralUCPTVOp30pBkUt9bOURZTzFviatwCgnDssvSy', NULL, NULL, '2024-02-06 22:53:34', '2024-02-06 22:53:34');

-- ----------------------------
-- Table structure for visitor_countings
-- ----------------------------
DROP TABLE IF EXISTS `visitor_countings`;
CREATE TABLE `visitor_countings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `category_location_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `mall_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_id_camera` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `object_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `start_datetime` datetime NULL DEFAULT NULL,
  `end_datetime` datetime NULL DEFAULT NULL,
  `enters` int(11) NULL DEFAULT NULL,
  `exits` int(11) NULL DEFAULT NULL,
  `count_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mac_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `host_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time_zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hw_platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `children_object_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `children_start_time` time NULL DEFAULT NULL,
  `children_end_time` time NULL DEFAULT NULL,
  `children_start_datetime` datetime NULL DEFAULT NULL,
  `children_end_datetime` datetime NULL DEFAULT NULL,
  `children_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `children_enters` int(11) NULL DEFAULT NULL,
  `children_exits` int(11) NULL DEFAULT NULL,
  `service_object_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `service_start_time` time NULL DEFAULT NULL,
  `service_end_time` time NULL DEFAULT NULL,
  `service_start_datetime` datetime NULL DEFAULT NULL,
  `service_end_datetime` datetime NULL DEFAULT NULL,
  `seconds_occupied` int(11) NULL DEFAULT NULL,
  `service_number_served` int(11) NULL DEFAULT NULL,
  `total_seconds_occupied` int(11) NULL DEFAULT NULL,
  `service_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unsync',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor_countings
-- ----------------------------

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_chart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reload_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `widget_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimensi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'col-xs-12 col-sm-12 col-md-6 col-lg-3 l-xl-3',
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visibility_status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widgets
-- ----------------------------
INSERT INTO `widgets` VALUES (1, 1, 'total_mall_occupancy', NULL, '1', 'Total Mall Occupancy 11', 'col-xl-4 col-sm-12', NULL, 1, NULL, '2024-02-18 18:39:11', '2024-02-18 19:22:47');
INSERT INTO `widgets` VALUES (2, 1, 'anchor_occupancy', NULL, '1', 'Anchor Occupancy', 'col-xl-4 col-sm-12', NULL, 1, NULL, '2024-02-18 18:42:30', '2024-02-18 18:42:30');
INSERT INTO `widgets` VALUES (3, 1, 'mall_occupancy', NULL, '1', 'Mall Occupancy', 'col-xl-4 col-sm-12', NULL, 1, NULL, '2024-02-18 18:43:13', '2024-02-18 18:55:14');

SET FOREIGN_KEY_CHECKS = 1;
