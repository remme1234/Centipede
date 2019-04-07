-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.17-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- centipede 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `centipede` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `centipede`;

-- 테이블 centipede.t_brand 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_brand` (
  `CAT_CD` char(10) NOT NULL COMMENT '카테고리코드',
  `BRND_NM` varchar(50) DEFAULT NULL COMMENT '상표명',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '정렬번호',
  `RSGSTR_ID` varchar(30) DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`CAT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='브랜드';

-- 테이블 데이터 centipede.t_brand:~5 rows (대략적) 내보내기
DELETE FROM `t_brand`;
/*!40000 ALTER TABLE `t_brand` DISABLE KEYS */;
INSERT INTO `t_brand` (`CAT_CD`, `BRND_NM`, `SORT_NO`, `RSGSTR_ID`, `REG_DT`) VALUES
	('01', 'Nike', 1, 'SAMPLE', '2019-01-30 15:25:59'),
	('02', 'Adidas', 2, 'SAMPLE', '2019-01-30 15:26:15'),
	('03', 'Converse', 3, 'SAMPLE', '2019-01-30 15:26:25'),
	('04', 'Vans', 4, 'SAMPLE', '2018-03-17 22:04:20'),
	('05', 'Asics', 5, 'SAMPLE', '2019-03-17 22:04:49');
/*!40000 ALTER TABLE `t_brand` ENABLE KEYS */;

-- 테이블 centipede.t_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_file` (
  `FILE_NO` int(11) NOT NULL,
  `BOARD_UID` varchar(36) NOT NULL,
  `ORIGIN_FILE_NM` varchar(260) NOT NULL,
  `SAVED_FILE_NM` varchar(36) NOT NULL,
  `SAVED_FILE_PATH` varchar(260) NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `RSGST_DT` date NOT NULL,
  `RSGSTR_ID` varchar(30) NOT NULL,
  `USE_YN` varchar(1) DEFAULT 'Y',
  PRIMARY KEY (`FILE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 centipede.t_file:~29 rows (대략적) 내보내기
