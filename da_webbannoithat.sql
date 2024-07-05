/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : da_webbannoithat

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 05/07/2024 21:34:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `type` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_category_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_category_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES (10, 'Bánh sinh nhật', 'banh-sinh-nhat', 0, 2, 1, 1512296644, 1, 1719724240, 1);
INSERT INTO `tbl_category` VALUES (11, 'Gateaux Kem Tươi', 'gateaux-kem-tuoi', 10, 2, 1, 1512614886, 1, 1719724293, 1);
INSERT INTO `tbl_category` VALUES (12, 'Bánh mỳ  Bánh mặn', 'banh-my-banh-man', 0, 2, 1, 1513096449, 1, 1719724250, 1);
INSERT INTO `tbl_category` VALUES (13, 'Công nghệ', 'cong-nghe', 0, 1, 1, 1513183416, 1, 1513936783, 1);
INSERT INTO `tbl_category` VALUES (14, 'Tin tức', 'tin-tuc', 13, 1, 1, 1513183490, 1, 1513936639, 1);
INSERT INTO `tbl_category` VALUES (15, 'Gateaux Kem Bơ', 'gateaux-kem-bo', 10, 2, 1, 1513254068, 1, 1719724301, 1);
INSERT INTO `tbl_category` VALUES (16, 'Cookies  Minicakes', 'cookies-minicakes', 0, 2, 1, 1719724281, 1, 1719724281, 1);

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `buy` int NOT NULL DEFAULT 0,
  `code_active` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL,
  `subcribe` int NOT NULL DEFAULT 0,
  `create_at` int NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES (7, 'Phan Văn Huy', 'phantam.t10@gmail.co', 'Tân Yên - Bắc Giang ', '01656788365', 1, '', '', 1, 1513859014);
INSERT INTO `tbl_customer` VALUES (8, 'Phan Văn Tâm   ', 'phantam.t10@gmail.com', 'Phú Đô - Nam Từ Liêm - Hà Nội', '01656788365', 0, '', '', 1, 1515571390);
INSERT INTO `tbl_customer` VALUES (9, NULL, 'vuvanxuan195@gmail.com', NULL, NULL, 0, '3772facf7eaae060c1a23f5dc62cdcde', NULL, 0, 0);
INSERT INTO `tbl_customer` VALUES (10, 'Nguyễn Quốc Khánh', 'quockhanh01091@gmail.com', 'H9', '0971586159', 1, '', '', 1, 1719411039);

-- ----------------------------
-- Table structure for tbl_detail_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detail_order`;
CREATE TABLE `tbl_detail_order`  (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `total_price` int NOT NULL,
  `connect_product` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `oreder_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `tbl_detail_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_detail_order
-- ----------------------------
INSERT INTO `tbl_detail_order` VALUES (85, 'Laptop HP Probook 440 G2 LED Backlit', 13230000, 1, 13230000, 7, 1);
INSERT INTO `tbl_detail_order` VALUES (86, 'Motorola Moto G5S Plus', 6990000, 1, 6990000, 11, 2);
INSERT INTO `tbl_detail_order` VALUES (87, 'Điện thoại iPhone 8 64G', 20990000, 1, 20990000, 5, 3);
INSERT INTO `tbl_detail_order` VALUES (88, 'Điện thoại iPhone 8 64G', 20990000, 2, 41980000, 5, 4);
INSERT INTO `tbl_detail_order` VALUES (89, 'Laptop HP Probook 440', 9000000, 1, 9000000, 6, 4);
INSERT INTO `tbl_detail_order` VALUES (90, 'Laptop HP Probook 440 G2 LED Backlit', 13230000, 1, 13230000, 7, 5);
INSERT INTO `tbl_detail_order` VALUES (91, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 6);
INSERT INTO `tbl_detail_order` VALUES (92, 'Samsung Galaxy A5', 6390000, 1, 6390000, 12, 7);
INSERT INTO `tbl_detail_order` VALUES (93, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 8);
INSERT INTO `tbl_detail_order` VALUES (94, 'Điện thoại iPhone 8 64G', 20990000, 1, 20990000, 5, 8);
INSERT INTO `tbl_detail_order` VALUES (95, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 9);
INSERT INTO `tbl_detail_order` VALUES (96, 'Điện thoại iPhone X 64GB', 26990000, 1, 26990000, 4, 10);

-- ----------------------------
-- Table structure for tbl_filter
-- ----------------------------
DROP TABLE IF EXISTS `tbl_filter`;
CREATE TABLE `tbl_filter`  (
  `filter_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int NOT NULL COMMENT '1=>filter by price .2=> filter by category',
  `max_price` int NULL DEFAULT NULL,
  `min_price` int NULL DEFAULT 0,
  `cat_id` int NULL DEFAULT NULL,
  `create_at` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`filter_id`) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_filter_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_filter_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_filter_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_filter
-- ----------------------------
INSERT INTO `tbl_filter` VALUES (11, 'Từ 1.000.000đ đến 5.000.000đ', 1, 5000000, 1000000, NULL, 1512573657, 1, 1, 1515631537, 1);
INSERT INTO `tbl_filter` VALUES (13, 'Máy tính', 2, NULL, NULL, 12, 1512573802, 3, 1, 1513361285, 1);
INSERT INTO `tbl_filter` VALUES (14, 'Điện thoại', 2, NULL, NULL, 10, 1513137088, 3, 1, 1513937289, 1);
INSERT INTO `tbl_filter` VALUES (22, 'Từ 5.000.000 đến 10.000.000', 1, 10000000, 5000000, NULL, 1515631367, 1, 1, 1515631367, 1);
INSERT INTO `tbl_filter` VALUES (23, 'Từ 10.000.000 đến 15.000.000', 1, 15000000, 10000000, NULL, 1515631491, 1, 1, 1515631491, 1);

