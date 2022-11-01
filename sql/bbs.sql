-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-11-01 14:23:00
-- 服务器版本： 8.0.24
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `bbs`
--

-- --------------------------------------------------------

--
-- 表的结构 `bbs_article`
--

CREATE TABLE `bbs_article` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `author_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `collections` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `approves` int NOT NULL DEFAULT '0',
  `comments` int NOT NULL DEFAULT '0',
  `is_delete` int NOT NULL DEFAULT '0',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_article`
--

INSERT INTO `bbs_article` (`id`, `title`, `content`, `category`, `status`, `type_id`, `author_id`, `collections`, `views`, `approves`, `comments`, `is_delete`, `create_time`, `update_time`) VALUES
(91, 'testtesttesttest', 'test', 'article', 0, 1, 'd637174e7ac74c91efc9721028a9b067', 4, 47, 1, 3, 0, '2022-10-21:20:05:58', '2022-10-21:20:05:58'),
(93, '树洞树洞?有人在吗？我要问问题了！', '冬天怎么这么困啊？！！！', 'article', 0, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 1, 2, 0, 0, 1, '2022-10-24:14:01:48', '2022-10-24:14:09:21'),
(94, '你好！！！！！！！！！！！', '你好！！！！！！！！！！！！！！！', 'article', 0, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 1, 46, 5, 2, 0, '2022-10-24:14:20:04', '2022-10-24:14:20:04'),
(95, 'Lynn hello', 'hello my friends', 'article', 0, 5, '0cf1111a8476cd6d94c682577df8aa7d', 1, 12, 0, 2, 0, '2022-10-30:23:04:00', '2022-10-30:23:04:00'),
(96, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:17'),
(97, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:20'),
(98, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:23'),
(99, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:26'),
(100, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:28'),
(101, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:30'),
(102, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:32'),
(103, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:35'),
(104, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:38'),
(105, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:41'),
(106, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 0, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 1, 4, 0, 1, 0, '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(107, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:56'),
(108, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:05:12'),
(109, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:06:10'),
(110, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:05:16'),
(111, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:05:36'),
(112, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:06:07'),
(113, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:06:04'),
(114, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:06:02'),
(115, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:05:58'),
(116, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:05:54'),
(117, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:47'),
(118, '今天要答辩，我先讲两句吧', '祝大家圆满结束！', 'article', 1, 1, 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, 0, 0, 1, '2022-11-01:10:03:18', '2022-11-01:10:04:44');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_article_type`
--

CREATE TABLE `bbs_article_type` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL,
  `is_delete` int NOT NULL,
  `creator_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_article_type`
--

INSERT INTO `bbs_article_type` (`id`, `type`, `status`, `is_delete`, `creator_id`, `create_time`, `update_time`) VALUES
(1, '树洞', 0, 0, '028a7457e1436360a6c405be3149da21', '0', '0'),
(3, '吐槽', 0, 0, '028a7457e1436360a6c405be3149da21', '0', '0'),
(4, '求助', 0, 0, '028a7457e1436360a6c405be3149da21', '0', '0'),
(5, '交友', 0, 0, '028a7457e1436360a6c405be3149da21', '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_child_comment`
--

CREATE TABLE `bbs_child_comment` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_reply_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_reply_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_reply_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_reply_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_child_comment`
--

INSERT INTO `bbs_child_comment` (`id`, `article_id`, `parent_id`, `reply_id`, `reply_email`, `reply_nick_name`, `reply_avatar`, `reply_reply_id`, `reply_reply_nick_name`, `reply_reply_email`, `reply_reply_avatar`, `content`, `create_time`, `update_time`) VALUES
(-1329414142, 94, '1057103874', '0cf1111a8476cd6d94c682577df8aa7d', '314699890@qq.com', 'L&Z', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'Hi', '2022-10-30:23:06:11', '2022-10-30:23:06:11'),
(457359361, 95, '-1962754046', '0cf1111a8476cd6d94c682577df8aa7d', '314699890@qq.com', 'L&Z', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'how are you', '2022-10-30:23:05:09', '2022-10-30:23:05:09'),
(927080449, 91, '662839297', 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'test', '2022-10-24:13:59:55', '2022-10-24:13:59:55'),
(939663361, 91, '662839297', 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'test', '2022-10-24:13:59:55', '2022-10-24:13:59:55'),
(939663362, 91, '662839297', 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'test', '2022-10-24:13:59:55', '2022-10-24:13:59:55'),
(943857665, 91, '662839297', 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '', '', '', '', 'test', '2022-10-24:13:59:55', '2022-10-24:13:59:55');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_focus_author`
--

CREATE TABLE `bbs_focus_author` (
  `id` int NOT NULL,
  `focus_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `focused_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_focus_author`
--

INSERT INTO `bbs_focus_author` (`id`, `focus_id`, `focused_id`, `create_time`, `update_time`) VALUES
(2, '028a7457e1436360a6c405be3149da21', 'b209328f67e768635cc1107f31724aeb', '2022-03-14:17:31:15', '2022-03-14:17:31:15'),
(18, '028a7457e1436360a6c405be3149da21', '62bf474b5af927d71833606203e98f73', '2022-03-17:16:46:09', '2022-03-17:16:46:09'),
(39, 'b209328f67e768635cc1107f31724aeb', '028a7457e1436360a6c405be3149da21', '2022-03-18:23:27:33', '2022-03-18:23:27:33'),
(41, '62bf474b5af927d71833606203e98f73', '028a7457e1436360a6c405be3149da21', '2022-04-25:13:25:22', '2022-04-25:13:25:22'),
(42, 'e7bcbe6a43bd51960dd67a427c13c45d', 'd637174e7ac74c91efc9721028a9b067', '2022-10-24:14:06:19', '2022-10-24:14:06:19'),
(43, 'e7bcbe6a43bd51960dd67a427c13c45d', '0cf1111a8476cd6d94c682577df8aa7d', '2022-11-01:10:09:20', '2022-11-01:10:09:20');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_message`
--

CREATE TABLE `bbs_message` (
  `id` int NOT NULL,
  `ori_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `des_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mes_type` int NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0' COMMENT '0：用户消息，1：系统消息',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_message`
--

INSERT INTO `bbs_message` (`id`, `ori_id`, `des_id`, `mes_type`, `content`, `is_delete`, `status`, `create_time`, `update_time`) VALUES
(-1979531263, '0cf1111a8476cd6d94c682577df8aa7d', '0cf1111a8476cd6d94c682577df8aa7d', 0, '评论了你', 0, 0, '2022-10-30:23:05:01', '2022-10-30:23:05:01'),
(-289267710, 'e7bcbe6a43bd51960dd67a427c13c45d', 'd637174e7ac74c91efc9721028a9b067', 0, '关注了你', 0, 0, '2022-10-24:14:06:19', '2022-10-24:14:06:19'),
(297934850, 'e7bcbe6a43bd51960dd67a427c13c45d', 'd637174e7ac74c91efc9721028a9b067', 1, '审核通过了你的文章', 0, 0, '2022-10-24:13:56:45', '2022-10-24:13:56:45'),
(436387842, '0cf1111a8476cd6d94c682577df8aa7d', '0cf1111a8476cd6d94c682577df8aa7d', 0, '回复了你', 0, 0, '2022-10-30:23:05:09', '2022-10-30:23:05:09'),
(1031974914, 'ea6e3928f7decd62cd15efc115941109', '0cf1111a8476cd6d94c682577df8aa7d', 1, '审核通过了你的文章', 0, 0, '2022-11-01:09:12:39', '2022-11-01:09:12:39'),
(1434628098, 'e7bcbe6a43bd51960dd67a427c13c45d', '0cf1111a8476cd6d94c682577df8aa7d', 0, '关注了你', 0, 0, '2022-11-01:10:09:20', '2022-11-01:10:09:20'),
(1627566082, 'e7bcbe6a43bd51960dd67a427c13c45d', 'e7bcbe6a43bd51960dd67a427c13c45d', 0, '评论了你', 0, 0, '2022-11-01:11:40:38', '2022-11-01:11:40:38'),
(1774366721, 'ea6e3928f7decd62cd15efc115941109', 'e7bcbe6a43bd51960dd67a427c13c45d', 1, '审核通过了你的文章', 0, 0, '2022-11-01:10:03:57', '2022-11-01:10:03:57'),
(1854058498, 'ea6e3928f7decd62cd15efc115941109', '0cf1111a8476cd6d94c682577df8aa7d', 1, '你的文章审核未通过', 0, 0, '2022-11-01:09:12:30', '2022-11-01:09:12:30'),
(1858256898, '0cf1111a8476cd6d94c682577df8aa7d', '0cf1111a8476cd6d94c682577df8aa7d', 1, '审核通过了你的文章', 0, 0, '2022-10-30:23:04:24', '2022-10-30:23:04:24');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_notice`
--

CREATE TABLE `bbs_notice` (
  `id` int NOT NULL,
  `title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_delete` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_notice`
--

INSERT INTO `bbs_notice` (`id`, `title`, `content`, `creator_id`, `is_delete`, `status`, `create_time`, `update_time`) VALUES
(2, '有言以对系统的使用', '# 关于系统的构成\n* 系统的架构是springboot+vue\n* 系统是单模块构成', 'ea6e3928f7decd62cd15efc115941109', 0, 0, '2022-10-07:11:42:31', '2022-11-01:10:03:28'),
(3, '关于系统的开发进度', '# 系统的整体功能\n* 登录功能\n* 发布文章\n* 消息通知', 'e7bcbe6a43bd51960dd67a427c13c45d', 0, 0, '2022-10-07:23:59:38', '2022-10-07:23:59:38');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_par_comment`
--

CREATE TABLE `bbs_par_comment` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_par_comment`
--

INSERT INTO `bbs_par_comment` (`id`, `article_id`, `user_id`, `user_email`, `nick_name`, `user_avatar`, `content`, `create_time`, `update_time`) VALUES
(-1962754046, 95, '0cf1111a8476cd6d94c682577df8aa7d', '314699890@qq.com', 'L&Z', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 'bro!', '2022-10-30:23:05:01', '2022-10-30:23:05:01'),
(662839297, 91, 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 'test', '2022-10-24:13:59:44', '2022-10-24:13:59:44'),
(1057103874, 94, 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '你好', '2022-10-24:14:53:56', '2022-10-24:14:53:56'),
(1640148993, 106, 'e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', '一只晓橘猫', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', '谢谢！', '2022-11-01:11:40:38', '2022-11-01:11:40:38');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_role`
--

CREATE TABLE `bbs_role` (
  `id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_role`
--

INSERT INTO `bbs_role` (`id`, `role`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_system_log`
--

CREATE TABLE `bbs_system_log` (
  `k_real_id` int NOT NULL,
  `id` int NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_system_log`
--

INSERT INTO `bbs_system_log` (`k_real_id`, `id`, `uid`, `ip`, `method_name`, `describe`, `url`, `create_time`, `update_time`) VALUES
(1, -423485438, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:02:22', '2022-10-24:15:02:22'),
(2, -1769857023, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:02:24', '2022-10-24:15:02:24'),
(3, -301850623, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:15:02:24', '2022-10-24:15:02:24'),
(4, 297934849, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:02:36', '2022-10-24:15:02:36'),
(5, 2000822274, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:02:41', '2022-10-24:15:02:41'),
(6, -75358206, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:01', '2022-10-24:15:03:01'),
(7, -1006493694, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:02', '2022-10-24:15:03:02'),
(8, 499261441, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:09', '2022-10-24:15:03:09'),
(9, -1170071550, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:10', '2022-10-24:15:03:10'),
(10, -1300094975, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:03:14', '2022-10-24:15:03:14'),
(11, -1539170302, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:15', '2022-10-24:15:03:15'),
(12, 1044520961, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:03:20', '2022-10-24:15:03:20'),
(13, 2030182401, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:15:03:20', '2022-10-24:15:03:20'),
(14, -1694359550, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:03:25', '2022-10-24:15:03:25'),
(15, -238936063, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:03:31', '2022-10-24:15:03:31'),
(16, -234741758, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:03:31', '2022-10-24:15:03:31'),
(17, -167632895, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:33', '2022-10-24:15:03:33'),
(18, -2092818430, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:43', '2022-10-24:15:03:43'),
(19, 398598145, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:44', '2022-10-24:15:03:44'),
(20, 956440577, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:46', '2022-10-24:15:03:46'),
(21, 985800706, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:48', '2022-10-24:15:03:48'),
(22, 767696898, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:03:50', '2022-10-24:15:03:50'),
(23, 1258430465, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:04:15', '2022-10-24:15:04:15'),
(24, 423763969, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:04:16', '2022-10-24:15:04:16'),
(25, -582868990, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:04:25', '2022-10-24:15:04:25'),
(26, -582868989, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:04:25', '2022-10-24:15:04:25'),
(27, 75636737, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:04:27', '2022-10-24:15:04:27'),
(28, 943857666, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:04:40', '2022-10-24:15:04:40'),
(29, -1216208894, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:06:02', '2022-10-24:15:06:02'),
(30, -595451902, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-10-24:15:06:25', '2022-10-24:15:06:25'),
(31, -708698111, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-10-24:15:06:26', '2022-10-24:15:06:26'),
(32, -1706942462, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-10-24:15:08:01', '2022-10-24:15:08:01'),
(33, -1644027902, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-10-24:15:08:02', '2022-10-24:15:08:02'),
(34, -125689854, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:09:25', '2022-10-24:15:09:25'),
(35, 943857666, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:15:09:26', '2022-10-24:15:09:26'),
(36, -1086185471, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:15:09:27', '2022-10-24:15:09:27'),
(37, 1140989953, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:09:33', '2022-10-24:15:09:33'),
(38, -2055069694, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:09:54', '2022-10-24:15:09:54'),
(39, -1899880447, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:09:54', '2022-10-24:15:09:54'),
(40, -507371519, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:11:37', '2022-10-24:15:11:37'),
(41, -1094574078, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:15:11:38', '2022-10-24:15:11:38'),
(42, -1304289278, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:15:12:54', '2022-10-24:15:12:54'),
(43, 12722178, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:15:12:54', '2022-10-24:15:12:54'),
(44, -478011390, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:13:03', '2022-10-24:15:13:03'),
(45, -478011389, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:13:03', '2022-10-24:15:13:03'),
(46, -129884158, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:13:10', '2022-10-24:15:13:10'),
(47, -2122178558, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:13:17', '2022-10-24:15:13:17'),
(48, -1966989311, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:13:17', '2022-10-24:15:13:17'),
(49, 495067138, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:13:22', '2022-10-24:15:13:22'),
(50, 495067139, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:13:22', '2022-10-24:15:13:22'),
(51, 1858215937, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:15:13:42', '2022-10-24:15:13:42'),
(52, 1157767170, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:14:26', '2022-10-24:15:14:26'),
(53, 1493311490, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:14:35', '2022-10-24:15:14:35'),
(54, 386015234, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:14:42', '2022-10-24:15:14:42'),
(55, 1694638082, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:14:48', '2022-10-24:15:14:48'),
(56, -1593696255, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:15:14:50', '2022-10-24:15:14:50'),
(57, -645783550, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:00', '2022-10-24:15:15:00'),
(58, 310517761, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:00', '2022-10-24:15:15:00'),
(59, -855498750, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:05', '2022-10-24:15:15:05'),
(60, -1052631038, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:07', '2022-10-24:15:15:07'),
(61, -1987960831, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:12', '2022-10-24:15:15:12'),
(62, -536731646, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:17', '2022-10-24:15:15:17'),
(63, 528621569, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:15:23', '2022-10-24:15:15:23'),
(64, 667033602, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:15:23', '2022-10-24:15:15:23'),
(65, -1920851967, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:34', '2022-10-24:15:15:34'),
(66, -985522175, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:15:39', '2022-10-24:15:15:39'),
(67, -2088624127, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:15:46', '2022-10-24:15:15:46'),
(68, -545120255, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:15:50', '2022-10-24:15:15:50'),
(69, 247603202, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:15:50', '2022-10-24:15:15:50'),
(70, 616701954, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:15:50', '2022-10-24:15:15:50'),
(71, 1086464001, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:15:51', '2022-10-24:15:15:51'),
(72, -687726590, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:15:16:02', '2022-10-24:15:16:02'),
(73, 247603202, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:16:05', '2022-10-24:15:16:05'),
(74, 16916481, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:16:14', '2022-10-24:15:16:14'),
(75, -721281023, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:15:16:16', '2022-10-24:15:16:16'),
(76, -2080235518, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:16:29', '2022-10-24:15:16:29'),
(77, 134356993, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:15:21:17', '2022-10-24:15:21:17'),
(78, 293740546, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:15:21:17', '2022-10-24:15:21:17'),
(79, 201531393, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:16:26:52', '2022-10-24:16:26:52'),
(80, -968679423, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:16:26:53', '2022-10-24:16:26:53'),
(81, -549249023, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:27:06', '2022-10-24:16:27:06'),
(82, -41738239, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:29:16', '2022-10-24:16:29:16'),
(83, -1773985790, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:41:31', '2022-10-24:16:41:31'),
(84, -1627185150, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:41:31', '2022-10-24:16:41:31'),
(85, 876814337, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:42:34', '2022-10-24:16:42:34'),
(86, -16572415, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:42:40', '2022-10-24:16:42:40'),
(87, 163782658, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:42:41', '2022-10-24:16:42:41'),
(88, 1262690306, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:42:42', '2022-10-24:16:42:42'),
(89, -255647742, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:42:48', '2022-10-24:16:42:48'),
(90, 1384325122, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:42:56', '2022-10-24:16:42:56'),
(91, -1102897151, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:47:31', '2022-10-24:16:47:31'),
(92, 204802, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:48:26', '2022-10-24:16:48:26'),
(93, 204801, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:48:26', '2022-10-24:16:48:26'),
(94, 1694703618, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:48:28', '2022-10-24:16:48:28'),
(95, -419225599, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:50:02', '2022-10-24:16:50:02'),
(96, -238870526, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:50:02', '2022-10-24:16:50:02'),
(97, -163373055, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:50:04', '2022-10-24:16:50:04'),
(98, -981262333, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:52:23', '2022-10-24:16:52:23'),
(99, -981262334, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:52:23', '2022-10-24:16:52:23'),
(100, 1577263105, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:52:25', '2022-10-24:16:52:25'),
(101, -847044607, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:54:06', '2022-10-24:16:54:06'),
(102, -670883839, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:16:54:06', '2022-10-24:16:54:06'),
(103, -1195171839, 'd637174e7ac74c91efc9721028a9b067', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:16:54:15', '2022-10-24:16:54:15'),
(104, -968679423, '游客', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.logout()', '用户退出了系统', '/user/logout', '2022-10-24:16:54:18', '2022-10-24:16:54:18'),
(105, -1622990846, '游客', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:16:54:40', '2022-10-24:16:54:40'),
(106, -1073537022, '游客', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.register(User,HttpServletResponse)', '用户进行了注册', '/user/register', '2022-10-24:16:56:09', '2022-10-24:16:56:09'),
(107, 247668737, '游客', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.logout()', '用户退出了系统', '/user/logout', '2022-10-24:16:56:16', '2022-10-24:16:56:16'),
(108, 948117505, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:16:56:19', '2022-10-24:16:56:19'),
(109, -2067587071, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:16:56:19', '2022-10-24:16:56:19'),
(110, -1857871870, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:17:01:58', '2022-10-24:17:01:58'),
(111, -373088254, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:17:01:59', '2022-10-24:17:01:59'),
(112, -612163582, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:17:02:04', '2022-10-24:17:02:04'),
(113, -1375526911, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:17:02:05', '2022-10-24:17:02:05'),
(114, -268230655, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:17:02:42', '2022-10-24:17:02:42'),
(115, 1954750465, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:17:03:07', '2022-10-24:17:03:07'),
(116, -1027399678, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:17:03:07', '2022-10-24:17:03:07'),
(117, 981671938, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:03:14', '2022-10-24:17:03:14'),
(118, 1136861186, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:03:15', '2022-10-24:17:03:15'),
(119, 1539514370, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:17:03:15', '2022-10-24:17:03:15'),
(120, 1187192834, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:03:16', '2022-10-24:17:03:16'),
(121, 1011032065, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:17:03:57', '2022-10-24:17:03:57'),
(122, 1774395394, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:17:04:03', '2022-10-24:17:04:03'),
(123, 1774395395, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:04:03', '2022-10-24:17:04:03'),
(124, -482140158, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:04:09', '2022-10-24:17:04:09'),
(125, 1099112450, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.changePerson(UserDto)', '用户进修改了个人信息', '/user/changePerson', '2022-10-24:17:04:24', '2022-10-24:17:04:24'),
(126, 457383938, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-24:17:04:50', '2022-10-24:17:04:50'),
(127, 1828921345, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-24:17:04:50', '2022-10-24:17:04:50'),
(128, 717430785, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:04:53', '2022-10-24:17:04:53'),
(129, -1807540223, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:04:55', '2022-10-24:17:04:55'),
(130, -1383915519, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:17:04:55', '2022-10-24:17:04:55'),
(131, 272834562, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:17:44:51', '2022-10-24:17:44:51'),
(132, -217899007, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-24:17:44:54', '2022-10-24:17:44:54'),
(133, -41738238, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-24:17:44:54', '2022-10-24:17:44:54'),
(134, 599990274, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.approve(Integer,boolean)', '用户点赞了文章', '/article/approve', '2022-10-24:17:45:01', '2022-10-24:17:45:01'),
(135, -1094508543, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:19:12:47', '2022-10-24:19:12:47'),
(136, 339943426, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:19:16:20', '2022-10-24:19:16:20'),
(137, 855842818, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:20:45:56', '2022-10-24:20:45:56'),
(138, -1350385663, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-24:23:11:20', '2022-10-24:23:11:20'),
(139, -1165836287, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:09:31:39', '2022-10-25:09:31:39'),
(140, 1518518273, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:09:32:02', '2022-10-25:09:32:02'),
(141, 620937217, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:11:40:47', '2022-10-25:11:40:47'),
(142, 381861889, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:11:41:02', '2022-10-25:11:41:02'),
(143, 453165058, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:11:41:08', '2022-10-25:11:41:08'),
(144, 1510129666, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:11:41:18', '2022-10-25:11:41:18'),
(145, -1618821119, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-25:20:09:58', '2022-10-25:20:09:58'),
(146, 1388494849, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-29:00:03:25', '2022-10-29:00:03:25'),
(147, 348307458, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-29:07:20:41', '2022-10-29:07:20:41'),
(148, -1736261630, 'f34f506dd572bb726366e63ec73755b6', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:22:59:50', '2022-10-30:22:59:50'),
(149, 922927106, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-30:23:00:58', '2022-10-30:23:00:58'),
(150, -1790787583, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-30:23:00:58', '2022-10-30:23:00:58'),
(151, 822263809, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:01:10', '2022-10-30:23:01:10'),
(152, 969064450, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:01:10', '2022-10-30:23:01:10'),
(153, -800931839, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-30:23:02:12', '2022-10-30:23:02:12'),
(154, -1199390718, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-30:23:02:13', '2022-10-30:23:02:13'),
(155, 688046082, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:02:20', '2022-10-30:23:02:20'),
(156, 688046081, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:02:20', '2022-10-30:23:02:20'),
(157, 8568834, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:02:39', '2022-10-30:23:02:39'),
(158, 184729601, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:02:39', '2022-10-30:23:02:39'),
(159, -1056784382, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-10-30:23:04:00', '2022-10-30:23:04:00'),
(160, -700268543, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:23:04:34', '2022-10-30:23:04:34'),
(161, -1958559742, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:23:04:40', '2022-10-30:23:04:40'),
(162, -1937588223, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addParComment(ParComment)', '用户进行了评论', '/article/addParComment', '2022-10-30:23:05:01', '2022-10-30:23:05:01'),
(163, 490913793, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addChildComment(ChildComment)', '用户进行了评论', '/article/addChildComment', '2022-10-30:23:05:09', '2022-10-30:23:05:09'),
(164, 29540354, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:05:20', '2022-10-30:23:05:20'),
(165, 310558722, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:05:20', '2022-10-30:23:05:20'),
(166, 1505935361, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:05:34', '2022-10-30:23:05:34'),
(167, 1405272065, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-10-30:23:05:50', '2022-10-30:23:05:50'),
(168, 1568849922, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:05:50', '2022-10-30:23:05:50'),
(169, -805126142, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:05:53', '2022-10-30:23:05:53'),
(170, -339558398, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:05:53', '2022-10-30:23:05:53'),
(171, 1933754369, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:23:05:59', '2022-10-30:23:05:59'),
(172, -1300054015, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addChildComment(ChildComment)', '用户进行了评论', '/article/addChildComment', '2022-10-30:23:06:11', '2022-10-30:23:06:11'),
(173, -171786239, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-10-30:23:06:17', '2022-10-30:23:06:17'),
(174, 788709378, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-30:23:06:42', '2022-10-30:23:06:42'),
(175, 998424578, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-30:23:06:42', '2022-10-30:23:06:42'),
(176, -1807564798, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.changePerson(UserDto)', '用户进修改了个人信息', '/user/changePerson', '2022-10-30:23:07:13', '2022-10-30:23:07:13'),
(177, -66928638, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-30:23:09:13', '2022-10-30:23:09:13'),
(178, 1438826497, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-30:23:09:13', '2022-10-30:23:09:13'),
(179, -1430077438, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:23:28:09', '2022-10-30:23:28:09'),
(180, 633520130, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-30:23:31:06', '2022-10-30:23:31:06'),
(181, -2134720510, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:13:43:23', '2022-10-31:13:43:23'),
(182, 956481538, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:48:31', '2022-10-31:13:48:31'),
(183, 2101526530, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:13:48:31', '2022-10-31:13:48:31'),
(184, -2147303423, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:53:31', '2022-10-31:13:53:31'),
(185, 516079618, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:53:39', '2022-10-31:13:53:39'),
(186, -1086144510, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:56:52', '2022-10-31:13:56:52'),
(187, 725794818, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:13:57:20', '2022-10-31:13:57:20'),
(188, 725794819, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:13:57:20', '2022-10-31:13:57:20'),
(189, 377667585, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.changePerson(UserDto)', '用户进修改了个人信息', '/user/changePerson', '2022-10-31:13:57:43', '2022-10-31:13:57:43'),
(190, 1992474626, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:58:20', '2022-10-31:13:58:20'),
(191, -1237139454, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:13:58:20', '2022-10-31:13:58:20'),
(192, -2080194558, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:13:58:27', '2022-10-31:13:58:27'),
(193, -2080194557, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:13:58:27', '2022-10-31:13:58:27'),
(194, 1224916994, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:13:59:03', '2022-10-31:13:59:03'),
(195, -1492991998, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:13:59:03', '2022-10-31:13:59:03'),
(196, 868401154, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:13:59:56', '2022-10-31:13:59:56'),
(197, 763543555, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:00:06', '2022-10-31:14:00:06'),
(198, 763543554, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:00:06', '2022-10-31:14:00:06'),
(199, -1585266686, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:14:40:42', '2022-10-31:14:40:42'),
(200, -175980543, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:14:49:39', '2022-10-31:14:49:39'),
(201, -1413300223, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:14:49:45', '2022-10-31:14:49:45'),
(202, -192757759, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:14:49:46', '2022-10-31:14:49:46'),
(203, -83705854, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:50:15', '2022-10-31:14:50:15'),
(204, -71122943, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:50:15', '2022-10-31:14:50:15'),
(205, 1954725889, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:50:22', '2022-10-31:14:50:22'),
(206, -1547517951, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:14:50:39', '2022-10-31:14:50:39'),
(207, -956121086, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:50:52', '2022-10-31:14:50:52'),
(208, -956121085, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:50:52', '2022-10-31:14:50:52'),
(209, -1241333758, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:51:02', '2022-10-31:14:51:02'),
(210, -1232945150, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:51:02', '2022-10-31:14:51:02'),
(211, 1363329025, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:51:22', '2022-10-31:14:51:22'),
(212, 1363329026, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:51:22', '2022-10-31:14:51:22'),
(213, 1090699265, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:14:51:23', '2022-10-31:14:51:23'),
(214, 209895425, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:51:24', '2022-10-31:14:51:24');
INSERT INTO `bbs_system_log` (`k_real_id`, `id`, `uid`, `ip`, `method_name`, `describe`, `url`, `create_time`, `update_time`) VALUES
(215, -196952062, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:14:51:25', '2022-10-31:14:51:25'),
(216, -196952063, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:14:51:25', '2022-10-31:14:51:25'),
(217, -398278654, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:15:45:47', '2022-10-31:15:45:47'),
(218, 1011007489, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:15:45:48', '2022-10-31:15:45:48'),
(219, 260227073, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:16:03:58', '2022-10-31:16:03:58'),
(220, 436387842, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:16:03:58', '2022-10-31:16:03:58'),
(221, -951926782, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:16:04:31', '2022-10-31:16:04:31'),
(222, 1371738114, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:16:04:52', '2022-10-31:16:04:52'),
(223, -1883041791, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:16:04:52', '2022-10-31:16:04:52'),
(224, -1279062015, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:16:04:52', '2022-10-31:16:04:52'),
(225, -779939839, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:16:04:52', '2022-10-31:16:04:52'),
(226, 1484984322, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:16:05:00', '2022-10-31:16:05:00'),
(227, 1484984323, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:16:05:00', '2022-10-31:16:05:00'),
(228, 251809794, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:16:09:51', '2022-10-31:16:09:51'),
(229, 1891782657, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:16:09:52', '2022-10-31:16:09:52'),
(230, 281235457, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:16:26:46', '2022-10-31:16:26:46'),
(231, 281235458, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:16:26:46', '2022-10-31:16:26:46'),
(232, -981250046, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:16:30:41', '2022-10-31:16:30:41'),
(233, -1602007038, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:16:32:40', '2022-10-31:16:32:40'),
(234, -1404874750, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:16:32:40', '2022-10-31:16:32:40'),
(235, 1786990594, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:17:09:41', '2022-10-31:17:09:41'),
(236, -1107079167, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:17:09:41', '2022-10-31:17:09:41'),
(237, -1811722239, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:17:18:18', '2022-10-31:17:18:18'),
(238, 54743042, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:17:18:25', '2022-10-31:17:18:25'),
(239, 1459834881, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:17:18:59', '2022-10-31:17:18:59'),
(240, -1241296894, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:17:20:10', '2022-10-31:17:20:10'),
(241, -196915199, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:17:20:10', '2022-10-31:17:20:10'),
(242, -1509732350, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:17:20:37', '2022-10-31:17:20:37'),
(243, -1509732349, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:17:20:37', '2022-10-31:17:20:37'),
(244, 205737985, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:17:21:41', '2022-10-31:17:21:41'),
(245, -738000894, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:18:59:13', '2022-10-31:18:59:13'),
(246, -670892030, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:20:22:06', '2022-10-31:20:22:06'),
(247, 667090946, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:20:22:06', '2022-10-31:20:22:06'),
(248, -1014845439, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-10-31:21:15:42', '2022-10-31:21:15:42'),
(249, -696078334, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:22:29:47', '2022-10-31:22:29:47'),
(250, 667070465, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:22:29:48', '2022-10-31:22:29:48'),
(251, -238899199, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:23:52:17', '2022-10-31:23:52:17'),
(252, 1422045186, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:23:52:17', '2022-10-31:23:52:17'),
(253, 461549569, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-10-31:23:52:24', '2022-10-31:23:52:24'),
(254, -1543327742, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-10-31:23:52:24', '2022-10-31:23:52:24'),
(255, 1300410370, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-10-31:23:52:45', '2022-10-31:23:52:45'),
(256, 1698869250, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:23:52:45', '2022-10-31:23:52:45'),
(257, -1564299262, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:23:52:50', '2022-10-31:23:52:50'),
(258, 1761783810, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-10-31:23:53:43', '2022-10-31:23:53:43'),
(259, -2143113215, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-10-31:23:53:43', '2022-10-31:23:53:43'),
(260, 1233301505, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:01:52:09', '2022-11-01:01:52:09'),
(261, -322785278, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:01:52:10', '2022-11-01:01:52:10'),
(262, 1170386946, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.register(User,HttpServletResponse)', '用户进行了注册', '/user/register', '2022-11-01:08:49:53', '2022-11-01:08:49:53'),
(263, 612544513, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:09:09:01', '2022-11-01:09:09:01'),
(264, 1933750273, 'ea6e3928f7decd62cd15efc115941109', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:09:09:01', '2022-11-01:09:09:01'),
(265, 742567938, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:09:13:22', '2022-11-01:09:13:22'),
(266, -2034061311, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:09:13:22', '2022-11-01:09:13:22'),
(267, 2076356610, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:09:13:27', '2022-11-01:09:13:27'),
(268, 2026024962, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:14:05', '2022-11-01:09:14:05'),
(269, 2084745218, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:09:14:05', '2022-11-01:09:14:05'),
(270, -1958563838, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:14:16', '2022-11-01:09:14:16'),
(271, 1338159105, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:14:41', '2022-11-01:09:14:41'),
(272, 1455599617, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-11-01:09:14:41', '2022-11-01:09:14:41'),
(273, 599961602, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:14:48', '2022-11-01:09:14:48'),
(274, -163401726, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:14:49', '2022-11-01:09:14:49'),
(275, 386052097, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:09:14:49', '2022-11-01:09:14:49'),
(276, 952283137, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:09:14:56', '2022-11-01:09:14:56'),
(277, -1941786622, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:09:41:59', '2022-11-01:09:41:59'),
(278, -1937592319, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:09:41:59', '2022-11-01:09:41:59'),
(279, -1123897343, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:10:01:51', '2022-11-01:10:01:51'),
(280, -16601087, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:10:01:51', '2022-11-01:10:01:51'),
(281, 1526902785, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(282, 1531097091, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(283, 1531097090, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(284, 1535291396, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(285, 1535291398, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(286, 1547874306, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(287, 1535291394, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(288, 1535291399, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(289, 1535291397, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(290, 1535291395, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(291, 1581428737, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(292, 1640148993, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(293, 1644343298, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(294, 1648537602, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(295, 1648537603, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(296, 1656926210, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(297, 1652731906, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(298, 1690480641, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(299, 1782755330, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(300, 1782755331, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(301, 1799532547, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(302, 1799532546, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(303, 1824698369, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:10:03:18', '2022-11-01:10:03:18'),
(304, 830648322, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:17', '2022-11-01:10:04:17'),
(305, 507686913, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:20', '2022-11-01:10:04:20'),
(306, -847073279, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:23', '2022-11-01:10:04:23'),
(307, 897757185, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:26', '2022-11-01:10:04:26'),
(308, 1946333185, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:28', '2022-11-01:10:04:28'),
(309, 1963110402, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:30', '2022-11-01:10:04:30'),
(310, -1975341054, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:32', '2022-11-01:10:04:32'),
(311, 1031974913, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:35', '2022-11-01:10:04:35'),
(312, -2080198654, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:38', '2022-11-01:10:04:38'),
(313, 683847681, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:41', '2022-11-01:10:04:41'),
(314, -226316286, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:44', '2022-11-01:10:04:44'),
(315, 537047041, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:47', '2022-11-01:10:04:47'),
(316, 92450817, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:04:56', '2022-11-01:10:04:56'),
(317, -729632766, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:05:12', '2022-11-01:10:05:12'),
(318, -2117947391, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:05:16', '2022-11-01:10:05:16'),
(319, 1271050241, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:05:36', '2022-11-01:10:05:36'),
(320, 235057154, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:05:54', '2022-11-01:10:05:54'),
(321, -1375555582, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:05:58', '2022-11-01:10:05:58'),
(322, -222121983, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:06:02', '2022-11-01:10:06:02'),
(323, -1916620799, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:06:04', '2022-11-01:10:06:04'),
(324, 1497542658, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:06:07', '2022-11-01:10:06:07'),
(325, 381857794, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.deleteArticle(Integer)', '用户删除了自己的文章', '/article/deleteArticle', '2022-11-01:10:06:10', '2022-11-01:10:06:10'),
(326, -1643991038, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:10:06:36', '2022-11-01:10:06:36'),
(327, -1643991037, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:10:06:36', '2022-11-01:10:06:36'),
(328, -1811763199, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:10:06:43', '2022-11-01:10:06:43'),
(329, -977096703, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:10:06:48', '2022-11-01:10:06:48'),
(330, -331173887, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-11-01:10:06:48', '2022-11-01:10:06:48'),
(331, 679653377, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:10:07:04', '2022-11-01:10:07:04'),
(332, 1296216066, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:10:09:17', '2022-11-01:10:09:17'),
(333, -1555910655, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-11-01:10:09:18', '2022-11-01:10:09:18'),
(334, 1447211010, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.FocusAuthorController.focus_author(String,String,boolean)', '用户关注了别人', '/focus_author', '2022-11-01:10:09:20', '2022-11-01:10:09:20'),
(335, 121810945, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:10:09:21', '2022-11-01:10:09:21'),
(336, 209891329, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:10:09:21', '2022-11-01:10:09:21'),
(337, 1082306561, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:10:09:28', '2022-11-01:10:09:28'),
(338, 1317187585, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-11-01:10:09:28', '2022-11-01:10:09:28'),
(339, -1727877118, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:11:39:39', '2022-11-01:11:39:39'),
(340, -897404927, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:11:40:23', '2022-11-01:11:40:23'),
(341, 348303361, '0cf1111a8476cd6d94c682577df8aa7d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:11:40:23', '2022-11-01:11:40:23'),
(342, -8212479, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.UserController.login(UserDto,HttpServletResponse)', '用户进行了登录', '/user/login', '2022-11-01:11:40:28', '2022-11-01:11:40:28'),
(343, -1627213823, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectAchievement(String)', '查询我的成就', '/article/achievement', '2022-11-01:11:40:29', '2022-11-01:11:40:29'),
(344, 1665314818, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addParComment(ParComment)', '用户进行了评论', '/article/addParComment', '2022-11-01:11:40:38', '2022-11-01:11:40:38'),
(345, -1451053054, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.addCollection(UserCollection)', '用户收藏了文章', '/article/addCollection', '2022-11-01:11:40:44', '2022-11-01:11:40:44'),
(346, 2126688257, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:11:40:51', '2022-11-01:11:40:51'),
(347, -1992118270, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:11:40:51', '2022-11-01:11:40:51'),
(348, 2055385090, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:11:40:57', '2022-11-01:11:40:57'),
(349, -1715294207, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyCollection(String)', '用户查看了自己收藏的文章', '/person/myCollection', '2022-11-01:11:40:57', '2022-11-01:11:40:57'),
(350, -1337806846, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectPersonArticle(String,String)', '用户查看了自己发布的文章', '/person/personArticle', '2022-11-01:11:41:04', '2022-11-01:11:41:04'),
(351, -1337806845, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.PersonController.SelectMyFocus(String)', '用户查看了关注我的人和我关注的人', '/person/myfocus', '2022-11-01:11:41:04', '2022-11-01:11:41:04'),
(352, -1744654335, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:11:41:05', '2022-11-01:11:41:05'),
(353, -1132285950, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:11:41:35', '2022-11-01:11:41:35'),
(354, -1547522047, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:11:41:42', '2022-11-01:11:41:42'),
(355, -1132285951, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:11:41:47', '2022-11-01:11:41:47'),
(356, 419606529, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.postArticle(Article)', '用户发布了文章', '/article/post', '2022-11-01:11:42:25', '2022-11-01:11:42:25'),
(357, 147030017, 'e7bcbe6a43bd51960dd67a427c13c45d', '127.0.1.1', 'Result com.yinjie.bbs_java.controller.ArticleController.selectArticleById(Integer)', '浏览文章详细', '/article/articleDetail', '2022-11-01:14:20:28', '2022-11-01:14:20:28');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_user`
--

CREATE TABLE `bbs_user` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `is_delete` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '1',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_user`
--

INSERT INTO `bbs_user` (`id`, `email`, `password`, `avatar`, `status`, `is_delete`, `role_id`, `salt`, `create_time`, `update_time`, `describe`, `nick_name`) VALUES
('0cf1111a8476cd6d94c682577df8aa7d', '314699890@qq.com', '294d5051d75aeeee3e275d3aec619d16', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 2, '04p(Tr', '2022-10-23:22:41:11', '2022-10-23:22:41:11', '这个', 'L&Z'),
('83947e34814acd4d33c8ec84895ddb33', 'zshi_nov@163.com', '7b55dbca1146b8dc91e334a044619138', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 1, '2SedIU', '2022-11-01:08:49:53', '2022-11-01:08:49:53', NULL, NULL),
('c36d1265ae0d365fb2e59d8957d1b388', '836018594@qq.com', '6667c50aa30784dc33ee63427f4f101a', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 1, 'SlX$!n', '2022-10-24:14:42:45', '2022-10-24:14:42:45', NULL, NULL),
('e7bcbe6a43bd51960dd67a427c13c45d', '1169104395@qq.com', 'ef068bbf971086936c637f3b36b2a5e2', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 2, '4rQe97', '2022-10-24:13:02:40', '2022-10-24:13:02:40', NULL, '一只晓橘猫'),
('ea6e3928f7decd62cd15efc115941109', '2269422192@qq.com', 'ae8c130bbbb52a2e2de6d9f5a66c8df4', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 2, '3lvR5w', '2022-10-24:13:38:04', '2022-10-24:13:38:04', NULL, '环游冰岛'),
('f34f506dd572bb726366e63ec73755b6', '1453857082@qq.com', '071a65e19322555fd8f99905cbe0967f', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', 0, 0, 1, 'sCagpZ', '2022-10-24:16:56:09', '2022-10-24:16:56:09', 'dsfsdfdsfdsfdsf', 'dsfsdfsdfd');

-- --------------------------------------------------------

--
-- 表的结构 `bbs_user_collection`
--

CREATE TABLE `bbs_user_collection` (
  `id` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bbs_user_collection`
--

INSERT INTO `bbs_user_collection` (`id`, `user_id`, `article_id`) VALUES
(3, '028a7457e1436360a6c405be3149da21', 81),
(5, '62bf474b5af927d71833606203e98f73', 80),
(6, '028a7457e1436360a6c405be3149da21', 84),
(7, '62bf474b5af927d71833606203e98f73', 82),
(9, 'd637174e7ac74c91efc9721028a9b067', 90),
(10, 'e7bcbe6a43bd51960dd67a427c13c45d', 91),
(11, 'e7bcbe6a43bd51960dd67a427c13c45d', 92),
(12, 'd637174e7ac74c91efc9721028a9b067', 1),
(15, '0cf1111a8476cd6d94c682577df8aa7d', 94),
(16, 'e7bcbe6a43bd51960dd67a427c13c45d', 95),
(17, 'e7bcbe6a43bd51960dd67a427c13c45d', 106);

-- --------------------------------------------------------

--
-- 表的结构 `bbs_user_role`
--

CREATE TABLE `bbs_user_role` (
  `id` int NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 转储表的索引
--

--
-- 表的索引 `bbs_article`
--
ALTER TABLE `bbs_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_article_type`
--
ALTER TABLE `bbs_article_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_child_comment`
--
ALTER TABLE `bbs_child_comment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_focus_author`
--
ALTER TABLE `bbs_focus_author`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_message`
--
ALTER TABLE `bbs_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_notice`
--
ALTER TABLE `bbs_notice`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_par_comment`
--
ALTER TABLE `bbs_par_comment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_role`
--
ALTER TABLE `bbs_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_system_log`
--
ALTER TABLE `bbs_system_log`
  ADD PRIMARY KEY (`k_real_id`);

--
-- 表的索引 `bbs_user`
--
ALTER TABLE `bbs_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_user_collection`
--
ALTER TABLE `bbs_user_collection`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `bbs_user_role`
--
ALTER TABLE `bbs_user_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `bbs_article`
--
ALTER TABLE `bbs_article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- 使用表AUTO_INCREMENT `bbs_article_type`
--
ALTER TABLE `bbs_article_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `bbs_child_comment`
--
ALTER TABLE `bbs_child_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2112606210;

--
-- 使用表AUTO_INCREMENT `bbs_focus_author`
--
ALTER TABLE `bbs_focus_author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- 使用表AUTO_INCREMENT `bbs_notice`
--
ALTER TABLE `bbs_notice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `bbs_par_comment`
--
ALTER TABLE `bbs_par_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1865150468;

--
-- 使用表AUTO_INCREMENT `bbs_role`
--
ALTER TABLE `bbs_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `bbs_system_log`
--
ALTER TABLE `bbs_system_log`
  MODIFY `k_real_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- 使用表AUTO_INCREMENT `bbs_user_collection`
--
ALTER TABLE `bbs_user_collection`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `bbs_user_role`
--
ALTER TABLE `bbs_user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