DELETE FROM `t_file`;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` (`FILE_NO`, `BOARD_UID`, `ORIGIN_FILE_NM`, `SAVED_FILE_NM`, `SAVED_FILE_PATH`, `FILE_SIZE`, `RSGST_DT`, `RSGSTR_ID`, `USE_YN`) VALUES
	(1, 'B0001', 'Nike-Air-VaporMax-3.0-White-Volt-Black-Crimson-AJ6900-100-Release-Date-1.png', '27267e45a4cb47968a1248a6b3d300b3.png', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 319820, '2019-03-17', 'sample', 'Y'),
	(2, 'B0001', 'Nike-Air-VaporMax-3.0-Laser-Fuchsia-AJ6900-007-Release-Date.png', 'd219b3a0e86c40cab64649550374415a.png', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 360072, '2019-03-17', 'sample', 'Y'),
	(3, 'B0001', 'Drake-Nike-Zoom-Vomero-5-2019-Tour-Paris.jpg', 'f5e8d2bc2aa0424dbca2a878311f56a8.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 91458, '2019-03-17', 'sample', 'Y'),
	(4, 'B0001', 'Nike-Air-Force-1-Low-Muslin-CJ0691-100-Release-Date-4.jpg', 'aef2630dca554363aa932ece40885b8d.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 63977, '2019-03-17', 'sample', 'Y'),
	(5, 'B0001', 'adidas-FYW-S-97-White-EF2042-Release-Date.jpg', '954a5386afc74392a0bbc183d3ab2b58.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 54224, '2019-03-17', 'sample', 'Y'),
	(6, 'B0001', 'adidas-Continental-80-Black-Leopard-G27703-Release-Date.jpg', 'cc7e5f98213c4d6ca91069c5fe2b2d37.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 53116, '2019-03-17', 'sample', 'Y'),
	(7, 'B0001', 'Ronnie-Fieg-adidas-FYW-Salvation-Pack-Release-Date-Price.png', '97cde0400f8c4dd6ab4b821fc38c8b80.png', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 660206, '2019-03-17', 'sample', 'Y'),
	(8, 'B0001', 'adidas-Yeezy-Boost-350-V2-True-Form-EG7492-Release-Date-Price.jpg', '5c081b48e40c490bb38e605af18128bc.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 41873, '2019-03-17', 'sample', 'Y'),
	(9, 'B0001', 'atmos-adidas-Yung-1-Barber-Shop-EF2674-Release-Date-1.jpg', 'fe103f1babec4ad3b9e27afcdb2341c8.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 112677, '2019-03-17', 'sample', 'Y'),
	(10, 'B0001', 'ASICS-Gel-Lyte-Teal-Blue-Glacier-Grey-Release-Date-2.jpg', '1159051f667c4df084c65afc76b7183e.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 120452, '2019-03-17', 'sample', 'Y'),
	(11, 'B0001', 'ASICS-Gel-DS-Trainer-OG-Cream-Silver-Release-Date.jpg', '829dffe055a846eb8d0c1d681071d70a.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 111489, '2019-03-17', 'sample', 'Y'),
	(12, 'B0001', 'Vans-x-Yusuke-Hanai-Sk8-Hi-138-Decon-SF-Release-Date.png', 'c7765fcb3eb84e7abb37e7c198651fad.png', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 521362, '2019-03-17', 'sample', 'Y'),
	(13, 'B0001', 'Vans-Slip-On-Multi-Logo-Release-Date-6.jpg', '6e81df3a043a438d93a900e3fd0def21.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 67647, '2019-03-17', 'sample', 'Y'),
	(14, 'B0002', 'Nike-Air-Force-1-Low-CI5766-110-Nike-Cortez-CI5776-110-Noise-Cancelling-Release-Date.jpg', 'febe9df6a9034486ae8b18d8423b9cd3.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 186887, '2019-03-18', 'sample', 'Y'),
	(15, 'B0002', 'Nike-Air-Max-95-Essential-White-Silver-749766-115-Release-Date-4.jpg', '9e930e458dc5469aac3e8286d2a5af0c.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 54671, '2019-03-18', 'sample', 'Y'),
	(16, 'B0002', 'Nike-Kyrie-5-Oreo-White-Black-AO2918-100-Release-Date-Price-4.jpg', '754ea17c6d97433bbf06cbd5de048ef9.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 101297, '2019-03-18', 'sample', 'Y'),
	(17, 'B0002', 'adidas-Yeezy-Boost-700-Inertia-EG7597-Release-Date-1.jpg', '952d3fbcdc674a1a822390f048cda174.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 39949, '2019-03-18', 'sample', 'Y'),
	(18, 'B0002', 'adidas-Yeezy-Boost-350-V2-Zebra-Restock-Release-Date.jpg', '85833d3471c9451f971255dd7c34b0e4.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 100227, '2019-03-18', 'sample', 'Y'),
	(19, 'B0002', 'Yeezy-500-Salt-Release-Date.jpg', 'c7fdc68ac7924fccaad689256c2e2879.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 52141, '2019-03-18', 'sample', 'Y'),
	(20, 'B0002', 'Nike-Air-Max-97-Neon-Seoul-Release-Date.jpg', '64ca30cbea144a4dbcf29e1c0402718f.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 62250, '2019-03-18', 'sample', 'Y'),
	(21, 'B0002', 'DOE-Converse-Be-Formeless-Collection-Release-Date.jpg', '4219e80dc880423fa97ae85fdca8f5b4.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 153706, '2019-03-18', 'sample', 'Y'),
	(22, 'B0002', 'JW-Anderson-Converse-Run-Star-Hike-Release-Date.jpg', 'f3a0b638df3c4af0aebef77e65de5fc1.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 43845, '2019-03-18', 'sample', 'Y'),
	(23, 'B0002', 'Converse-Golf-Le-Fleur-Industrial-Pack-Release-Date-Price.jpg', '9dbc3fdf7d8543bf837e1faaa8628216.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 52541, '2019-03-18', 'sample', 'Y'),
	(24, 'B0002', 'CLOT-Converse-Chuck-70-Hi-Jack-Purcell-Ice-Cold-Pack-Release-Date.jpg', 'b5623949e4fe494f967aedecb9731bd9.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 148084, '2019-03-18', 'sample', 'Y'),
	(25, 'B0002', 'Ashley-Williams-Vans-Pack-Release-Date-1.jpg', '4b0f9e58cbb64b589bfad5b44a75f423.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 45555, '2019-03-18', 'sample', 'Y'),
	(26, 'B0002', 'Vans-Blur-Check-Authentic-Black-White.jpg', '71bc2a3ec9394c168a19a9c2a712d748.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 76502, '2019-03-18', 'sample', 'Y'),
	(27, 'B0002', 'Vans-Vault-OG-Old-Skool-LX-Collection.jpg', '43a9d3fe689e40d0b9790f0ca05c5c2b.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 45966, '2019-03-18', 'sample', 'Y'),
	(28, 'B0002', 'Asics-Gel-Kayano-5-OG-Off-White.jpg', '8afd04fc859b495e9be7ac5b56035df8.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 40480, '2019-03-18', 'sample', 'Y'),
	(29, 'B0002', 'Kiko-Kostadinov-ASICS-Gel-Delva-Release-Date-5.jpg', '72e4a4886d7e4364ad16582105338dff.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 73193, '2019-03-18', 'sample', 'Y'),
	(30, 'B0002', 'ASICS-Gel-DS-Trainer-White-Grey.jpg', '626b2e9404644cae96a0cb92c5074d29.jpg', 'C:\\eGovFrameDev-3.6.0-64bit\\shinu_pjt\\centipede\\src\\main\\webapp\\images\\centipede\\board\\', 24078, '2019-03-18', 'sample', 'Y');
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;

-- 테이블 centipede.t_mbr 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_mbr` (
  `MBR_NO` char(10) NOT NULL COMMENT '회원번호',
  `AUTH_YN` char(10) NOT NULL DEFAULT 'N' COMMENT '권한여부',
  `LOGIN_ID` varchar(40) NOT NULL COMMENT '로그인ID',
  `PWD` varchar(255) NOT NULL COMMENT '비밀번호',
  `PWD_CHG_DT` datetime DEFAULT NULL COMMENT '비밀번호변경일시',
  `TMP_PWD_ISSU_DT` datetime DEFAULT NULL COMMENT '임시비밀번호발급일시',
  `LOGIN_FAIL_CNT` int(11) DEFAULT NULL COMMENT '로그인실패횟수',
  `CP_NO` varchar(50) DEFAULT NULL COMMENT '핸드폰번호',
  `EMAIL` varchar(40) DEFAULT NULL COMMENT '이메일',
  `JOIN_DT` datetime DEFAULT NULL COMMENT '가입일시',
  `RSGSTR_ID` varchar(30) DEFAULT NULL COMMENT '등록자',
  `RSGST_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`MBR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';

-- 테이블 데이터 centipede.t_mbr:~4 rows (대략적) 내보내기
DELETE FROM `t_mbr`;
/*!40000 ALTER TABLE `t_mbr` DISABLE KEYS */;
INSERT INTO `t_mbr` (`MBR_NO`, `AUTH_YN`, `LOGIN_ID`, `PWD`, `PWD_CHG_DT`, `TMP_PWD_ISSU_DT`, `LOGIN_FAIL_CNT`, `CP_NO`, `EMAIL`, `JOIN_DT`, `RSGSTR_ID`, `RSGST_DT`) VALUES
	('1', 'Y', 'admin', '12', '2019-03-12 13:38:20', '2019-03-02 20:44:55', 0, '01000000000', 'f@dfd.com', '2019-03-02 20:45:10', 'admin', '2019-03-02 20:47:02'),
	('2', 'N', 'admin2', '12', '2019-03-12 13:44:21', '2019-03-12 10:47:18', 0, '01033563189', 'd@d.com', '2019-03-12 13:28:47', 'admin2', '2019-03-12 10:47:18'),
	('3', 'N', 'yuran1009', 'dbfks109', '2019-03-15 21:57:27', '2019-03-15 21:57:27', 0, '01066215009', 'yuran1009@naver.com', '2019-03-15 21:57:27', 'yuran1009', '2019-03-15 21:57:27'),
	('4', 'N', 'admin3', '12', '2019-03-30 13:30:38', '2019-03-30 13:30:38', 0, '01012341234', 'd@d.com', '2019-03-30 13:30:38', 'admin3', '2019-03-30 13:30:38');
/*!40000 ALTER TABLE `t_mbr` ENABLE KEYS */;

-- 테이블 centipede.t_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_notice` (
  `BOARD_UID` varchar(50) DEFAULT NULL COMMENT '게시판고유번호',
  `NUMBER` int(11) NOT NULL COMMENT '글번호',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '제목',
  `CONTENTS` varchar(1000) DEFAULT NULL COMMENT '내용',
  `FILE_NO` int(11) DEFAULT NULL COMMENT '파일번호',
  `VISIT_CNT` int(11) DEFAULT NULL COMMENT '방문횟수',
  `RSGST_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `RSGSTR_ID` varchar(30) DEFAULT NULL COMMENT '등록자ID',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공지사항';

-- 테이블 데이터 centipede.t_notice:~27 rows (대략적) 내보내기
DELETE FROM `t_notice`;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
INSERT INTO `t_notice` (`BOARD_UID`, `NUMBER`, `TITLE`, `CONTENTS`, `FILE_NO`, `VISIT_CNT`, `RSGST_DT`, `RSGSTR_ID`, `USE_YN`) VALUES
	('B0001', 1, 'SAMPLE', 'SAMPLE', 1, 2, '2019-03-18 00:19:54', 'admin', 'Y'),
	('B0003', 2, 'SAMPLE', 'SAMPLE', 2, 0, '2019-03-18 00:20:04', 'admin', 'Y'),
	('B0003', 3, 'SAMPLE', 'SAMPLE', 3, 0, '2019-03-18 00:20:06', 'admin', 'Y'),
	('B0003', 4, 'SAMPLE', 'SAMPLE', 4, 0, '2019-03-18 00:20:06', 'admin', 'Y'),
	('B0003', 5, 'SAMPLE', 'SAMPLE', 5, 0, '2019-03-18 00:20:06', 'admin', 'Y'),
	('B0003', 6, 'SAMPLE', 'SAMPLE', 6, 0, '2019-03-18 00:20:07', 'admin', 'Y'),
	('B0003', 7, 'SAMPLE', 'SAMPLE', 7, 0, '2019-03-18 00:20:07', 'admin', 'Y'),
	('B0003', 8, 'SAMPLE', 'SAMPLE', 8, 0, '2019-03-18 00:20:07', 'admin', 'Y'),
	('B0003', 9, 'SAMPLE', 'SAMPLE', 9, 0, '2019-03-18 00:20:08', 'admin', 'Y'),
	('B0003', 10, 'SAMPLE', 'SAMPLE', 10, 0, '2019-03-18 00:20:08', 'admin', 'Y'),
	('B0003', 11, 'SAMPLE', 'SAMPLE', 11, 0, '2019-03-18 00:20:09', 'admin', 'Y'),
	('B0003', 12, 'SAMPLE', 'SAMPLE', 12, 0, '2019-03-18 00:20:09', 'admin', 'Y'),
	('B0003', 13, 'SAMPLE', 'SAMPLE', 13, 0, '2019-03-18 00:20:09', 'admin', 'Y'),
	('B0003', 14, 'SAMPLE', 'SAMPLE', 14, 0, '2019-03-18 00:20:10', 'admin', 'Y'),
	('B0003', 15, 'SAMPLE', 'SAMPLE', 15, 0, '2019-03-18 00:20:10', 'admin', 'Y'),
	('B0003', 16, 'SAMPLE', 'SAMPLE', 16, 0, '2019-03-18 00:20:10', 'admin', 'Y'),
	('B0003', 17, 'SAMPLE', 'SAMPLE', 17, 1, '2019-03-18 00:20:11', 'admin', 'Y'),
	('B0003', 18, 'SAMPLE', 'SAMPLE', 18, 0, '2019-03-18 00:20:11', 'admin', 'Y'),
	('B0003', 19, 'SAMPLE', 'SAMPLE', 19, 0, '2019-03-18 00:20:12', 'admin', 'Y'),
	('B0003', 20, 'SAMPLE', 'SAMPLE', 20, 0, '2019-03-18 00:20:12', 'admin', 'Y'),
	('B0003', 21, 'SAMPLE', 'SAMPLE', 21, 1, '2019-03-18 00:20:12', 'admin', 'Y'),
	('B0003', 22, 'SAMPLE', 'SAMPLE', 22, 0, '2019-03-18 00:20:13', 'admin', 'Y'),
	('B0003', 23, 'SAMPLE', 'SAMPLE', 23, 0, '2019-03-18 00:20:13', 'admin', 'Y'),
	('B0003', 24, 'SAMPLE', 'SAMPLE', 24, 0, '2019-03-18 00:20:13', 'admin', 'Y'),
	('B0003', 25, 'SAMPLE', 'SAMPLE', 25, 0, '2019-03-18 00:20:14', 'admin', 'Y'),
	('B0003', 26, 'SAMPLE', 'SAMPLE', 26, 0, '2019-03-18 00:20:14', 'admin', 'Y'),
	('B0003', 27, 'SAMPLE', 'SAMPLE', 27, 2, '2019-03-18 00:20:15', 'admin', 'Y');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;

-- 테이블 centipede.t_prd 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_prd` (
  `GD_CD` int(11) NOT NULL COMMENT '상품코드',
  `GD_NM` varchar(100) DEFAULT NULL COMMENT '상품명',
  `CAT_CD` char(10) DEFAULT NULL COMMENT '카테고리코드',
  `RSGSTR_ID` varchar(30) DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`GD_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='품목';

-- 테이블 데이터 centipede.t_prd:~53 rows (대략적) 내보내기
DELETE FROM `t_prd`;
/*!40000 ALTER TABLE `t_prd` DISABLE KEYS */;
INSERT INTO `t_prd` (`GD_CD`, `GD_NM`, `CAT_CD`, `RSGSTR_ID`, `REG_DT`) VALUES
	(1, 'Air Max 95', '01', 'SAMPLE', '2019-01-30 15:26:51'),
	(2, 'Air Vapor Max', '01', 'SAMPLE', '2019-01-30 15:27:06'),
	(3, 'Air Joirdan', '01', 'SAMPLE', '2019-01-30 15:27:09'),
	(4, 'Chuck 70\'s High', '03', 'SAMPLE', '2019-03-17 22:32:22'),
	(5, 'Air Max 97', '01', 'SAMPLE', '2019-03-17 22:38:53'),
	(6, 'Ultra Boast 2.0', '02', 'SAMPLE', '2019-01-30 15:27:51'),
	(7, 'Yeezy boast 350 v1', '02', 'SAMPLE', '2019-01-30 15:27:53'),
	(8, 'Chuck 70\'s Row', '03', 'SAMPLE', '2019-01-30 15:28:24'),
	(9, 'Air Max 98', '01', 'SAMPLE', '2019-03-17 22:40:44'),
	(10, 'Air Max 1', '01', 'SAMPLE', '2019-03-17 22:41:00'),
	(11, 'Air Max 2', '01', 'SAMPLE', '2019-03-17 22:42:46'),
	(12, 'Air Max 720', '01', 'SAMPLE', '2019-03-17 22:43:07'),
	(13, 'Air Zoom pegasus 35', '01', 'SAMPLE', '2019-03-17 22:44:01'),
	(14, 'Air Zoom Alpha', '01', 'SAMPLE', '2019-03-17 22:46:10'),
	(15, 'Air Tekno LX', '01', 'SAMPLE', '2019-03-17 22:46:37'),
	(16, 'Air Outburst LX', '01', 'SAMPLE', '2019-03-17 22:47:01'),
	(17, 'Air React Wr ISPA', '01', 'SAMPLE', '2019-03-17 22:47:29'),
	(18, 'Air Zoom Vomero 5', '01', 'SAMPLE', '2019-03-17 22:47:55'),
	(19, 'Predator 19.1 TR', '02', 'SAMPLE', '2019-03-17 22:51:17'),
	(20, 'Ultra Boast 19', '02', 'SAMPLE', '2019-03-17 22:51:34'),
	(21, 'NMD R1', '02', 'SAMPLE', '2019-03-17 22:51:49'),
	(22, 'LX Adiprene', '02', 'SAMPLE', '2019-03-17 22:52:06'),
	(23, 'EQT support Mid ADVPK', '02', 'SAMPLE', '2019-03-17 22:52:29'),
	(24, 'ZX 500 RM', '02', 'SAMPLE', '2019-03-17 22:52:42'),
	(25, 'YUNG-96', '02', 'SAMPLE', '2019-03-17 22:52:56'),
	(26, 'YUNG-1', '02', 'SAMPLE', '2019-03-17 22:53:02'),
	(27, 'Samba RM', '02', 'SAMPLE', '2019-03-17 22:53:23'),
	(28, 'Superstar 80s', '02', 'SAMPLE', '2019-03-17 22:53:45'),
	(29, 'Gazelle', '02', 'SAMPLE', '2019-03-17 22:54:26'),
	(30, 'Stan Smith', '02', 'SAMPLE', '2019-03-17 22:54:38'),
	(31, 'One Star', '03', 'SAMPLE', '2019-03-17 22:55:37'),
	(32, 'ERX 260', '03', 'SAMPLE', '2019-03-17 22:56:11'),
	(33, 'One Star Pro 3V', '03', 'SAMPLE', '2019-03-17 22:59:05'),
	(34, 'Chuck All Star Row ', '03', 'SAMPLE', '2019-03-17 23:01:27'),
	(35, 'Chuck All Star High ', '03', 'SAMPLE', '2019-03-17 23:01:32'),
	(36, 'SK8-HI ', '04', 'SAMPLE', '2019-03-17 23:03:43'),
	(37, 'SK8-HI Pro ', '04', 'SAMPLE', '2019-03-17 23:03:46'),
	(38, 'Era ', '04', 'SAMPLE', '2019-03-17 23:03:53'),
	(39, 'Berle Pro ', '04', 'SAMPLE', '2019-03-17 23:04:04'),
	(40, 'Old Skool ', '04', 'SAMPLE', '2019-03-17 23:04:20'),
	(41, 'Classic Slip-on ', '04', 'SAMPLE', '2019-03-17 23:04:31'),
	(42, 'Half Cab Pro ', '04', 'SAMPLE', '2019-03-17 23:04:52'),
	(43, 'Authentic ', '04', 'SAMPLE', '2019-03-17 23:05:11'),
	(44, 'Style36 ', '04', 'SAMPLE', '2019-03-17 23:05:58'),
	(45, 'Style43 ', '04', 'SAMPLE', '2019-03-17 23:06:00'),
	(46, 'Gel-lyte V ', '05', 'SAMPLE', '2019-03-17 23:06:52'),
	(47, 'Gel-Lyte ', '05', 'SAMPLE', '2019-03-17 23:07:13'),
	(48, 'Gel-DS Trainer ', '05', 'SAMPLE', '2019-03-17 23:07:04'),
	(50, 'Gel-Mai ', '05', 'SAMPLE', '2019-03-17 23:07:57'),
	(51, 'Gel-PTG ', '05', 'SAMPLE', '2019-03-17 23:08:07'),
	(52, 'Gel-Lyte 3', '05', 'SAMPLE', '2019-03-17 23:08:30'),
	(53, 'Gel-Nimbus 21', '05', 'SAMPLE', '2019-03-17 23:09:47'),
	(54, 'GT-2000 7', '05', 'SAMPLE', '2019-03-17 23:09:56'),
	(55, 'MetaRide', '05', 'SAMPLE', '2019-03-17 23:10:04'),
	(56, 'Yeezy boast 350 v2', '02', 'SAMPLE', '2019-03-18 09:49:27');
/*!40000 ALTER TABLE `t_prd` ENABLE KEYS */;

-- 테이블 centipede.t_releaseinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_releaseinfo` (
  `BOARD_UID` varchar(100) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(1000) DEFAULT NULL,
  `REL_DT` date DEFAULT NULL,
  `RSGSTR_ID` varchar(100) DEFAULT NULL,
  `VISIT_CNT` int(11) unsigned DEFAULT 0,
  `RSGST_DT` datetime DEFAULT NULL,
  `FILE_NO` int(11) DEFAULT 0,
  `USE_YN` varchar(50) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='발매정보 테이블입니다. ';

-- 테이블 데이터 centipede.t_releaseinfo:~11 rows (대략적) 내보내기
DELETE FROM `t_releaseinfo`;
/*!40000 ALTER TABLE `t_releaseinfo` DISABLE KEYS */;
INSERT INTO `t_releaseinfo` (`BOARD_UID`, `NUMBER`, `TITLE`, `CONTENTS`, `REL_DT`, `RSGSTR_ID`, `VISIT_CNT`, `RSGST_DT`, `FILE_NO`, `USE_YN`) VALUES
	('B0001', 1, 'NIKE AIR VAPORMAX 3.0 “WHITE VOLT”', 'The Nike Air VaporMax 3.0 is set to take off running into 2019 with a load of new and classic color options.\r\n\r\nToday, we take a look at a vibrant take of the third installment VaporMax silhouette. This iteration features a White Flyknit upper with Black strikes throughout, along with bold Black detailing on the Swoosh logo, laces, and heel counter. Volt accents appear on the Flywire cables lace tips and VaporMax sole, while having Crimson hits on the tongue label and back heel tab.\r\n\r\nNIKE AIR VAPORMAX 3.0 WHITE VOLT CRIMSON RELEASE DATE\r\nCheck out the additional photos below, and look for this VaporMax 3.0 to release on April 11th at select Nike Sportswear retailers and Nike.com. The retail price tag is set at $190 USD.', '2019-04-11', 'admin', 0, '2019-03-17 23:30:49', 1, 'Y'),
	('B0001', 2, 'NIKE AIR VAPORMAX 3.0 “LASER FUCHSIA”', 'Nike continues to add to their latest VaporMax 3.0 lineup as they’re set to release another new colorway to kick off the spring season with.\r\n\r\nDressed in a Black, Blue Lagoon, Laser Fuchsia, and Metallic Silver color scheme. This Nike Air VaporMax sports a combination of Pink, Blue, and Black throughout its Flyknit upper paired with a Metallic Purplish-styled Swoosh logo on the sides. An iridescent-like full-lenght VaporMax sole unit completes the design.\r\n\r\nNIKE AIR VAPORMAX 3.0 LASER FUCHSIA RELEASE DATE\r\nLook for the Nike Air VaporMax 3.0 “Laser Fuchsia” to release on April 1st at select retailers such as finishline.com. The retail price tag is set at $190 USD.', '2019-04-01', 'admin', 0, '2019-03-17 23:32:52', 2, 'Y'),
	('B0001', 3, 'DRAKE REVEALS NEW NIKE ZOOM VOMERO 5', 'While in Paris during his European “Assassination Vacation” tour, Drake revealed a never-before-seen colorway of the Nike Zoom Vomero 5.\r\n\r\nThis pairs sports a Black-based upper with Infrared accents appearing on each side of the performance runner. Its signature Air ventilation on the heel atop a Nike Air Zoom cushioning completes the design.\r\n\r\nNo word on if this particular colorways of the Nike Zoom Vomero 5 will release, while it could just be an exclusive for Drake like the Air Max Plus he debuted back in August 2018.', '2019-08-01', 'admin', 1, '2019-03-17 23:35:45', 3, 'Y'),
	('B0001', 4, 'NIKE AIR FORCE 1 LOW “PROCELL”', 'The “NYC Editions” is a celebration of New York City, developed from the ground up in partnership with local community curators.\r\n\r\nA canvas for self-expression, NYC Editions creates new space for young New York icons to curate their own city inspiration using Nike footwear and apparel.\r\n\r\nProcell considers the city his blank canvas— a symbol of potential that every individual can shape and model. The collection itself is inspired by the art, sport and culture surrounding the Procell shop in downtown NYC, specifically during the creative era the Air Force 1 was born.\r\n\r\nNIKE AIR FORCE 1 LOW PROCELL RELEASE DATE\r\nCheck out the official photos below, and look for this Air Force 1 Low to arrive on March 18th at select retailers and Nike.com. The retail price tag is set at $110 USD.', '2019-03-18', 'admin', 1, '2019-03-17 23:36:44', 4, 'Y'),
	('B0001', 5, 'ADIDAS FYW S-97 SET TO LAUNCH IN “TRIPLE WHITE”', 'adidas Originals’ latest archive-inspired sneaker, the FYW S-97, is set to launch in a clean women’s exclusive “Triple White” iteration.\r\n\r\nThe shoe is also part of Ronnie Fieg’s Kith x adidas FYW S-97 Collection that will be available in two color options.\r\n\r\nThis release of the shoe features a White mesh upper with leather overlays on the quarter panel, sides, and toe box to give off that retro look. Its hefty performance sole unit with Torsion technology completes the design.\r\n\r\nGet a better look below, and expect this women’s FYW S-97 to release on March 23rd at select overseas retailers such as Asphalt Gold.', '2019-03-23', 'admin', 0, '2019-03-17 23:38:49', 5, 'Y'),
	('B0001', 6, 'ADIDAS CONTINENTAL 80 RELEASING IN “BLACK LEOPARD”', 'Releasing alongside the “Leopard” rendition, adidas Originals has another exotic-printed Continental 80 covered in “Black Leopard.”\r\n\r\nIts entire upper is done in a Black Leopard hairy fur material with a Black mesh tongue and matching leather heel both completed with White logos. White continues on the midsole atop a Gum rubber outsole.\r\n\r\nADIDAS CONTINENTAL 80 BLACK LEOPARD RELEASE DATE\r\nCheck out the official photos below, and look for this Black Leopard Continental 80 to release very soon at select retailers and adidas.com. The retail price tag is set at $80 USD.', '2019-03-17', 'admin', 0, '2019-03-17 23:39:35', 6, 'Y'),
	('B0001', 7, 'KITH X ADIDAS FYW S-97 COLLECTION', 'Ronnie Fieg is set to launch his upcoming adidas Consortium collaboration on the ’90s runner, the FYW Salvation.\r\n\r\nOriginally released in 1997 as part of the adidas EQT line, a silhouette that debuted the brand’s Feet Your Wear technology. This iteration sports a White mesh upper with leather overlays. Highlighting the shoe are Green and Neon Yellow accents on the tongue logo, eyelets, liner, and branding on the midsole. Additional details includes reflective hints as well as Ronnie putting his own twist to the FYW Freddie mascot by including an “R” and “F” to his eyes.\r\n\r\nRonnie Fieg adidas FYW Salvation Release Date\r\n\r\nRONNIE FIEG ADIDAS FYW SALVATION RELEASE DATE\r\nLook for the Ronnie Fieg x adidas FYW Salvation to release on March 18th at Kith locations and Kith.com. Stay tuned for more updates.', '2019-03-18', 'admin', 1, '2019-03-17 23:42:29', 7, 'Y'),
	('B0001', 8, 'DETAILED LOOK AT THE ADIDAS YEEZY BOOST 350 V2 “TRUE FORM”', 'To release along with the “Clay” and “Hyperspace” colorways, the adidas Yeezy Boost 350 V2 will also be arriving in a “True Form” iteration.\r\n\r\nThis is also said to be a “special release” as part of an upcoming adidas Yeezy Spring 2019 lineup. It features a Grey-based upper with a translucent midfoot stripe and a new gradient fade on the midsole.\r\n\r\nADIDAS YEEZY BOOST 350 V2 TRUE FORM RELEASE DATE\r\nLook for the adidas Yeezy Boost 350 V2 “True Form” to release exclusively in Europe, Russia and Ukraine StockX on March 16th. The retail price tag is set at $220 USD.', '2019-03-16', 'admin', 1, '2019-03-17 23:43:22', 8, 'Y'),
	('B0001', 9, 'ATMOS REVELAS ADIDAS YUNG-1 COLLAB INSPIRED BY THE BARBER SHOP', 'Japanese retailer atmos is set to release their latest adidas collaboration on the Yung-1 silhouette decked-out in a barbershop motif.\r\n\r\nDressed in a Footwear White, Collegiate Royal, and Scarlet color scheme. This adidas Yung-1 features a White mesh upper with Grey and Metallic Silver overlays. Highlighting the shoe are its classic Red, White, and Blue on the Three Stripes as a nod to the old school barbershop pole.\r\n\r\nATMOS ADIDAS YUNG-1 BARBER SHOP RELEASE DATE\r\nLook for the atmos x adidas Yung-1 to release on March 16th exclusively at atmos. The retail price tag is set at $130 USD.', '2019-03-16', 'admin', 2, '2019-03-17 23:44:41', 9, 'Y'),
	('B0001', 10, 'ASICS GEL LYTE ARRIVES IN TEAL BLUE AND GLACIER GREY', 'The ASICS Gel Lyte was originally released back in 1987. This new version comes with most of the original design.\r\n\r\nIt comes with a better and improved design of a model while keep its OG style. Featuring GEL technology for a more comfortable and unique walking experience. It also includes a Nyla-sheen synthetic fabric and DURASKIN reinforcement.\r\n\r\nThis new Teal Blue/Glacier Grey colorway is totally ready for the upcoming spring days, which you can find available at select retailers such as Xtreme.', '2019-03-17', 'admin', 1, '2019-03-17 23:45:41', 10, 'Y'),
	('B0001', 11, 'ASICS GEL DS TRAINER OG RETURNS IN CREAM AND SILVER', 'Originally launched in 1995, this is a brand new version of the Gel-DS Trainer OG coming dressed in a Cream and Silver colorway.\r\n\r\nFeaturing GEL cushioning and a flexible DUOSOLE, the Gel-DS was born to run, but it is also perfect to use on the streets. This clean iteration comes with a mesh upper with suede overlays, and textile lining\r\n\r\nTake look at the additional photos below, and look for this Gel-DS Trainer available at select retailers such as SneakAvenue.', '2019-03-17', 'admin', 0, '2019-03-17 23:46:33', 11, 'Y'),
	('B0001', 12, 'JAPANESE ARTIST RELEASES HIS OWN VANS SK8-HI', 'Inspired by modern mid-century details and illustrations, the Vans x Yusuke Hanai collaboration showcases the Japanese artists aesthetic and style.\r\n\r\nThis Yusuke Vans Sk8-Hi features custom graphics that combines the iconic Vans high top skate shoe with sturdy canvas and suede uppers. Additional signature details includes a rubber toe cap, UltraCush sockliners with upgraded cushioning, Pro Vulc Lite construction atop the classic rubber waffle outsole.\r\n\r\nTake a better look below, and you can find sizes of the Vans x Yusuke Hanai Sk8-Hi 138 Decon SF available directly on Vans.com. The retail price tag is set at $72 USD.', '2019-03-17', 'admin', 1, '2019-03-17 23:52:17', 12, 'Y'),
	('B0001', 13, 'VANS PRESENTS THE “MULTI LOGO” SLIP-ON COLLECTION', 'Vans brings us a new and updated “Multi Logo” version of the classic Slip-On in four color options dressed in Black, Blue, Brown, and Cream with Hot Pink lettering.\r\n\r\nEach Vans Slip-On come constructed in the signature canvas upper with Vans logo printed throughout. “Off the Wall Originals” branding on the heel atop a waffle rubber sole completes the design.\r\n\r\nCheck out the collection below, and find them available at select Vans skate shops such as Feature. The retail price tag is set at $65 USD.', '2019-03-17', 'admin', 4, '2019-03-17 23:53:15', 13, 'N');
/*!40000 ALTER TABLE `t_releaseinfo` ENABLE KEYS */;

-- 테이블 centipede.t_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_review` (
  `BOARD_UID` varchar(100) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `CAT_CD` varchar(50) DEFAULT '기타',
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(1000) DEFAULT NULL,
  `RSGSTR_ID` varchar(100) DEFAULT NULL,
  `VISIT_CNT` int(11) unsigned DEFAULT 0,
  `RSGST_DT` datetime DEFAULT NULL,
  `USE_YN` varchar(50) NOT NULL DEFAULT 'Y',
  `FILE_NO` varchar(50) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='리뷰 게시판  테이블입니다. ';

-- 테이블 데이터 centipede.t_review:~17 rows (대략적) 내보내기
DELETE FROM `t_review`;
/*!40000 ALTER TABLE `t_review` DISABLE KEYS */;
INSERT INTO `t_review` (`BOARD_UID`, `NUMBER`, `CAT_CD`, `TITLE`, `CONTENTS`, `RSGSTR_ID`, `VISIT_CNT`, `RSGST_DT`, `USE_YN`, `FILE_NO`) VALUES
	('B0002', 1, '01', 'NIKE RELEASING THE AIR FORCE 1 + CORTEZ FROM THE “NOISE CANCELLING” COLLECTION', 'Releasing alongside the Air Jordan 1, Nike will also be launching the Air Force 1 and Cortez form their “Noise Cancelling” Collection.\r\n\r\nFew have a talent for cancelling out the noise like Odell Beckham Jr. The Air Force 1 Low from the Noise Cancelling Pack takes cues from the football star’s loud talent, charismatic personality and game-changing plays, allowing wearers to customize the all-White upper to fit their unique aesthetic.\r\n\r\nWith everyday style and grand slam elegance, the Cortez shares more than a few things in common with Maria Sharapova. The Noise Cancelling Pack version of the California classic sports a White-on-White, customizable upper that encourage individual style without sacrificing sleek design.\r\n\r\nNIKE AIR FORCE 1 LOW + NIKE CORTEZ NOISE CANCELLING RELEASE DATE\r\nLook for both the Air Force 1 and Cortez “Noise Cancelling” to release on March 12th on the Nike SNKRS app. The retail price tag is set at $120 USD and $110 USD, respectively.', 'admin', 0, '2019-03-18 09:13:33', 'Y', '14'),
	('B0002', 2, '01', 'A NIKE AIR MAX 95 ESSENTIAL', 'Spring is right around the corner, which means Nike will be releasing plenty of White sneakers in the coming weeks. One of them will include an upcoming Air Max 95.\r\n\r\nThis iteration of the classic silhouette comes crafted in a combination of mesh and leather with reflective detailing and Silver accents. An icy translucent outsole completes the design.\r\n\r\nCheck out the full set of official photos below, and expect this Air Max 95 to release later this spring at select retailers and Nike.com. The retail price tag is set at $160 USD.', 'admin', 0, '2019-03-18 09:20:18', 'Y', '15'),
	('B0002', 3, '01', 'NIKE KYRIE 5 “OREO”', 'Much like they did with the Kyrie 4, Nike is set to release another Oreo-like colorway of Kyrie Irving’s current signature shoe, the Kyrie 5.\r\n\r\nDressed in a clean White and Black color scheme. This Nike Kyrie 5 features an all-White upper with Black covering the Flytrap overlay, tongue branding and Swoosh logos. A speckled Black rubber sole completes the design.\r\n\r\nNIKE KYRIE 5 OREO WHITE BLACK RELEASE DATE\r\nLook for the Nike Kyrie 5 “Oreo” to release on March 22nd at select retailers and Nike.com. The retail price tag is set at $130 USD.', 'admin', 1, '2019-03-18 09:21:44', 'Y', '16'),
	('B0002', 4, '02', 'ADIDAS YEEZY BOOST 700 “INERTIA”', 'Part of Yeezy Season 8, Kanye West will be releasing a new colorway of the Yeezy Boost 700 in a “Inertia” makeup.\r\n\r\nThis adidas Yeezy Boost 700 features a Blueish/Grayish upper constructed in a mix of suede and mesh. Other details includes Peach accents on the midsole atop a Light Gum rubber outsole.\r\n\r\nADIDAS YEEZY BOOST 700 INERTIA RELEASE DATE\r\nLook for the adidas Yeezy Boost 700 “Inertia” to release on March 9th at select adidas Originals retailers and StockX. The retail price tag is set at $300 USD.', 'admin', 0, '2019-03-18 09:22:41', 'Y', '17'),
	('B0002', 5, '02', 'ADIDAS YEEZY BOOST 350 V2 “ZEBRA”', 'Kanye West and adidas are set to restock a few of their classic Yeezy Boost 350 V2 colorways this holiday season.\r\n\r\nOne of those is the “Zebra” iteration of the adidas Yeezy Boost 350 V2 that comes in the classic White and Black striped upper with Red contrasting accents on the lettering.\r\n\r\nADIDAS YEEZY BOOST 350 V2 ZEBRA RESTOCK RELEASE DATE\r\nLook for the adidas Yeezy Boost 350 V2 “Zebra” to re-release globally on\r\nNovember 9th and in the US on November 16th at select adidas Originals retailers and StockX. The retail price tag is set at $220 USD.', 'admin', 2, '2019-03-18 09:23:43', 'Y', '18'),
	('B0002', 6, '02', 'RELEASE DATE FOR THE ADIDAS YEEZY 500 “SALT”', 'Kanye West and adidas will be expanding their Yeezy 500 lineup throughout the year. Set to make a debut later this fall, is an upcoming “Salt” colorway.\r\n\r\nThis adidas Yeezy 500 comes constructed in a mix of premium materials. Dubbed “Salt,” the shoe receives a Triple White color scheme with matching tonal detailing and rubber sole.\r\n\r\nADIDAS YEEZY 500 SALT RELEASE DATE\r\nLook for the adidas Yeezy 500 “Salt” to release on November 30th at select retailers and StockX. The retail price tag is set at $200 USD.', 'admin', 0, '2019-03-18 09:24:37', 'Y', '19'),
	('B0002', 7, '01', 'NIKE AIR MAX 97 “NEON SEOUL”', 'Gwang Shin, the winner of Nike’s On Air contest, will be having his Nike Air Max 97 design release during the month of April.\r\n\r\nInspired by the city’s neon signs, Gwang created the Air Max 97 Neon Seoul concept with a matte black body, neon colors and contours inspired by the Taeguk symbol on his nation’s flag. The neon Swoosh and Seoul LED logos capture the energy of a city that comes alive at night.\r\n\r\nNIKE AIR MAX 97 NEON SEOUL RELEASE DATE\r\nLook for the Nike Air Max 97 “Neon Seoul” to release on April 13th at select retailers and Nike.com. The retail price tag is set at $200 USD.', 'admin', 9, '2019-03-18 09:28:00', 'Y', '20'),
	('B0002', 8, '03', 'CONVERSE AND DOE UNVEIL “BE FORMLESS” COLLECTION', 'Shanghai streetwear boutique DOE, takes its name from the moniker for the anonymous or unknown person: John Doe. Celebrating its 5th anniversary, Converse’s collaboration with DOE connects the name with the traditional Eastern philosophy “empty your mind, be formless.”\r\n\r\nThe capsule collection is highlighted by the Chuck 70 and Jack Purcell, both of rich carry cubed graphics, inspired by “suprematism,” a challenge to traditional figurative art, and prepared in an engineered jacquard knit. A woodgrain print features in the sockliner (a reference to the wooden anniversary marked by 5 years). A track jacket, track pant and T-shirt complete the offerings.\r\n\r\nDOE CONVERSE BE FORMELESS COLLECTION RELEASE DATE\r\nLook for the DOE x Converse “Be Formless” Collection to release on March 7th at Converse.com and in-store at DOE.', 'admin', 0, '2019-03-18 09:30:46', 'Y', '21'),
	('B0002', 9, '03', 'JW ANDERSON X CONVERSE RUN STAR HIKE', 'JW Anderson is set to release his latest collaboration with Converse by adding a new midsole to the Chuck Taylor creating the Run Star Hike.\r\n\r\nThe collaboration drew immediate attention when it debuted during the designer’s Spring/Summer 2019 Collection show last September in London. It features a White canvas upper atop a chunky midsole tooling from the Converse Run Star, a runner that debuted in 2018. The date “1917” written by the usual All-Star logo honors the birth of the original model. A combination of Gum, White, and Blue on the outsole completes the design.\r\n\r\nJW ANDERSON CONVERSE RUN STAR HIKE RELEASE DATE\r\nLook for the JW Anderson x Converse Run Star Hike to release on February 12th at select retailers and Converse.com.', 'admin', 0, '2019-03-18 09:31:47', 'Y', '22'),
	('B0002', 10, '03', 'CONVERSE GOLF LE FLEUR “INDUSTRIAL PACK”', 'Tyler, The Creator and Converse are set to release their latest “Industrial” colorway of their GOLF le FLEUR collaboration.\r\n\r\nBoth Converse One Star releases come in a two-tone color scheme. They come crafted in leather uppers with bold stitching and the model’s signature floral One Star logo. GOLF le FLEUR text on the sides atop a vulcanized White sole with sunflower decals on the outsole completes the design.\r\n\r\nCONVERSE GOLF LE FLEUR INDUSTRIAL PACK RELEASE DATE\r\nLook for the Converse GOLF le FLEUR “Industrial” Pack to release on February 23rd at select Converse retailers and Converse.com.\r\n\r\nUPDATE: Converse has officially unveiled the Tyler, the Creator’s Golf Le Fleur “Industrial” Pack. Each shoe comes with a matching boiler suit inspired by the ’60s American workwear with contrast paneling, overlay highlights, vintage midsoles and GOLF le FLEUR* branding. The collection will release on February 23rd at select retailers, Golfwang.com and Converse.com.', 'admin', 2, '2019-03-18 09:32:38', 'Y', '23'),
	('B0002', 11, '03', 'CLOT X CONVERSE COLLABORATION INSPIRED BY POLAR BEARS', 'CLOT and Converse have teamed up two release a series of ice cold silhouettes including the classic Chuck 70 Hi and Jack Purcell Low inspired by the Arctic’s majestic polar bear.\r\n\r\n\r\nThe Converse Chuck 70 Hi features a tri-panel Sherpa execution patchworked together in a variety of Off-White shades, with fur lining on the interior for maximum coziness. Zipper closures on the heelstay ensure easy foot access, and Polar Bear paw prints are found on the outsole as a final tribute to the endangered animal.\r\n\r\nThe Converse Jack Purcell Low sports classic Egret foxing, while Sherpa lining within the upper creates an incredibly comfortable feel, enhanced by a removed heel counter for a “slipper” like approach to the shoe.\r\n\r\nCLOT CONVERSE CHUCK 70 HI + JACK PURCELL RELEASE DATE\r\nLook for the Clot x Converse “Ice Cold” Pack to release on February 1st at select retailers and Converse.com.', 'admin', 0, '2019-03-18 09:33:31', 'Y', '24'),
	('B0002', 12, '04', 'ASHLEY WILLIAMS RELEASING HER OWN VANS PACK', 'London-based designer Ashley Williams has joined forces with Vans to create a vibrant collection featuring the brand’s all-time favorite silhouettes.\r\n\r\nThose models includes the Vans Authentic, Era, Slip-On, and Style 93 all designed in their own unique style. Those features includes wild piercing, newsletter print, vase and tiger print, and buckle straps.\r\n\r\nASHLEY WILLIAMS VANS PACK RELEASE DATE\r\nLook for the Ashley Williams x Vans Pack to release on March 1st at select retailers and Vans.com.', 'admin', 0, '2019-03-18 09:34:28', 'Y', '25'),
	('B0002', 13, '04', 'VANS AUTHENTIC RELEASES WITH BLUR CHECKERBOARD PRINT', 'Vans continues to stay creative with their iconic silhouettes, and the latest innovated release is their newly introduced Vans Blur Check Authentic.\r\n\r\nThis low-top style features canvas uppers highlighted in blurred checkerboard print in Black and White. Other details includes metal eyelets, White rubber midsole, waffle outsole and its signature Red license plate on the heel.\r\n\r\nYou can now find the Vans Blur Check Authentic available directly on Vans.com. The retail price tag is set at $60 USD.', 'admin', 0, '2019-03-18 09:35:40', 'Y', '26'),
	('B0002', 14, '04', 'VANS VAULT OG OLD SKOOL LX COLLECTION', 'Vans Vault presents a trio of the classic OG Old Skool LX silhouette as part of a new collection for the holiday season.\r\n\r\nDressed in three color options including, Plaza Taupe, Marshmallow, and Black. Each are built with soft suede uppers highlighted by matching laces and tonal branding. Padded collars for added cushion and comfort atop classic waffle soles completes the design.\r\n\r\nYou can now find this Vans Vault OG Old Skool LX Collection available at select retailers like Feature. The retail price tag is set at $80 USD each.', 'admin', 0, '2019-03-18 09:36:13', 'Y', '27'),
	('B0002', 15, '05', 'ASICS GEL KAYANO 5 OG ARRIVES IN OFF-WHITE', 'The ASICS Gel Kayano 5 OG introduces a brand new style to the ASICS collection that is now arriving in a clean Off-White colorway.\r\n\r\n\r\nBuilt for runners and also perfect to walk the streets, ASICS’ take on the bulky shoe is offers stability, style and comfort. A unique and striking design, a distinct selection of colors and materials make of the Gel Kayano 5 OG one of the most interesting models of the season.\r\n\r\nTake a closer look below, and you can find this Gel Kayano 5 OG available at select retailers such as Foot District.', 'admin', 0, '2019-03-18 09:45:24', 'Y', '28'),
	('B0002', 16, '05', 'ASICS AND KIKO KOSTADINOV BRING BACK THE GEL DELVA LINE', 'ASICS and Kiko Kostandinov reveal the fourth installment of their performance-wear collaboration, announcing the release of the Gel Delva in new colorways.\r\n\r\nThe new colorways for the silhouette are Cool Mist/Forest Green, Murasaki/Performance Black and Tai-Chi Yellow/Taupe Grey. Each colorway adds distinct new elements to the accompanying runway collection.\r\n\r\nFirst debuted during the Kiko Kostadinov AW18 show in London, the technical elements of the Gel Delva remain the same; a FLYTEFOAM midsole, DYNAMIC DOUMAX material on the base of the sneaker and I.G.S (Impact Guidance System) technology granting the wearer a firm yet comfortable feel. The formula for the GEL-DELVATM model is completed with a GEL-KAYANO®24 back counter and rounded off with a GEL-FUJITRABUCOTM7 upper.\r\n\r\nKIKO KOSTADINOV ASICS GEL DELVA RELEASE DATE\r\nThe preview launches will be held on January 18th in Paris and London prior to the worldwide release of the Gel Delva on February 1st.', 'admin', 0, '2019-03-18 09:46:22', 'Y', '29'),
	('B0002', 17, '05', 'A CLEAN COLORWAY OF THE ASICS GEL-DS TRAINER', 'ASICS brings back the Gel-DS. Originally released in 1995, the Gel-DS Trainer model was designed as a super lightweight running sneaker, built for all runners.\r\n\r\n\r\nFeaturing a leather and suede upper, it also includes a chunky off-White colored sole with DUOSOLE technology. This new iteration includes the necessary GEL technology cushioning.\r\n\r\nYou can now find this clean iteration of the ASICS Gel-DS Trainer available at select retailers such as SneakAvenue.', 'admin', 0, '2019-03-18 09:47:29', 'Y', '30');
/*!40000 ALTER TABLE `t_review` ENABLE KEYS */;

-- 테이블 centipede.t_review_rpl 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_review_rpl` (
  `RPL_NO` int(11) NOT NULL COMMENT '댓글번호',
  `NUMBER` int(11) DEFAULT NULL COMMENT '글번호',
  `CAT_CD` char(10) DEFAULT NULL COMMENT '카테고리코드',
  `GD_CD` varchar(100) DEFAULT NULL COMMENT '상품명',
  `PAST_LENGTH` int(11) DEFAULT NULL COMMENT '과거길이',
  `NEW_LENGTH` int(11) DEFAULT NULL COMMENT '신규길이',
  `SIZE` varchar(30) DEFAULT NULL COMMENT '크기',
  `RSGSTR_ID` varchar(30) DEFAULT NULL COMMENT '등록자',
  `RSGST_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`RPL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='리뷰리플';

-- 테이블 데이터 centipede.t_review_rpl:~4 rows (대략적) 내보내기
DELETE FROM `t_review_rpl`;
/*!40000 ALTER TABLE `t_review_rpl` DISABLE KEYS */;
INSERT INTO `t_review_rpl` (`RPL_NO`, `NUMBER`, `CAT_CD`, `GD_CD`, `PAST_LENGTH`, `NEW_LENGTH`, `SIZE`, `RSGSTR_ID`, `RSGST_DT`) VALUES
	(1, 7, '01', '1', 270, 275, 'm', 'admin', '2019-03-18 09:48:33'),
	(2, 5, '02', '25', 260, 265, 'm', 'admin', '2019-03-18 09:49:52'),
	(3, 10, '04', '40', 255, 255, 'l', 'admin', '2019-03-18 09:50:21'),
	(4, 7, '01', '18', 285, 280, 's', 'admin3', '2019-03-30 13:32:15');
/*!40000 ALTER TABLE `t_review_rpl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