-- ----------------------------
-- Table structure for tbl_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_history`;
CREATE TABLE `tbl_history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `happen_at` int NOT NULL,
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_history
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_media
-- ----------------------------
DROP TABLE IF EXISTS `tbl_media`;
CREATE TABLE `tbl_media`  (
  `media_id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `caption` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `id_connect` int NULL DEFAULT 0,
  `active` int NOT NULL DEFAULT 2,
  `type` int NOT NULL,
  `create_at` int NOT NULL,
  `create_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`media_id`) USING BTREE,
  INDEX `id_connect`(`id_connect` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_media
-- ----------------------------
INSERT INTO `tbl_media` VALUES (1, 'public/images/sytem/post.jpg', 'Ảnh mặc định cho bài viết', NULL, 0, 3, 3, 999999999, 1);
INSERT INTO `tbl_media` VALUES (2, 'public/images/sytem/product.jpg', 'Ảnh mặc định cho sản phẩm', NULL, 0, 3, 2, 999999999, 1);
INSERT INTO `tbl_media` VALUES (3, 'public/images/sytem/avatar.jpg', 'Ảnh mặc định cho người dùng ', 'Ảnh mặc định cho người dùng ', 0, 3, 1, 11111111, 1);
INSERT INTO `tbl_media` VALUES (184, 'public/images/product/product(copy-1).png', 'Product', 'undefined', 1, 1, 3, 1512296605, 1);
INSERT INTO `tbl_media` VALUES (186, 'public/images/product/product(copy-5).jpg', 'Product', 'undefined', 1, 1, 3, 1512296757, 1);
INSERT INTO `tbl_media` VALUES (216, 'public/images/product/product.jpg', 'Product', 'undefined', 1, 1, 3, 1512446214, 1);
INSERT INTO `tbl_media` VALUES (220, 'public/images/product/product(copy-2).jpg', 'Product', 'undefined', 1, 1, 3, 1512449268, 1);
INSERT INTO `tbl_media` VALUES (222, 'public/images/product/product(copy-1).jpg', 'Product', 'undefined', 1, 1, 3, 1512456009, 1);
INSERT INTO `tbl_media` VALUES (231, 'public/images/product/product.png', 'Product', 'undefined', 1, 1, 3, 1512469668, 1);
INSERT INTO `tbl_media` VALUES (241, 'public/images/avatar/phan-van-khuong(copy-1).png', 'Phan Văn Khương', 'undefined', 1, 1, 1, 1512844286, 1);
INSERT INTO `tbl_media` VALUES (257, 'public/images/product/tu-dau-giuong-go-moho-vline-801.png', 'Tủ Đầu Giường Gỗ MOHO VLINE 801', NULL, 5, 1, 3, 1513062246, 1);
INSERT INTO `tbl_media` VALUES (260, 'public/images/product/tu-dau-giuong-go-moho-vline-801(copy-1).png', 'Tủ Đầu Giường Gỗ MOHO VLINE 801', NULL, 5, 1, 3, 1513062274, 1);
INSERT INTO `tbl_media` VALUES (261, 'public/images/product/mien-phi-van-chuyen(copy-1).png', 'Miễn phí vận chuyển', 'undefined', 1, 1, 3, 1513100331, 1);
INSERT INTO `tbl_media` VALUES (265, 'public/images/post/oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-khuon-mat(copy-1).png', 'OPPO A83 rò rỉ thông số cấu hình sử dụng bảo mật khuôn mặt', 'undefined', 1, 1, 2, 1513183552, 1);
INSERT INTO `tbl_media` VALUES (298, 'public/images/product/dat-hang-online(copy-1).png', 'Đặt hàng online', 'undefined', 5, 1, 3, 1513697680, 1);
INSERT INTO `tbl_media` VALUES (314, 'public/images/post/dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth(copy-1).png', 'Điện thoại cơ bản hỗ trợ 4G của Nokia vừa đạt chứng nhận Bluetooth', 'undefined', 2, 1, 2, 1513960285, 5);
INSERT INTO `tbl_media` VALUES (315, 'public/images/product/mien-phi-van-chuyen(copy-1).png', 'Miễn phí vận chuyển', NULL, 5, 1, 3, 1515574694, 1);
INSERT INTO `tbl_media` VALUES (316, 'public/images/product/slide-1.png', 'Slide 1', '', 1, 1, 3, 1515586065, 1);
INSERT INTO `tbl_media` VALUES (317, 'public/images/product/slide-3.png', 'Slide 3', '', 2, 1, 3, 1515586205, 1);
INSERT INTO `tbl_media` VALUES (318, 'public/images/product/thanh-toan-nhanh.png', 'Thanh toán nhanh', NULL, 6, 1, 3, 1515629046, 1);
INSERT INTO `tbl_media` VALUES (319, 'public/images/product/tiet-kiem-hon.png', 'Tiết kiệm hơn', NULL, 7, 1, 3, 1515629094, 1);
INSERT INTO `tbl_media` VALUES (320, 'public/images/product/tu-van-247(copy-1).png', 'Tư vấn 24/7', NULL, 8, 1, 3, 1515629151, 1);
INSERT INTO `tbl_media` VALUES (321, 'public/images/product/dat-hang-online.png', 'Đặt hàng online', NULL, 9, 1, 3, 1515629218, 1);
INSERT INTO `tbl_media` VALUES (323, 'public/images/product/3499704f027336546022b340f1e45304.jpg', NULL, NULL, 0, 2, 3, 1517468300, 1);
INSERT INTO `tbl_media` VALUES (325, 'public/images/product/5b00c11f36a0a3a3656165c704773c2c.jpg', NULL, NULL, 0, 2, 3, 1517547215, 1);
INSERT INTO `tbl_media` VALUES (326, 'public/images/product/giuong-ngu-go-tram-moho-vline-601-nhieu-kich-thuoc.png', 'Giường Ngủ Gỗ Tràm MOHO VLINE 601 Nhiều Kích Thước', NULL, 18, 1, 3, 1719416458, 1);
INSERT INTO `tbl_media` VALUES (327, 'public/images/avatar/quoc-khanh.png', 'Quoc Khanh', NULL, 1, 1, 1, 1719466156, 1);
INSERT INTO `tbl_media` VALUES (328, 'public/images/product/slide-2.png', 'Slide 2', '', 3, 1, 3, 1719671204, 1);

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` int NOT NULL COMMENT '1 => page .2 => cat_post. 3 => cat_product',
  `connect_to` int NULL DEFAULT NULL,
  `parent_id` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `location` int NOT NULL COMMENT '1=> header . 2=> footer 3- sidebar 4-> response',
  `ordinal` int NOT NULL,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_menu_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES (3, 'Chính sách trả góp', 1, 2, 6, 1, 'where-does-it-come-from.html', 2, 1, 1512619090, 1513757048, 1, 1);
INSERT INTO `tbl_menu` VALUES (6, 'Chính sách mua hàng', 1, 2, 0, 1, 'where-does-it-come-from.html', 2, 1, 1512982583, 1513756153, 1, 1);
INSERT INTO `tbl_menu` VALUES (7, 'Chính sách bảo hành - đổi trả', 1, 6, 6, 1, 'why-do-we-use-i.html', 2, 4, 1512985619, 1513756987, 1, 1);
INSERT INTO `tbl_menu` VALUES (8, 'Quy định - chính sách', 1, 2, 6, 1, 'where-does-it-come-from.html', 2, 3, 1513015664, 1513756996, 1, 1);
INSERT INTO `tbl_menu` VALUES (9, 'Cookies Minicakes', 3, 10, 0, 1, 'san-pham/banh-sinh-nhat', 1, 4, 1513016412, 1719724357, 1, 1);
INSERT INTO `tbl_menu` VALUES (10, 'Tin tức', 2, 13, 0, 1, 'cong-nghe', 1, 5, 1513303403, 1515585082, 1, 1);
INSERT INTO `tbl_menu` VALUES (11, 'Phòng ngủ', 3, 10, 0, 1, 'san-pham/phong-ngu', 3, 1, 1513303781, 1719672818, 1, 1);
INSERT INTO `tbl_menu` VALUES (12, 'Giường ngủ', 3, 15, 11, 1, 'san-pham/giuong-ngu', 3, 2, 1513307289, 1719672833, 1, 1);
INSERT INTO `tbl_menu` VALUES (15, 'Máy tính', 3, 12, 0, 1, 'san-pham/may-tinh', 3, 1, 1513550602, 1513758319, 1, 1);
INSERT INTO `tbl_menu` VALUES (19, 'Tablet', 3, 15, 0, 1, 'san-pham/dien-thoai-oppo', 3, 1, 1515584687, 1515584687, 1, 1);
INSERT INTO `tbl_menu` VALUES (20, 'Bánh sinh nhật', 3, 10, 0, 1, 'san-pham/phong-ngu', 1, 2, 1515584830, 1719724193, 1, 1);
INSERT INTO `tbl_menu` VALUES (21, 'Trang chủ', 4, NULL, 0, 1, 'trang-chu.html', 1, 1, 1515584958, 1515585040, 1, 1);
INSERT INTO `tbl_menu` VALUES (22, 'Bánh mỳ & Bánh mặn', 3, 12, 0, 1, 'san-pham/phong-khach', 1, 3, 1515585017, 1719724227, 1, 1);
INSERT INTO `tbl_menu` VALUES (23, 'Tai nghe', 3, 10, 0, 1, 'san-pham/dien-thoai', 3, 1, 1515585611, 1515585611, 1, 1);
INSERT INTO `tbl_menu` VALUES (24, 'Tin tức', 2, 13, 0, 1, 'tin-tuc/cong-nghe', 3, 1, 1515585645, 1515585645, 1, 1);
INSERT INTO `tbl_menu` VALUES (25, 'Tủ quần áo', 3, 11, 11, 1, 'san-pham/tu-quan-ao', 3, 1, 1515585696, 1719672857, 1, 1);
INSERT INTO `tbl_menu` VALUES (26, 'Phòng ngủ', 3, 10, 0, 1, 'san-pham/phong-ngu', 4, 1, 1515627849, 1719672754, 1, 1);
INSERT INTO `tbl_menu` VALUES (28, 'Giường ngủ', 3, 15, 26, 1, 'san-pham/giuong-ngu', 4, 1, 1515627981, 1719672772, 1, 1);
INSERT INTO `tbl_menu` VALUES (29, 'Máy tính', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628008, 1515628008, 1, 1);
INSERT INTO `tbl_menu` VALUES (30, 'Tablet', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628036, 1515628036, 1, 1);
INSERT INTO `tbl_menu` VALUES (31, 'Tai nghe', 3, 12, 0, 1, 'san-pham/may-tinh', 4, 1, 1515628065, 1515628065, 1, 1);
INSERT INTO `tbl_menu` VALUES (32, 'Điện thoại sam sung', 3, 10, 0, 2, 'san-pham/dien-thoai', 1, 1, 1520182017, 1520182017, 1, 1);
INSERT INTO `tbl_menu` VALUES (33, 'Phòng khách', 3, 12, 0, 1, 'san-pham/phong-khach', 3, 3, 1719672952, 1719672952, 1, 1);

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `code_order` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `buyer` int NOT NULL,
  `active` int NOT NULL DEFAULT 3,
  `payment_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code_active` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `total_price` int NOT NULL,
  `total_qty` int NOT NULL,
  `create_at` int NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `code_order`(`code_order` ASC) USING BTREE,
  INDEX `buyer`(`buyer` ASC) USING BTREE,
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES (1, 'VSZ-1', 7, 3, 'direct-payment', '235980b03cfc7ffd9f1d6468a7d382dd', 13230000, 1, 1513858271);
INSERT INTO `tbl_order` VALUES (2, 'VSZ-2', 7, 3, 'direct-payment', '', 6990000, 1, 1513859014);
INSERT INTO `tbl_order` VALUES (3, 'VSZ-3', 8, 4, 'direct-payment', '', 20990000, 1, 1513859936);
INSERT INTO `tbl_order` VALUES (4, 'VSZ-4', 8, 3, 'direct-payment', 'dca802c97173fb76e5ca1eea09a2ca68', 50980000, 3, 1515560301);
INSERT INTO `tbl_order` VALUES (5, 'VSZ-5', 8, 2, 'direct-payment', '6b17ccf125e5f88ef6c8e2fbaca16a6f', 13230000, 1, 1515571390);
INSERT INTO `tbl_order` VALUES (6, 'VSZ-6', 10, 3, 'direct-payment', '102f2533ac7b357cf50388192d5742ce', 26990000, 1, 1719410402);
INSERT INTO `tbl_order` VALUES (7, 'VSZ-7', 10, 3, 'direct-payment', '1c69170ed0a2289ae3c3e8a30d77ea84', 6390000, 1, 1719410564);
INSERT INTO `tbl_order` VALUES (8, 'VSZ-8', 10, 3, 'direct-payment', 'f622f3b491f8dfcb4c38248b3ea0e562', 47980000, 2, 1719410722);
INSERT INTO `tbl_order` VALUES (9, 'VSZ-9', 10, 3, 'direct-payment', 'a45e7fad1e89e9911c4df5ff49c4783e', 26990000, 1, 1719410993);
INSERT INTO `tbl_order` VALUES (10, 'VSZ-10', 10, 2, 'direct-payment', '', 26990000, 1, 1719411039);

-- ----------------------------
-- Table structure for tbl_page
-- ----------------------------
DROP TABLE IF EXISTS `tbl_page`;
CREATE TABLE `tbl_page`  (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `modify_by` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`page_id`) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_page_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_page_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_page
-- ----------------------------
INSERT INTO `tbl_page` VALUES (1, 'giới thiệu', 'gioi-thieu', '<p>shop đồ điện tử vs shop</p>\r\n', 1, 1520149189, 1, 1, 1520149189);

-- ----------------------------
-- Table structure for tbl_post
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post`  (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumbnail` int NOT NULL,
  `cat_id` int NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `view` int NULL DEFAULT 1,
  `create_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_at` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `thumbnail`(`thumbnail` ASC) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  INDEX `creat_by`(`create_by` ASC) USING BTREE,
  CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_2` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_3` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_post_ibfk_4` FOREIGN KEY (`thumbnail`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES (1, 'OPPO A83 rò rỉ thông số cấu hình sử dụng bảo mật khuôn mặt', '            Đầu th&aacute;ng 12 vừa qua, cơ quan TENAA đ&atilde; thừa nhận sự xuất hiện của OPPO A83 với thiết kế to&agrave;n m&agrave;n h&igrave;nh. Mới đ&acirc;y, nguồn tin r&ograve; rỉ lại cho ch&uacute;ng ta...\r\n        ', '<h2 dir=\"ltr\">Đầu th&aacute;ng 12 vừa qua, cơ quan&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"TENAA\" type=\"TENAA\">TENAA</a>&nbsp;đ&atilde; thừa nhận sự xuất hiện của&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/tim-kiem?key=OPPO+A83\" target=\"_blank\" title=\"OPPO A83 \" type=\"OPPO A83 \">OPPO A83</a>với thiết kế m&agrave;n h&igrave;nh tr&agrave;n viền. Mới đ&acirc;y, nguồn tin r&ograve; rỉ lại cho ch&uacute;ng ta biết th&ecirc;m cấu h&igrave;nh của m&aacute;y.</h2>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn4.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-2_600x459.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Theo đ&oacute;, OPPO A83 sẽ c&oacute; m&agrave;n h&igrave;nh 5.7 inch HD+ tỉ lệ 18:9 đang ng&agrave;y c&agrave;ng thịnh h&agrave;nh, trang bị bộ vi xử l&yacute; Helio P23 đi k&egrave;m 2 GB RAM + 16 GB ROM (hỗ trợ khe cắm thẻ nhớ microSD).</p>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn1.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-3_600x512.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p dir=\"ltr\">Nh&igrave;n v&agrave;o những h&igrave;nh ảnh được cung cấp c&oacute; thể thấy rằng OPPO A83 kh&ocirc;ng được t&iacute;ch hợp cảm biến v&acirc;n tay. Thay v&agrave;o đ&oacute;, nhiều người tin rằng m&aacute;y sẽ sử dụng chức năng bảo mật nhận diện khu&ocirc;n mặt. Ngo&agrave;i ra, sản phẩm n&agrave;y c&ograve;n sở hữu camera trước sau 5/13 MP v&agrave; vi&ecirc;n pin dung lượng 3.180 mAh.</p>\r\n\r\n<p><img alt=\"Thông tin rò rỉ về cấu hình của OPPO A83\" src=\"https://cdn3.tgdd.vn/Files/2017/12/13/1050119/oppo-a83-leak-1_600x291.jpg\" title=\"Thông tin rò rỉ về cấu hình của OPPO A83\" /></p>\r\n\r\n<p>Th&ocirc;ng số cấu h&igrave;nh của tin đồn n&agrave;y ho&agrave;n to&agrave;n ph&ugrave; hợp với những th&ocirc;ng tin của cơ quan TENAA cung cấp từ trước đ&oacute;. Chưa hết, trang&nbsp;<a href=\"http://playfuldroid.com/oppo-a83-specs-surface-may-arrive-with-facial-recognition-instead-of-fingerprint-scanner/\" rel=\"nofollow\" target=\"_blank\" title=\"playfuldroid \" type=\"playfuldroid \">playfuldroid</a>&nbsp;c&ograve;n cho biết th&ecirc;m, OPPO A83 c&oacute; k&iacute;ch thước 150.5 x73.1 x 7.7 mm, xuất hiện với t&ugrave;y chọn m&agrave;u v&agrave;ng v&agrave; đen cho người d&ugrave;ng chọn lựa.</p>\r\n\r\n<p dir=\"ltr\">Dự kiến, OPPO sẽ c&ocirc;ng bố OPPO A83 v&agrave;o ng&agrave;y 30/12 tới với gi&aacute; b&aacute;n khoảng 1.199 NDT (gần 4.1 triệu đồng).</p>\r\n', 265, 14, 'oppo-a83-ro-ri-thong-so-cau-hinh-su-dung-bao-mat-k', 1, 31, 1513183556, 1, 1513953229, 1);
INSERT INTO `tbl_post` VALUES (2, 'Điện thoại cơ bản hỗ trợ 4G của Nokia vừa đạt chứng nhận Bluetooth', 'Một v&agrave;i th&ocirc;ng tin gần nhất cho thấy, HMD sắp ra mắt một điện thoại &quot;cục gạch&quot; hỗ trợ 4G. V&agrave; mới nhất, c&aacute;c model TA-1047, TA-1060 đ&atilde; đạt chứng nhận tại&nbsp;FCC. Dự kiến đ&acirc;y ch&iacute;nh l&agrave; những điện thoại cơ bản hỗ trợ 4G tuy kh&ocirc;ng phải l&agrave; smartphone.', '<h2>Một v&agrave;i th&ocirc;ng tin gần nhất cho thấy, HMD sắp ra mắt một điện thoại &quot;cục gạch&quot; hỗ trợ 4G. V&agrave; mới nhất, c&aacute;c model TA-1047, TA-1060 đ&atilde; đạt chứng nhận tại&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/fcc-ccc-la-gi-vi-sao-smartphone-muon-ban-ra-phai-duoc-ho-chung-nhan--1024896\" target=\"_blank\" title=\"FCC\">FCC</a>. Dự kiến đ&acirc;y ch&iacute;nh l&agrave; những điện thoại cơ bản hỗ trợ 4G tuy kh&ocirc;ng phải l&agrave; smartphone.</h2>\r\n\r\n<p>Theo&nbsp;<a href=\"https://www.gizmochina.com/2017/12/21/4g-nokia-feature-phone-receives-bluetooth-sig-certification-launch-nearing/\" rel=\"nofollow\" target=\"_blank\" title=\"Nokia\">gizmochina</a>, mẫu điện thoại cơ bản hỗ trợ 4G của&nbsp;<a href=\"https://www.thegioididong.com/dtdd-nokia\" target=\"_blank\" title=\"Nokia \">Nokia</a>&nbsp;cũng vừa đạt chứng nhận tại tổ chức Bluetooth SIG, điều n&agrave;y chứng tỏ m&aacute;y đ&atilde; sẵn s&agrave;ng ra mắt.</p>\r\n\r\n<p>Bluetooth SIG đ&atilde; chứng nhận 5 model gồm: Nokia TA-1047, TA-1060, TA-1056, TA-1079 v&agrave; TA-1066. Dường như đ&acirc;y l&agrave; 5 biến thể của mẫu điện thoại nghe gọi sắp ra mắt.</p>\r\n\r\n<p><img alt=\"Điện thoại cục gạch Nokia hỗ trợ 4G đạt chứng nhận Bluetooth\" src=\"https://cdn.tgdd.vn/Files/2017/12/21/1052290/nokia-2_800x300.jpg\" title=\"Điện thoại cục gạch Nokia hỗ trợ 4G đạt chứng nhận Bluetooth\" /></p>\r\n\r\n<p>Dự kiến chiếc điện thoại mới n&agrave;y sẽ l&ecirc;n kệ ở nhiều thị trường kh&aacute;c nhau với 2 phi&ecirc;n bản l&agrave; 1 SIM v&agrave; 2 SIM. Ngo&agrave;i ra, phần m&ocirc; tả phần mềm cho thấy m&aacute;y kh&ocirc;ng chạy Android, rất c&oacute; thể sẽ t&iacute;ch hợp hệ điều h&agrave;nh series 30+ Feature OS tương tự như&nbsp;<a href=\"https://www.thegioididong.com/dtdd/nokia-3310-2017\" target=\"_blank\" title=\"Nokia 3310\">Nokia 3310</a>&nbsp;(2017).</p>\r\n\r\n<p>Danh s&aacute;ch tr&ecirc;n FCC cho thấy m&aacute;y c&oacute; k&iacute;ch thước l&agrave; 133 x 68 mm. N&oacute; được suy đo&aacute;n sẽ sử dụng b&agrave;n ph&iacute;m QWERTY giống với Nokia E72.</p>\r\n', 314, 14, 'dien-thoai-co-ban-ho-tro-4g-cua-nokia-vua-dat-chung-nhan-bluetooth', 2, 24, 1513960290, 5, 1513960503, 5);

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `favorite` int NOT NULL DEFAULT 0,
  `name` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `percen` int NULL DEFAULT 0,
  `thumb` int NOT NULL,
  `img_involve` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `depict` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int NOT NULL,
  `cat_id` int NOT NULL,
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `create_at` int NOT NULL,
  `total_product` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `discount` int NULL DEFAULT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `cat_id`(`cat_id` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`modify_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
INSERT INTO `tbl_product` VALUES (5, 1, 'Tủ Đầu Giường Gỗ MOHO VLINE 801', 'tu-dau-giuong-go-moho-vline-801', 36, 257, '[\"260\"]', '<p><a href=\"https://moho.com.vn/collections/tu-dau-giuong\" target=\"_blank\">TỦ ĐẦU GIƯỜNG</a>&nbsp;GỖ MOHO VLINE 801</p>\r\n\r\n<h2><strong>1. TH&Ocirc;NG SỐ KỸ THUẬT</strong></h2>\r\n\r\n<p><img src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-1_903be67e39654dfca64f8adecdfb6103.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>2. CHI TIẾT VẬT&nbsp;LIỆU</strong></h2>\r\n\r\n<p><strong>Gỗ c&ocirc;ng nghiệp</strong></p>\r\n\r\n<p>MOHO sử dụng&nbsp;<strong>100%</strong>&nbsp;chất liệu&nbsp;gỗ c&ocirc;ng nghiệp (PB, MDF) đạt&nbsp;<strong><u><a href=\"https://moho.com.vn/blogs/news/noi-that-moho-dat-chuan-carb-p2-an-toan-cho-suc-khoe\" target=\"_blank\">chuẩn&nbsp;CARB-P2</a></u>&nbsp;</strong>an to&agrave;n tuyệt đối cho người sức khỏe người d&ugrave;ng v&agrave; đạt&nbsp;<u><strong><a href=\"https://moho.com.vn/blogs/noi-that-ung-dung/chung-nhan-fsc-chung-nhan-bao-ve-rung-quy-mo-toan-cau\" target=\"_blank\">chứng nhận FSC</a></strong></u>&nbsp;bảo vệ v&agrave; ph&aacute;t triển rừng bền vững.</p>\r\n\r\n<p><strong>Veneer gỗ sồi tự nhi&ecirc;n</strong></p>\r\n\r\n<p>Bề mặt sản phẩm phủ&nbsp;Veneer&nbsp;<u><strong><a href=\"https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung\" target=\"_blank\">gỗ sồi</a></strong></u>&nbsp;tự nhi&ecirc;n&nbsp;cho bề mặt v&acirc;n gỗ tinh tế, bền m&agrave;u, nhẵn v&agrave; s&aacute;ng b&oacute;ng. Đồng thời, gi&uacute;p sản phẩm&nbsp;kh&ocirc;ng bị co ng&oacute;t, nứt khi thời tiết thay đổi.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-3\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-3_0159eb200b9f458489e4e51afeec9b24.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>3. ĐẶC ĐIỂM NỔI BẬT</strong></h2>\r\n\r\n<p>C&aacute;c thiết kế&nbsp;trong&nbsp;<strong><u><a href=\"https://moho.com.vn/collections/vline-collection\" target=\"_blank\">bộ sưu tập nội thất</a></u>&nbsp;VLINE</strong>&nbsp;mang trong m&igrave;nh n&eacute;t đẹp đặc trưng của hồn Việt c&ugrave;ng vẻ đẹp năng động của thời đại. V&rdquo; l&agrave; viết tắt của từ &ldquo;Việt&rdquo; trong &ldquo;Việt Nam&rdquo;.&nbsp;&ldquo;LINE&rdquo; l&agrave; c&aacute;c đường n&eacute;t mang xu hướng hiện đại, ph&oacute;ng kho&aacute;ng của ng&agrave;y nay.</p>\r\n\r\n<p><strong>Thiết kế nhỏ gọn, tinh tế</strong></p>\r\n\r\n<p>Lấy cảm hứng từ n&eacute;t đẹp Việt pha lẫn ch&uacute;t hiện đại, mang đến điểm nhấn thu h&uacute;t cho kh&ocirc;ng gian&nbsp;<u><strong><a href=\"https://moho.com.vn/collections/phong-ngu\" target=\"_blank\">nội thất ph&ograve;ng ngủ</a></strong></u>.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-4\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-4_979591d03f2646719bfa5955a51d81a3.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Thiết kế tối ưu c&ocirc;ng năng</strong></p>\r\n\r\n<p>Tủ được thiết kế nhỏ gọn gồm phần kệ ngăn v&agrave; hộc tủ ngăn k&eacute;o, gi&uacute;p tối ưu kh&ocirc;ng gian lưu trữ m&agrave; kh&ocirc;ng chiếm nhiều diện t&iacute;ch kh&ocirc;ng gian ph&ograve;ng.&nbsp;</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-5\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-5_7e2906b12c974e21a0a4111975b56757.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Tỉ mỉ trong từng chi tiết</strong></p>\r\n\r\n<p>C&aacute;c cạnh tủ được bo tr&ograve;n&nbsp;tạo sự mềm mại v&agrave;&nbsp;hạn chế tổn thương khi xảy ra va đập trong qu&aacute; tr&igrave;nh sử dụng.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-6\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-6_a2e8be53ed8b4250881dc3c63412a648.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ray trượt mượt m&agrave;, độ bền cao</strong></p>\r\n\r\n<p>Sử dụng ray trượt cao cấp gi&uacute;p tủ c&oacute; thể k&eacute;o mở to&agrave;n phần dễ d&agrave;ng, tăng tuổi thọ sản phẩm l&ecirc;n đến&nbsp;<strong>80,000&nbsp;lần đ&oacute;ng/mở</strong>.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-7\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-7_49837bb120434bcaba29f7b87e9bce93.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Thiết kế th&ocirc;ng tho&aacute;ng</strong></p>\r\n\r\n<p>C&aacute;c ngăn kệ th&ocirc;ng tho&aacute;ng gi&uacute;p dễ d&agrave;ng vệ sinh, lấy vật dụng v&agrave; h&agrave;i ho&agrave; với nhiều m&oacute;n đồ&nbsp;<a href=\"https://moho.com.vn/\" target=\"_blank\">nội thất</a>&nbsp;gỗ kh&aacute;c nhau.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-8\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-8_4208997b216740babad985ad0b628370.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Độ cao theo ti&ecirc;u chuẩn</strong></p>\r\n\r\n<p>C&oacute; thể&nbsp;sử dụng m&aacute;y h&uacute;t bụi, robot h&uacute;t bụi th&ocirc;ng dụng.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-9\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-9_f59ea4ee6d2f4b3bb21327c4ba01178b.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Khả năng chịu lực tốt</strong></p>\r\n\r\n<p>Ch&acirc;n tủ&nbsp;từ gỗ tr&agrave;m tự nhi&ecirc;n cho&nbsp;độ cứng tốt, li&ecirc;n kết bền chặt, kh&ocirc;ng bị co r&uacute;t, nứt nẻ. Logo MOHO độc quyền gi&uacute;p tr&aacute;nh h&agrave;ng giả.&nbsp;</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-10\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-10_5859392dbee44fa7b836e2069cdaa59f.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>02 m&agrave;u sắc lựa chọn</strong></p>\r\n\r\n<p>M&agrave;u gỗ tự nhi&ecirc;n v&agrave; m&agrave;u n&acirc;u.</p>\r\n\r\n<p><strong><a href=\"https://moho.com.vn/products/tu-dau-giuong-go-soi-moho-vline-801\" target=\"_blank\">Tủ đầu giường&nbsp;MOHO VLINE 801 m&agrave;u gỗ tự nhi&ecirc;n</a>&nbsp;&rarr;</strong></p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-11\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-11_482a053a1d0a4dd5888f8fbd880c9157.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>4. KH&Ocirc;NG GIAN SỐNG</strong></h2>\r\n\r\n<p>Tủ đầu giường VLINE m&agrave;u n&acirc;u mang hơi hướng cổ xưa nhưng phản phất n&eacute;t đẹp của thời đại, l&agrave; mẫu&nbsp;<a href=\"https://moho.com.vn/\" target=\"_blank\">nội thất</a>&nbsp;kh&ocirc;ng thể thiếu cho&nbsp;<strong><u><a href=\"https://moho.com.vn/collections/phong-ngu\" target=\"_blank\">nội thất ph&ograve;ng ngủ</a></u></strong>.</p>\r\n\r\n<p><img alt=\"noi-that-moho-vline-tu-dau-giuong-12\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-vline-tu-dau-giuong-12_22db61f008e9496a8d67e0eb365e4aaa.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"Tủ đầu giường VLINE đẹp cổ điển\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-tu-dau-giuong-vline_101b569a9e9a40969e625dfc6c03bef0.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://moho.com.vn/collections/uu-dai\"><img alt=\"ưu đãi tháng 6\" src=\"https://file.hstatic.net/200000065946/file/collection_page_5c4fa6261dd349e49017f6c1f77c77d1_2048x2048.jpg\" title=\"Nội dung sản phẩm\" /></a></p>\r\n\r\n<p><a href=\"https://moho.com.vn/collections/bo-suu-tap-moi\" target=\"_blank\"><img alt=\"ưu đãi tháng 6\" src=\"https://file.hstatic.net/200000065946/file/collection_page_8bb7ccf234c747af8551b002ff617c59_2048x2048.jpg\" title=\"Nội dung sản phẩm\" /></a></p>\r\n\r\n<p><img alt=\"lưu ý sản phẩm\" src=\"https://file.hstatic.net/200000065946/file/z5471796383575_afe7fc65369226b8a41e290b216221a0_8504ff911dc3451f8a83b3e4e5dde388_2048x2048.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"Nội Thất MOHO\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-100-viet-nam_06bcf2c208a943598bdef46d09d2537f.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"tiêu chuẩn formaldehyde tiêu chuẩn carb p2 trong nội thất\" src=\"https://file.hstatic.net/200000065946/file/z5314343539024_bc8f2a0b5f49ded3130f72ec69e4790c_8d6c5fcf78f44b1d8215e29c6754ac00_master.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"Nội thất MOHO\" src=\"https://file.hstatic.net/200000065946/file/noi-that-moho-kiem-nghiem-kotiti_bc9f39b2134d4191978d541cc11ba363.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"chứng nhận an toàn vật liệu\" src=\"https://file.hstatic.net/200000065946/file/z5307712121436_2c9ff6dad4488de4cef40b9b59bc928c_15b4b03a9ddf4ceabe049981ffaaad9d_2048x2048.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Nội thất MOHO\" src=\"https://file.hstatic.net/200000065946/file/text1-1__1__4d8490750feb4fef86a28f141bbd0960_2048x2048_ac5a5fcb1e764c9282e75c1d776242b1.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p><img alt=\"Nội thất MOHO\" src=\"https://file.hstatic.net/200000065946/file/noi_that_moho_ban_quyen_moho_a29ede9db726454c82cccb850a0efd3d.jpg\" title=\"Nội dung sản phẩm\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2490000, 11, 'N&acirc;u\r\nK&iacute;ch thước: D&agrave;i 55cm x Rộng 41cm x Cao 51,5cm\r\n\r\nChất liệu:\r\n\r\n- Th&acirc;n tủ: Gỗ c&ocirc;ng nghiệp PB, MDF chuẩn CARB-P2 (*), Veneer gỗ tr&agrave;m tự nhi&ecirc;n\r\n\r\n- Ch&acirc;n tủ: Gỗ tr&agrave;m tự nhi&ecirc;n\r\n\r\n(*) Ti&ecirc;u chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ kh&ocirc;ng độc hại, an to&agrave;n cho sức khỏe', 1513062277, 20, 1, 1590000, 1, 1, 1719670655);
INSERT INTO `tbl_product` VALUES (18, 1, 'Giường Ngủ Gỗ Tràm MOHO VLINE 601 Nhiều Kích Thước', 'giuong-ngu-go-tram-moho-vline-601-nhieu-kich-thuoc', 33, 326, NULL, '<p><strong><a href=\"https://noithatgiakhanh.com/mua/sofa-doi-dang-bang-boc-vai-nano-hien-dai-sf527/\">Sofa da b&ograve; 100% phong c&aacute;ch &Yacute; SF2216 -1&nbsp;</a></strong>&nbsp;được thiết kế theo phong c&aacute;ch tối giản với những đường n&eacute;t chỉn chu, trẻ khỏe. Phần đệm ngồi v&agrave; tựa lưng đơn giản dễ d&agrave;ng l&agrave;m sạch. Ch&acirc;n sofa được l&agrave;m bằng th&eacute;p kh&ocirc;ng gỉ mang vẻ đẹp khỏe khoắn, trẻ trung. Tựa tay c&oacute; thiết kế gọn g&agrave;ng, đem đến x&uacute;c cảm dễ chịu v&agrave; thoải m&aacute;i khi d&ugrave;ng.</p>\r\n\r\n<h2><strong>Ưu điểm của sản phẩm Sofa phong c&aacute;ch &Yacute; SF2216-1</strong></h2>\r\n\r\n<ul>\r\n	<li>Độ bền cao do l&agrave;m từ những chất liệu cao cấp từ khung ghế đến chất liệu bọc da thật bền đẹp, độ d&agrave;y của da ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u kh&ocirc;ng lo nứt nổ, chịu được thời tiết kh&iacute; hậu ở Việt Nam.</li>\r\n	<li>Ghế sofa da cao cấp nhập khẩu ng&agrave;y c&agrave;ng đa dạng về mẫu m&atilde;, chất lượng.</li>\r\n	<li>Xuất xứ h&agrave;ng h&oacute;a r&otilde; r&agrave;ng y&ecirc;n t&acirc;m sử dụng l&acirc;u d&agrave;i.</li>\r\n	<li>Gi&uacute;p kh&ocirc;ng gian nội thất khi đặt v&agrave;o trở n&ecirc;n kh&aacute;c biệt, t&ocirc;n l&ecirc;n đẳng cấp gu thẩm mỹ của gia chủ.</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://noithatgiakhanh.com/wp-content/uploads/2019/12/z4242961384224_e14de28364fe342a1626d30009bb7c52-1000x750.jpg\" style=\"height:750px; width:1000px\" /></p>\r\n\r\n<p>NỘI THẤT</p>\r\n\r\n<p><iframe frameborder=\"0\" height=\"574\" src=\"https://www.youtube.com/embed/ckqivsP2xPg?feature=oembed&amp;enablejsapi=1&amp;origin=https://noithatgiakhanh.com\" title=\"672| Nội Thất Gia Khánh\" width=\"1020\"></iframe></p>\r\n\r\n<h2><strong>Mua Sofa phong c&aacute;ch &Yacute; SF2216-1 tại Nội thất Gia Kh&aacute;nh</strong></h2>\r\n\r\n<ul>\r\n	<li>Hiện nay nước ta c&oacute; kh&aacute; nhiều địa chỉ cung ứng&nbsp;<strong><a href=\"https://noithatgiakhanh.com/sofa/\" rel=\"noopener\" target=\"_blank\">ghế sofa nhập khẩu</a></strong>. Nhưng kh&ocirc;ng phải ở chỗ n&agrave;o cũng c&oacute; thể c&oacute; cam kết về chất lượng sản phẩm. Tại nội thất Gia Kh&aacute;nh, ch&uacute;ng t&ocirc;i cung cấp cho bạn mức chi ph&iacute; hợp l&yacute; v&agrave; chất lượng cao nhất.</li>\r\n	<li>Đến với nội thất Gia Kh&aacute;nh, ch&uacute;ng ta cũng c&oacute; thể dễ d&agrave;ng v&agrave; đơn giản mua được c&aacute;c bộ Sofa phong c&aacute;ch &Yacute; SF2216 -1 ph&ograve;ng kh&aacute;ch nhập khẩu thời thượng với chất lượng chứng minh v&agrave; khẳng định sẽ khiến bạn thỏa m&atilde;n nhu cầu. Gia Kh&aacute;nh cũng hỗ trợ giao h&agrave;ng tr&ecirc;n khắp cả nước, c&ugrave;ng khối hệ thống địa chỉ lớn, qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể mua&nbsp;<strong><a href=\"https://noithatgiakhanh.com/sofa-vai-ni/\" rel=\"noopener\" target=\"_blank\">sofa phong c&aacute;ch &Yacute;&nbsp;</a></strong>đẹp tại H&agrave; Nội , Thanh H&oacute;a một c&aacute;ch thuận tiện v&agrave; nhanh ch&oacute;ng.</li>\r\n</ul>\r\n\r\n<blockquote>\r\n<p><em><strong>Xem th&ecirc;m:&nbsp;<a href=\"https://noithatgiakhanh.com/mua/bo-sofa-3-bang-goc-trai-phong-cach-hien-dai-sf-303b/\" rel=\"noopener\" target=\"_blank\">Bộ Sofa 3 Băng G&oacute;c Tr&aacute;i Phong C&aacute;ch Hiện Đại SF-303B</a></strong></em></p>\r\n</blockquote>\r\n\r\n<p>Li&ecirc;n hệ ngay với&nbsp;<strong><a href=\"https://noithatgiakhanh.com/\" rel=\"noopener\" target=\"_blank\">Nội thất Gia Kh&aacute;nh</a></strong>&nbsp;để được tư vấn chi tiết hơn về sản phẩm Sofa phong c&aacute;ch &Yacute; SF2216-1 :</p>\r\n\r\n<p><strong>Địa chỉ Noithatgiakhanh tại H&agrave; Nội:</strong></p>\r\n\r\n<ul>\r\n	<li>To&agrave; Nh&agrave; CT1 &ndash; C14 Bắc H&agrave; &ndash; Đường Tố Hữu &ndash; P.Trung Văn &ndash; Q.Nam Từ Li&ecirc;m &ndash; TP H&agrave; Nội (5000m2 gần ng&atilde; tư Trung Văn)</li>\r\n	<li>Hotline: 0934.605.333</li>\r\n	<li>Email: banhang@noithatgiakhanh.com</li>\r\n</ul>\r\n\r\n<p><strong>Địa chỉ Noithatgiakhanh tại Thanh Ho&aacute;:</strong></p>\r\n\r\n<ul>\r\n	<li>Số 25 Đại lộ L&ecirc; Lợi &ndash; Th&agrave;nh phố Thanh H&oacute;a ( Ng&atilde; Tư Gia Kh&aacute;nh)</li>\r\n	<li>Hotline: 0936.486.333</li>\r\n	<li>Email: thanhhoa@noithatgiakhanh.com</li>\r\n</ul>\r\n\r\n<p><strong>Li&ecirc;n hệ Noithatgiakhanh tại Ninh B&igrave;nh:</strong></p>\r\n\r\n<ul>\r\n	<li>CS 1: 134 + 134 tuyến đường Trần Hương Đạo, x&atilde; Ninh Kh&aacute;nh, th&agrave;nh thị Ninh B&igrave;nh</li>\r\n	<li>CS 2: 245 + 247 &ndash; Tổ 9 P. Trung Sơn, thị th&agrave;nh Tam Điệp</li>\r\n	<li>Hotline: 02293.700.366</li>\r\n</ul>\r\n\r\n<p><a href=\"https://maps.app.goo.gl/XDdrvKDuQHg48sVm6\" rel=\"noopener\" target=\"_blank\"><img alt=\"hay den trai nghiem noi that gia khanh\" src=\"https://noithatgiakhanh.com/wp-content/uploads/2022/08/hay-den-trai-nghiem-noi-that-gia-khanh.jpg\" style=\"height:1794px; width:1666px\" /></a></p>\r\n', 8990000, 15, 'K&iacute;ch thước phủ b&igrave;: D&agrave;i 212cm x Rộng 136/156/176/196cm x Cao đến đầu giường 92cm\r\n\r\nChất liệu:\r\n\r\n- Th&acirc;n giường: Gỗ tr&agrave;m tự nhi&ecirc;n, Veneer gỗ tr&agrave;m tự nhi&ecirc;n\r\n\r\n- Ch&acirc;n giường: Gỗ cao su tự nhi&ecirc;n\r\n\r\n- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)\r\n\r\n(*) Ti&ecirc;u chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ kh&ocirc;ng độc hại, an to&agrave;n cho sức khỏe', 1719416471, 22, 1, 5990000, 1, 1, 1720189396);

-- ----------------------------
-- Table structure for tbl_slider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider`  (
  `slider_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumb` int NOT NULL,
  `active` int NOT NULL DEFAULT 2,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  `create_by` int NOT NULL,
  `modify_by` int NOT NULL,
  PRIMARY KEY (`slider_id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `create_by`(`create_by` ASC) USING BTREE,
  INDEX `modify_by`(`modify_by` ASC) USING BTREE,
  CONSTRAINT `tbl_slider_ibfk_1` FOREIGN KEY (`thumb`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_slider
-- ----------------------------
INSERT INTO `tbl_slider` VALUES (1, 'Slide 1', 316, 1, 1515586078, 1719671172, 1, 1);
INSERT INTO `tbl_slider` VALUES (2, 'Slide 3', 317, 1, 1515586220, 1719732110, 1, 1);
INSERT INTO `tbl_slider` VALUES (3, 'Slide 2', 328, 1, 1719671219, 1719732125, 1, 1);

-- ----------------------------
-- Table structure for tbl_support
-- ----------------------------
DROP TABLE IF EXISTS `tbl_support`;
CREATE TABLE `tbl_support`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `depict` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `thumb` int NOT NULL,
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `active` int NOT NULL DEFAULT 2,
  `page_connect` int NOT NULL,
  `create_at` int NOT NULL,
  `modify_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `thumb`(`thumb` ASC) USING BTREE,
  INDEX `page_connect`(`page_connect` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_support
-- ----------------------------
INSERT INTO `tbl_support` VALUES (5, 'Miễn phí vận chuyển', 'Tận tay khách hàng', 315, NULL, 1, 0, 1515574721, 1515574721);
INSERT INTO `tbl_support` VALUES (6, 'Thanh toán nhanh', 'Hỗ trợ nhiều hình thức', 318, NULL, 1, 0, 1515629048, 1515629048);
INSERT INTO `tbl_support` VALUES (7, 'Tiết kiệm hơn', 'Với nhiều ưu đãi cực lớn', 319, 'why-do-we-use-i.html', 1, 6, 1515629098, 1515629098);
INSERT INTO `tbl_support` VALUES (8, 'Tư vấn 24/7', '1900.9999', 320, 'why-do-we-use-i.html', 1, 6, 1515629152, 1515629152);
INSERT INTO `tbl_support` VALUES (9, 'Đặt hàng online', 'Thao tác đơn giản', 321, 'why-do-we-use-i.html', 1, 6, 1515629219, 1515629219);

-- ----------------------------
-- Table structure for tbl_sytem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sytem`;
CREATE TABLE `tbl_sytem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `per_page` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_sytem
-- ----------------------------
INSERT INTO `tbl_sytem` VALUES (1, 'Gardenista Bakery', 'Hương vị Pháp giữa lòng Hà Nội', '0123456789', '106 - Trần Bình - Cầu Giấy - Hà Nội', 'gardenista-bakery@gmail.com', 8);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` int NULL DEFAULT NULL,
  `level` int NOT NULL DEFAULT 3,
  `salt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` int NOT NULL DEFAULT 1,
  `fullname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL,
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `facebook` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NULL DEFAULT NULL,
  `modify_at` int NULL DEFAULT NULL,
  `code_confirm` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '{}',
  `create_at` int NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `avatar`(`avatar` ASC) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`avatar`) REFERENCES `tbl_media` (`media_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'f46bdbaf704f698c99bcba1a813c20a0', 'quockhanh01091@gmail.com', 327, 1, 'abc123', 1, 'Quoc Khanh', '', '0123456789', '', 1719466165, '{\"reset_pass\":{\"code\":\"3189f2b9d6f2651c86f19bc1df6c27fe\",\"time\":1719411748}}', 1511658087);
INSERT INTO `tbl_user` VALUES (5, '87f5cc93cac27f2712a20000a8188936', 'quockhanhyd1004@gmail.com', NULL, 2, 'db936adf80fcfde49bb6c795505b11ad', 1, 'Phan Huy', NULL, NULL, NULL, 1513961210, '{\"reset_pass\":{\"code\":\"5b1c5286ad7ba8b3e79f21d496302482\",\"time\":1719411978}}', 1513956306);
INSERT INTO `tbl_user` VALUES (6, '2cdf43a22bd3bd61c92d0a5c088dbecc', 'phankhuong.t10@gmail.com', NULL, 3, '792a7362132bfca13a8d35ac5127bf6f', 2, 'Phan Khương', NULL, NULL, NULL, 1513961200, '{\"reset_pass\":{\"code\":\"16bc367ed731da444a3a705f3baf8e4c\",\"time\":1513962851}}', 1513961200);
INSERT INTO `tbl_user` VALUES (7, '140f20bc71bb87a2c7eaa0ba52668b22', 'test123123@gmail.com', NULL, 3, 'fa88c56ebef8f3d10592de6eeb90a8d8', 1, 'test', NULL, NULL, NULL, 1719414257, '{}', 1719414257);

SET FOREIGN_KEY_CHECKS = 1;
