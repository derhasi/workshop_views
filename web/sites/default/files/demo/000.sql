-- Demo.module database dump (version 1.1)
-- http://drupal.org/project/demo
--
-- Database: paul_wsviews
-- Date: Sunday, 9. May 2010 - 10:19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS = 0;

--
-- Table structure for table 'access'
--

CREATE TABLE IF NOT EXISTS `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'access'
--

/*!40000 ALTER TABLE access DISABLE KEYS */;
/*!40000 ALTER TABLE access ENABLE KEYS */;

--
-- Table structure for table 'actions'
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'actions'
--

/*!40000 ALTER TABLE actions DISABLE KEYS */;
INSERT INTO `actions` VALUES
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish post'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page'),
('node_save_action', 'node', 'node_save_action', '', 'Save post'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user'),
('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user');
/*!40000 ALTER TABLE actions ENABLE KEYS */;

--
-- Table structure for table 'actions_aid'
--

CREATE TABLE IF NOT EXISTS `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'actions_aid'
--

/*!40000 ALTER TABLE actions_aid DISABLE KEYS */;
/*!40000 ALTER TABLE actions_aid ENABLE KEYS */;

--
-- Table structure for table 'authmap'
--

CREATE TABLE IF NOT EXISTS `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'authmap'
--

/*!40000 ALTER TABLE authmap DISABLE KEYS */;
/*!40000 ALTER TABLE authmap ENABLE KEYS */;

--
-- Table structure for table 'batch'
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'batch'
--

/*!40000 ALTER TABLE batch DISABLE KEYS */;
/*!40000 ALTER TABLE batch ENABLE KEYS */;

--
-- Table structure for table 'blocks'
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'blocks'
--

/*!40000 ALTER TABLE blocks DISABLE KEYS */;
INSERT INTO `blocks` VALUES
(1, 'user', '0', 'garland', 1, -3, 'left', 0, 0, 0, '', '', -1),
(2, 'user', '1', 'garland', 1, -4, 'left', 0, 0, 0, '', '', -1),
(3, 'system', '0', 'garland', 1, -6, 'footer', 0, 0, 0, '', '', -1),
(4, 'book', '0', 'garland', 1, -2, 'left', 0, 0, 0, '', '', 5),
(5, 'comment', '0', 'garland', 0, -4, '', 0, 0, 0, '', '', 1),
(6, 'menu', 'primary-links', 'garland', 1, -6, 'left', 0, 0, 0, '', '', -1),
(7, 'menu', 'secondary-links', 'garland', 1, -5, 'left', 0, 0, 0, '', '', -1),
(8, 'node', '0', 'garland', 0, -2, '', 0, 0, 0, '', '', -1),
(9, 'user', '2', 'garland', 0, -1, '', 0, 0, 0, '', '', 1),
(10, 'user', '3', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(11, 'markdown', 'help', 'garland', 0, -6, '', 0, 0, 0, '', '', 1),
(12, 'calendar', '0', 'garland', 0, -6, '', 0, 0, 0, '', '', 1);
/*!40000 ALTER TABLE blocks ENABLE KEYS */;

--
-- Table structure for table 'blocks_roles'
--

CREATE TABLE IF NOT EXISTS `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'blocks_roles'
--

/*!40000 ALTER TABLE blocks_roles DISABLE KEYS */;
/*!40000 ALTER TABLE blocks_roles ENABLE KEYS */;

--
-- Table structure for table 'book'
--

CREATE TABLE IF NOT EXISTS `book` (
  `mlid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  UNIQUE KEY `nid` (`nid`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'book'
--

/*!40000 ALTER TABLE book DISABLE KEYS */;
INSERT INTO `book` VALUES
(485, 35, 35);
/*!40000 ALTER TABLE book ENABLE KEYS */;

--
-- Table structure for table 'boxes'
--

CREATE TABLE IF NOT EXISTS `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'boxes'
--

/*!40000 ALTER TABLE boxes DISABLE KEYS */;
/*!40000 ALTER TABLE boxes ENABLE KEYS */;

--
-- Table structure for table 'cache'
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_block'
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_content'
--

CREATE TABLE IF NOT EXISTS `cache_content` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_filter'
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_form'
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_menu'
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_page'
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_update'
--

CREATE TABLE IF NOT EXISTS `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_views'
--

CREATE TABLE IF NOT EXISTS `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'cache_views_data'
--

CREATE TABLE IF NOT EXISTS `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'comments'
--

CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'comments'
--

/*!40000 ALTER TABLE comments DISABLE KEYS */;
/*!40000 ALTER TABLE comments ENABLE KEYS */;

--
-- Table structure for table 'content_field_cast'
--

CREATE TABLE IF NOT EXISTS `content_field_cast` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_cast_nid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`),
  KEY `field_cast_nid` (`field_cast_nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_field_cast'
--

/*!40000 ALTER TABLE content_field_cast DISABLE KEYS */;
INSERT INTO `content_field_cast` VALUES
(10, 10, 4, 22),
(10, 10, 3, 5),
(10, 10, 2, 3),
(10, 10, 1, 7),
(12, 12, 1, 5),
(12, 12, 2, 4),
(12, 12, 3, 11),
(12, 12, 0, 3),
(15, 15, 3, 14),
(15, 15, 2, 13),
(15, 15, 1, 3),
(15, 15, 0, 5),
(20, 20, 5, 17),
(20, 20, 4, 18),
(20, 20, 3, 19),
(20, 20, 2, 3),
(20, 20, 1, 6),
(20, 20, 0, 5),
(21, 21, 4, 18),
(21, 21, 3, 19),
(21, 21, 2, 5),
(21, 21, 1, 3),
(21, 21, 0, 6),
(10, 10, 0, 6),
(24, 24, 6, 4),
(24, 24, 5, 13),
(24, 24, 4, 17),
(24, 24, 3, 7),
(24, 24, 2, 3),
(24, 24, 1, 6),
(24, 24, 0, 5),
(26, 26, 1, 6),
(26, 26, 0, 25),
(12, 12, 4, 13),
(12, 12, 5, 14),
(27, 27, 3, 4),
(27, 27, 2, 5),
(27, 27, 1, 1),
(27, 27, 0, 2),
(28, 28, 1, 9),
(28, 28, 0, 8),
(31, 31, 0, 29),
(31, 31, 1, 9),
(34, 34, 2, 33),
(34, 34, 1, 30),
(34, 34, 0, 29);
/*!40000 ALTER TABLE content_field_cast ENABLE KEYS */;

--
-- Table structure for table 'content_field_image'
--

CREATE TABLE IF NOT EXISTS `content_field_image` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_image_fid` int(11) DEFAULT NULL,
  `field_image_list` tinyint(4) DEFAULT NULL,
  `field_image_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_field_image'
--

/*!40000 ALTER TABLE content_field_image DISABLE KEYS */;
INSERT INTO `content_field_image` VALUES
(1, 1, 0, 1, 1, 'a:3:{s:11:"description";s:7:"Profile";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(10, 10, 0, 7, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(15, 15, 1, 12, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(15, 15, 0, 11, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(20, 20, 0, 17, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(21, 21, 0, 18, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(24, 24, 1, 21, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(24, 24, 0, 22, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(26, 26, 1, 25, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(26, 26, 0, 24, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(12, 12, 1, 26, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(12, 12, 0, 8, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(27, 27, 0, 27, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(28, 28, 0, 28, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(31, 31, 0, 31, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(34, 34, 0, 36, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
/*!40000 ALTER TABLE content_field_image ENABLE KEYS */;

--
-- Table structure for table 'content_field_image_actor'
--

CREATE TABLE IF NOT EXISTS `content_field_image_actor` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_image_actor_fid` int(11) DEFAULT NULL,
  `field_image_actor_list` tinyint(4) DEFAULT NULL,
  `field_image_actor_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_field_image_actor'
--

/*!40000 ALTER TABLE content_field_image_actor DISABLE KEYS */;
INSERT INTO `content_field_image_actor` VALUES
(1, 1, 0, 5, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(2, 2, 0, NULL, NULL, NULL),
(3, 3, 0, 4, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(4, 4, 0, 10, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(5, 5, 0, NULL, NULL, NULL),
(6, 6, 0, NULL, NULL, NULL),
(7, 7, 0, NULL, NULL, NULL),
(8, 8, 0, NULL, NULL, NULL),
(9, 9, 0, NULL, NULL, NULL),
(11, 11, 0, NULL, NULL, NULL),
(13, 13, 0, NULL, NULL, NULL),
(14, 14, 0, NULL, NULL, NULL),
(16, 16, 0, 13, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(17, 17, 0, 14, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(18, 18, 0, 15, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(19, 19, 0, 16, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(22, 22, 0, 19, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(23, 23, 0, 20, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(25, 25, 0, 23, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(29, 29, 0, 29, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(30, 30, 0, 30, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(33, 33, 0, 35, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
/*!40000 ALTER TABLE content_field_image_actor ENABLE KEYS */;

--
-- Table structure for table 'content_group'
--

CREATE TABLE IF NOT EXISTS `content_group` (
  `group_type` varchar(32) NOT NULL DEFAULT 'standard',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_name`,`group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_group'
--

/*!40000 ALTER TABLE content_group DISABLE KEYS */;
/*!40000 ALTER TABLE content_group ENABLE KEYS */;

--
-- Table structure for table 'content_group_fields'
--

CREATE TABLE IF NOT EXISTS `content_group_fields` (
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_name`,`group_name`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_group_fields'
--

/*!40000 ALTER TABLE content_group_fields DISABLE KEYS */;
/*!40000 ALTER TABLE content_group_fields ENABLE KEYS */;

--
-- Table structure for table 'content_node_field'
--

CREATE TABLE IF NOT EXISTS `content_node_field` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `db_storage` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(127) NOT NULL DEFAULT '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_node_field'
--

/*!40000 ALTER TABLE content_node_field DISABLE KEYS */;
INSERT INTO `content_node_field` VALUES
('field_image', 'filefield', 'a:3:{s:10:"list_field";s:1:"0";s:12:"list_default";i:1;s:17:"description_field";s:1:"1";}', 0, 1, 0, 'filefield', 'a:3:{s:3:"fid";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"list";a:4:{s:4:"type";s:3:"int";s:4:"size";s:4:"tiny";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"data";a:3:{s:4:"type";s:4:"text";s:9:"serialize";b:1;s:5:"views";b:1;}}', 1, 0),
('field_release_date', 'date', 'a:7:{s:11:"granularity";a:3:{s:4:"year";s:4:"year";s:5:"month";s:5:"month";s:3:"day";s:3:"day";}s:11:"timezone_db";s:0:"";s:11:"tz_handling";s:4:"none";s:6:"todate";s:0:"";s:6:"repeat";i:0;s:16:"repeat_collapsed";s:0:"";s:14:"default_format";s:6:"medium";}', 1, 0, 1, 'date', 'a:1:{s:5:"value";a:5:{s:4:"type";s:7:"varchar";s:6:"length";i:20;s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0),
('field_cast', 'nodereference', 'a:3:{s:19:"referenceable_types";a:4:{s:5:"actor";s:5:"actor";s:5:"movie";i:0;s:4:"page";i:0;s:5:"story";i:0;}s:13:"advanced_view";s:2:"--";s:18:"advanced_view_args";s:0:"";}', 0, 1, 0, 'nodereference', 'a:1:{s:3:"nid";a:4:{s:4:"type";s:3:"int";s:8:"unsigned";b:1;s:8:"not null";b:0;s:5:"index";b:1;}}', 1, 0),
('field_gender', 'number_integer', 'a:6:{s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:14:"allowed_values";s:16:"1|female\r\n2|male";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1, 'number', 'a:1:{s:5:"value";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:8:"sortable";b:1;}}', 1, 0),
('field_image_actor', 'filefield', 'a:3:{s:10:"list_field";s:1:"0";s:12:"list_default";i:1;s:17:"description_field";s:1:"0";}', 0, 1, 0, 'filefield', 'a:3:{s:3:"fid";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"list";a:4:{s:4:"type";s:3:"int";s:4:"size";s:4:"tiny";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"data";a:3:{s:4:"type";s:4:"text";s:9:"serialize";b:1;s:5:"views";b:1;}}', 1, 0),
('field_company_image', 'filefield', 'a:3:{s:10:"list_field";s:1:"0";s:12:"list_default";i:1;s:17:"description_field";s:1:"0";}', 0, 0, 1, 'filefield', 'a:3:{s:3:"fid";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"list";a:4:{s:4:"type";s:3:"int";s:4:"size";s:4:"tiny";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"data";a:3:{s:4:"type";s:4:"text";s:9:"serialize";b:1;s:5:"views";b:1;}}', 1, 0),
('field_production_company', 'nodereference', 'a:3:{s:19:"referenceable_types";a:4:{s:7:"company";s:7:"company";s:5:"actor";i:0;s:4:"book";i:0;s:5:"movie";i:0;}s:13:"advanced_view";s:2:"--";s:18:"advanced_view_args";s:0:"";}', 1, 0, 1, 'nodereference', 'a:1:{s:3:"nid";a:4:{s:4:"type";s:3:"int";s:8:"unsigned";b:1;s:8:"not null";b:0;s:5:"index";b:1;}}', 1, 0);
/*!40000 ALTER TABLE content_node_field ENABLE KEYS */;

--
-- Table structure for table 'content_node_field_instance'
--

CREATE TABLE IF NOT EXISTS `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_node_field_instance'
--

/*!40000 ALTER TABLE content_node_field_instance DISABLE KEYS */;
INSERT INTO `content_node_field_instance` VALUES
('field_image', 'movie', -2, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:6:"images";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:0;s:5:"title";s:0:"";s:12:"custom_title";i:0;s:10:"title_type";s:9:"textfield";s:13:"default_image";a:10:{s:8:"filename";s:15:"cinema2_256.png";s:8:"filepath";s:61:"sites/default/files/imagefield_default_images/cinema2_256.png";s:8:"filemime";s:9:"image/png";s:6:"source";s:20:"default_image_upload";s:11:"destination";s:61:"sites/default/files/imagefield_default_images/cinema2_256.png";s:8:"filesize";i:47351;s:3:"uid";s:1:"1";s:6:"status";i:1;s:9:"timestamp";i:1267189668;s:3:"fid";s:1:"3";}s:17:"use_default_image";i:1;}', 'a:6:{s:6:"weight";s:2:"-2";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:5:"above";}s:6:"teaser";a:2:{s:6:"format";s:12:"small_linked";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:38:"imagefield__lightbox2__small__original";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1),
('field_release_date', 'movie', -3, 'Release Date', 'date_text', 'a:10:{s:13:"default_value";s:5:"blank";s:18:"default_value_code";s:0:"";s:14:"default_value2";s:4:"same";s:19:"default_value_code2";s:0:"";s:12:"input_format";s:13:"d.m.Y - H:i:s";s:19:"input_format_custom";s:5:"Y-m-d";s:9:"increment";i:1;s:10:"text_parts";a:0:{}s:10:"year_range";s:5:"-3:+3";s:14:"label_position";s:5:"above";}', 'a:6:{s:6:"weight";s:2:"-3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:5:"above";}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'date', 1),
('field_cast', 'movie', 0, 'Cast', 'nodereference_autocomplete', 'a:4:{s:18:"autocomplete_match";s:8:"contains";s:4:"size";s:2:"60";s:13:"default_value";a:1:{i:0;a:2:{s:3:"nid";N;s:14:"_error_element";s:45:"default_value_widget][field_cast][0][nid][nid";}}s:17:"default_value_php";N;}', 'a:6:{s:6:"weight";i:0;s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:5:"above";}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'nodereference', 1),
('field_gender', 'actor', -3, 'Gender', 'optionwidgets_buttons', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:6:{s:6:"weight";s:2:"-3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:5:"above";}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1),
('field_image_actor', 'actor', -4, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:0:"";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:0;s:5:"title";s:0:"";s:12:"custom_title";i:0;s:10:"title_type";s:9:"textfield";s:13:"default_image";a:10:{s:8:"filename";s:15:"cinema4_256.png";s:8:"filepath";s:61:"sites/default/files/imagefield_default_images/cinema4_256.png";s:8:"filemime";s:9:"image/png";s:6:"source";s:20:"default_image_upload";s:11:"destination";s:61:"sites/default/files/imagefield_default_images/cinema4_256.png";s:8:"filesize";i:26231;s:3:"uid";s:1:"1";s:6:"status";i:1;s:9:"timestamp";i:1267189607;s:3:"fid";s:1:"2";}s:17:"use_default_image";i:1;}', 'a:6:{s:6:"weight";s:2:"-4";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:5:"above";}s:6:"teaser";a:2:{s:6:"format";s:12:"small_linked";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:38:"imagefield__lightbox2__small__original";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1),
('field_company_image', 'company', -4, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:14:"images/company";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:0;s:5:"title";s:0:"";s:12:"custom_title";i:0;s:10:"title_type";s:9:"textfield";s:13:"default_image";a:10:{s:8:"filename";s:15:"cinema3_256.png";s:8:"filepath";s:61:"sites/default/files/imagefield_default_images/cinema3_256.png";s:8:"filemime";s:9:"image/png";s:6:"source";s:20:"default_image_upload";s:11:"destination";s:61:"sites/default/files/imagefield_default_images/cinema3_256.png";s:8:"filesize";i:44883;s:3:"uid";s:1:"1";s:6:"status";i:1;s:9:"timestamp";i:1267294242;s:3:"fid";s:2:"39";}s:17:"use_default_image";i:1;}', 'a:5:{s:5:"label";a:2:{s:6:"format";s:5:"above";s:7:"exclude";i:0;}i:5;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}s:6:"teaser";a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1),
('field_production_company', 'movie', -1, 'Production company', 'nodereference_buttons', 'a:4:{s:18:"autocomplete_match";s:8:"contains";s:4:"size";i:60;s:13:"default_value";a:1:{i:0;a:1:{s:3:"nid";s:0:"";}}s:17:"default_value_php";N;}', 'a:5:{s:5:"label";a:2:{s:6:"format";s:5:"above";s:7:"exclude";i:0;}i:5;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'nodereference', 1);
/*!40000 ALTER TABLE content_node_field_instance ENABLE KEYS */;

--
-- Table structure for table 'content_type_actor'
--

CREATE TABLE IF NOT EXISTS `content_type_actor` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_gender_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_type_actor'
--

/*!40000 ALTER TABLE content_type_actor DISABLE KEYS */;
INSERT INTO `content_type_actor` VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(11, 11, 1),
(13, 13, 2),
(14, 14, 2),
(16, 16, 2),
(17, 17, 1),
(18, 18, 1),
(19, 19, 2),
(22, 22, 1),
(23, 23, 2),
(25, 25, 1),
(29, 29, 2),
(30, 30, 2),
(33, 33, 2);
/*!40000 ALTER TABLE content_type_actor ENABLE KEYS */;

--
-- Table structure for table 'content_type_company'
--

CREATE TABLE IF NOT EXISTS `content_type_company` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_company_image_fid` int(11) DEFAULT NULL,
  `field_company_image_list` tinyint(4) DEFAULT NULL,
  `field_company_image_data` text,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_type_company'
--

/*!40000 ALTER TABLE content_type_company DISABLE KEYS */;
INSERT INTO `content_type_company` VALUES
(37, 37, 37, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(38, 38, 38, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(39, 39, 40, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(40, 40, 41, 1, 'a:3:{s:11:"description";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
/*!40000 ALTER TABLE content_type_company ENABLE KEYS */;

--
-- Table structure for table 'content_type_movie'
--

CREATE TABLE IF NOT EXISTS `content_type_movie` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_release_date_value` varchar(20) DEFAULT NULL,
  `field_production_company_nid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `field_production_company_nid` (`field_production_company_nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'content_type_movie'
--

/*!40000 ALTER TABLE content_type_movie DISABLE KEYS */;
INSERT INTO `content_type_movie` VALUES
(10, 10, '1999-11-12T00:00:00', 38),
(12, 12, '2006-05-26T00:00:00', 38),
(15, 15, '1994-11-09T00:00:00', 38),
(20, 20, '1995-10-20T00:00:00', 38),
(21, 21, '1997-04-04T00:00:00', 38),
(24, 24, '2001-08-22T00:00:00', 38),
(26, 26, '2005-01-06T00:00:00', 38),
(27, 27, '2008-09-18T00:00:00', 38),
(28, 28, '2003-10-02T00:00:00', 39),
(31, 31, '2009-08-21T00:00:00', NULL),
(34, 34, '2008-08-27T00:00:00', 37);
/*!40000 ALTER TABLE content_type_movie ENABLE KEYS */;

--
-- Table structure for table 'date_format_locale'
--

CREATE TABLE IF NOT EXISTS `date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `language` varchar(12) NOT NULL,
  PRIMARY KEY (`type`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'date_format_locale'
--

/*!40000 ALTER TABLE date_format_locale DISABLE KEYS */;
/*!40000 ALTER TABLE date_format_locale ENABLE KEYS */;

--
-- Table structure for table 'date_format_types'
--

CREATE TABLE IF NOT EXISTS `date_format_types` (
  `type` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'date_format_types'
--

/*!40000 ALTER TABLE date_format_types DISABLE KEYS */;
INSERT INTO `date_format_types` VALUES
('long', 'Long', 1),
('medium', 'Medium', 1),
('short', 'Short', 1);
/*!40000 ALTER TABLE date_format_types ENABLE KEYS */;

--
-- Table structure for table 'date_formats'
--

CREATE TABLE IF NOT EXISTS `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'date_formats'
--

/*!40000 ALTER TABLE date_formats DISABLE KEYS */;
INSERT INTO `date_formats` VALUES
(1, 'Y-m-d H:i', 'short', 1),
(2, 'm/d/Y - H:i', 'short', 1),
(3, 'd/m/Y - H:i', 'short', 1),
(4, 'Y/m/d - H:i', 'short', 1),
(5, 'd.m.Y - H:i', 'short', 1),
(6, 'm/d/Y - g:ia', 'short', 1),
(7, 'd/m/Y - g:ia', 'short', 1),
(8, 'Y/m/d - g:ia', 'short', 1),
(9, 'M j Y - H:i', 'short', 1),
(10, 'j M Y - H:i', 'short', 1),
(11, 'Y M j - H:i', 'short', 1),
(12, 'M j Y - g:ia', 'short', 1),
(13, 'j M Y - g:ia', 'short', 1),
(14, 'Y M j - g:ia', 'short', 1),
(15, 'D, Y-m-d H:i', 'medium', 1),
(16, 'D, m/d/Y - H:i', 'medium', 1),
(17, 'D, d/m/Y - H:i', 'medium', 1),
(18, 'D, Y/m/d - H:i', 'medium', 1),
(19, 'F j, Y - H:i', 'medium', 1),
(20, 'j F, Y - H:i', 'medium', 1),
(21, 'Y, F j - H:i', 'medium', 1),
(22, 'D, m/d/Y - g:ia', 'medium', 1),
(23, 'D, d/m/Y - g:ia', 'medium', 1),
(24, 'D, Y/m/d - g:ia', 'medium', 1),
(25, 'F j, Y - g:ia', 'medium', 1),
(26, 'j F Y - g:ia', 'medium', 1),
(27, 'Y, F j - g:ia', 'medium', 1),
(28, 'j. F Y - G:i', 'medium', 1),
(29, 'l, F j, Y - H:i', 'long', 1),
(30, 'l, j F, Y - H:i', 'long', 1),
(31, 'l, Y,  F j - H:i', 'long', 1),
(32, 'l, F j, Y - g:ia', 'long', 1),
(33, 'l, j F Y - g:ia', 'long', 1),
(34, 'l, Y,  F j - g:ia', 'long', 1),
(35, 'l, j. F Y - G:i', 'long', 1);
/*!40000 ALTER TABLE date_formats ENABLE KEYS */;

--
-- Table structure for table 'files'
--

CREATE TABLE IF NOT EXISTS `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'files'
--

/*!40000 ALTER TABLE files DISABLE KEYS */;
INSERT INTO `files` VALUES
(1, 1, 'elizabeth-banks-picture-1_profile.jpeg', 'sites/default/files/images/elizabeth-banks-picture-1_profile.jpeg', 'image/jpeg', 21205, 1, 1267188642),
(2, 1, 'cinema4_256.png', 'sites/default/files/imagefield_default_images/cinema4_256.png', 'image/png', 26231, 1, 1267189607),
(3, 1, 'cinema2_256.png', 'sites/default/files/imagefield_default_images/cinema2_256.png', 'image/png', 47351, 1, 1267189668),
(4, 1, 'kevin-smith_profile.jpeg', 'sites/default/files/kevin-smith_profile.jpeg', 'image/jpeg', 10529, 1, 1267189837),
(5, 1, 'elizabeth-banks-picture-1_profile.jpeg', 'sites/default/files/elizabeth-banks-picture-1_profile.jpeg', 'image/jpeg', 21205, 1, 1267189874),
(6, 1, 'tt0120655_poster.jpeg', 'sites/default/files/images/tt0120655_poster.jpeg', 'image/jpeg', 124103, 0, 1267190763),
(7, 1, 'tt0120655_poster.jpeg', 'sites/default/files/images/tt0120655_poster_0.jpeg', 'image/jpeg', 124103, 1, 1267231819),
(8, 1, 'tt0424345_poster.jpeg', 'sites/default/files/images/tt0424345_poster.jpeg', 'image/jpeg', 84692, 1, 1267233681),
(9, 1, 'jennifer_schwalbach_smith_profile.jpeg', 'sites/default/files/jennifer_schwalbach_smith_profile.jpeg', 'image/jpeg', 13871, 0, 1267233776),
(10, 1, 'jennifer_schwalbach_smith_profile.jpeg', 'sites/default/files/jennifer_schwalbach_smith_profile_0.jpeg', 'image/jpeg', 13871, 1, 1267233806),
(11, 1, 'tt0109445_poster.jpeg', 'sites/default/files/images/tt0109445_poster.jpeg', 'image/jpeg', 101019, 1, 1267264986),
(12, 1, 'backdrop_poster.jpeg', 'sites/default/files/images/backdrop_poster.jpeg', 'image/jpeg', 51568, 1, 1267264994),
(13, 1, 'Jason_Lee_profile.jpeg', 'sites/default/files/Jason_Lee_profile.jpeg', 'image/jpeg', 36788, 1, 1267265274),
(14, 1, 'shannen-doherty-picture-1.jpeg', 'sites/default/files/shannen-doherty-picture-1.jpeg', 'image/jpeg', 72944, 1, 1267265369),
(15, 1, 'JoeyLaurenAdams243.jpeg', 'sites/default/files/JoeyLaurenAdams243.jpeg', 'image/jpeg', 24360, 1, 1267265589),
(16, 1, 'Jason_Lee_profile.jpeg', 'sites/default/files/Jason_Lee_profile_0.jpeg', 'image/jpeg', 36788, 1, 1267265706),
(17, 1, 'MV5BMTE5OTkxOTI1Ml5BMl5BanBnXkFtZTcwNjk2MTEzMQ@@._V1._SX358_SY500_.jpeg', 'sites/default/files/images/MV5BMTE5OTkxOTI1Ml5BMl5BanBnXkFtZTcwNjk2MTEzMQ@@._V1._SX358_SY500_.jpeg', 'image/jpeg', 64451, 1, 1267265730),
(18, 1, 'tt0118842_poster.jpeg', 'sites/default/files/images/tt0118842_poster.jpeg', 'image/jpeg', 89892, 1, 1267265931),
(19, 1, 'linda-fiorentino-men-in-black-premiere-2_profile.jpeg', 'sites/default/files/linda-fiorentino-men-in-black-premiere-2_profile.jpeg', 'image/jpeg', 16667, 1, 1267265986),
(20, 1, 'chris_profile.jpeg', 'sites/default/files/chris_profile.jpeg', 'image/jpeg', 10603, 1, 1267266168),
(21, 1, 'Jay_and_SIlent_Bob_poster.jpeg', 'sites/default/files/images/Jay_and_SIlent_Bob_poster.jpeg', 'image/jpeg', 99527, 1, 1267266235),
(22, 1, 'tt0261392_poster.jpeg', 'sites/default/files/images/tt0261392_poster.jpeg', 'image/jpeg', 123255, 1, 1267266243),
(23, 1, 'liv-tyler-20070627-275712.jpeg', 'sites/default/files/liv-tyler-20070627-275712.jpeg', 'image/jpeg', 25825, 1, 1267266620),
(24, 1, 'jersey_girl.jpeg', 'sites/default/files/images/jersey_girl.jpeg', 'image/jpeg', 78929, 1, 1267266694),
(25, 1, 'eva005_th.jpeg', 'sites/default/files/images/eva005_th.jpeg', 'image/jpeg', 44681, 1, 1267266713),
(26, 1, 'thumb1_poster.jpeg', 'sites/default/files/images/thumb1_poster.jpeg', 'image/jpeg', 97434, 1, 1267266951),
(27, 1, 'Zack-and-Miri-Make-a-Porno_poster.jpeg', 'sites/default/files/images/Zack-and-Miri-Make-a-Porno_poster.jpeg', 'image/jpeg', 131142, 1, 1267267296),
(28, 1, 'Herr_Lehmann__2003__Backdrop__poster.jpeg', 'sites/default/files/images/Herr_Lehmann__2003__Backdrop__poster.jpeg', 'image/jpeg', 53686, 1, 1267267415),
(29, 1, 'Brad_Pitt_profile.jpeg', 'sites/default/files/Brad_Pitt_profile.jpeg', 'image/jpeg', 36488, 1, 1267267587),
(30, 1, 'GeorgeClooney-04_profile.jpeg', 'sites/default/files/GeorgeClooney-04_profile.jpeg', 'image/jpeg', 7406, 1, 1267267637),
(31, 1, 'basterds_poster.jpeg', 'sites/default/files/images/basterds_poster.jpeg', 'image/jpeg', 224687, 1, 1267267816),
(32, 1, 'hasi3d180.png', '/Applications/XAMPP/xamppfiles/temp//hasi3d180.png', 'image/png', 24824, 0, 1267268753),
(33, 1, 'dhfavlicon.ico', '/Applications/XAMPP/xamppfiles/temp//dhfavlicon.ico', 'image/x-icon', 40550, 0, 1267268753),
(34, 1, 'hasi3d100.png', '/Applications/XAMPP/xamppfiles/temp//hasi3d100.png', 'image/png', 13837, 0, 1267268946),
(35, 1, 'John_Malkovich_profile.jpeg', 'sites/default/files/John_Malkovich_profile.jpeg', 'image/jpeg', 11072, 1, 1267269884),
(36, 1, 'burn_after_reading_xlg.jpeg', 'sites/default/files/images/burn_after_reading_xlg.jpeg', 'image/jpeg', 273163, 1, 1267270028),
(37, 1, 'Working_Title_Films_logo.png', 'sites/default/files/images/company/Working_Title_Films_logo.png', 'image/png', 17141, 1, 1267293617),
(38, 1, 'viewaskew2.jpeg', 'sites/default/files/images/company/viewaskew2.jpeg', 'image/jpeg', 61020, 1, 1267294194),
(39, 1, 'cinema3_256.png', 'sites/default/files/imagefield_default_images/cinema3_256.png', 'image/png', 44883, 1, 1267294242),
(40, 1, 'cinema3_256.png', 'sites/default/files/images/company/cinema3_256.png', 'image/png', 44883, 1, 1267294382),
(41, 1, 'weinstein-logo.jpeg', 'sites/default/files/images/company/weinstein-logo.jpeg', 'image/jpeg', 23687, 1, 1267294788),
(42, 1, 'slides.pdf', 'sites/default/files/slides.pdf', 'application/pdf', 14833721, 1, 1273395703);
/*!40000 ALTER TABLE files ENABLE KEYS */;

--
-- Table structure for table 'filter_formats'
--

CREATE TABLE IF NOT EXISTS `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'filter_formats'
--

/*!40000 ALTER TABLE filter_formats DISABLE KEYS */;
INSERT INTO `filter_formats` VALUES
(1, 'Filtered HTML', ',1,2,', 1);
/*!40000 ALTER TABLE filter_formats ENABLE KEYS */;

--
-- Table structure for table 'filters'
--

CREATE TABLE IF NOT EXISTS `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'filters'
--

/*!40000 ALTER TABLE filters DISABLE KEYS */;
INSERT INTO `filters` VALUES
(18, 1, 'filter', 2, -9),
(17, 1, 'markdown', 0, -10),
(15, 1, 'filter', 0, -8),
(16, 1, 'filter', 1, -7),
(14, 1, 'filter', 3, -6),
(13, 1, 'collapse_text', 0, 10);
/*!40000 ALTER TABLE filters ENABLE KEYS */;

--
-- Table structure for table 'flood'
--

CREATE TABLE IF NOT EXISTS `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'flood'
--

/*!40000 ALTER TABLE flood DISABLE KEYS */;
/*!40000 ALTER TABLE flood ENABLE KEYS */;

--
-- Table structure for table 'history'
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'history'
--

/*!40000 ALTER TABLE history DISABLE KEYS */;
INSERT INTO `history` VALUES
(1, 1, 1267189878),
(1, 3, 1267189851),
(1, 9, 1267230702),
(1, 2, 1267230824),
(1, 7, 1267230832),
(1, 5, 1267230836),
(1, 10, 1267266069),
(1, 6, 1267233177),
(1, 11, 1267233729),
(1, 12, 1267266998),
(1, 4, 1267233808),
(1, 13, 1267264708),
(1, 14, 1267264878),
(1, 15, 1267265031),
(1, 16, 1267265275),
(1, 17, 1267265370),
(1, 18, 1267265589),
(1, 19, 1267265706),
(1, 20, 1267265730),
(1, 21, 1267265931),
(1, 22, 1267265986),
(1, 23, 1267266168),
(1, 24, 1267266455),
(1, 25, 1267266621),
(1, 26, 1267266776),
(1, 27, 1267267331),
(1, 28, 1267267986),
(1, 29, 1267267587),
(1, 30, 1267267637),
(1, 31, 1267267817),
(1, 32, 1267276420),
(1, 33, 1267269885),
(1, 34, 1267270029),
(1, 35, 1273396036),
(1, 36, 1273395617),
(1, 37, 1267294116),
(1, 38, 1267294194),
(1, 39, 1267294382),
(1, 40, 1267294789);
/*!40000 ALTER TABLE history ENABLE KEYS */;

--
-- Table structure for table 'imagecache_action'
--

CREATE TABLE IF NOT EXISTS `imagecache_action` (
  `actionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presetid` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`actionid`),
  KEY `presetid` (`presetid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'imagecache_action'
--

/*!40000 ALTER TABLE imagecache_action DISABLE KEYS */;
INSERT INTO `imagecache_action` VALUES
(1, 1, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"140";}');
/*!40000 ALTER TABLE imagecache_action ENABLE KEYS */;

--
-- Table structure for table 'imagecache_preset'
--

CREATE TABLE IF NOT EXISTS `imagecache_preset` (
  `presetid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presetname` varchar(255) NOT NULL,
  PRIMARY KEY (`presetid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'imagecache_preset'
--

/*!40000 ALTER TABLE imagecache_preset DISABLE KEYS */;
INSERT INTO `imagecache_preset` VALUES
(1, 'small');
/*!40000 ALTER TABLE imagecache_preset ENABLE KEYS */;

--
-- Table structure for table 'menu_custom'
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'menu_custom'
--

/*!40000 ALTER TABLE menu_custom DISABLE KEYS */;
INSERT INTO `menu_custom` VALUES
('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');
/*!40000 ALTER TABLE menu_custom ENABLE KEYS */;

--
-- Table structure for table 'menu_links'
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM AUTO_INCREMENT=667 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'menu_links'
--

/*!40000 ALTER TABLE menu_links DISABLE KEYS */;
INSERT INTO `menu_links` VALUES
('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 2, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 8, 2, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 10, 2, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 1, 1, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 12, 0, 'comment/delete', 'comment/delete', 'Delete comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 13, 0, 'comment/edit', 'comment/edit', 'Edit comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 15, 2, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 2, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 18, 2, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 20, 2, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 22, 20, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 22, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 18, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 23, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 18, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 24, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 17, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 25, 0, 0, 0, 0, 0, 0, 0),
('navigation', 26, 18, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 26, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 10, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 27, 0, 0, 0, 0, 0, 0, 0),
('navigation', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0),
('navigation', 29, 10, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 29, 0, 0, 0, 0, 0, 0, 0),
('navigation', 30, 18, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 30, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 33, 18, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 33, 0, 0, 0, 0, 0, 0, 0),
('navigation', 34, 18, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 34, 0, 0, 0, 0, 0, 0, 0),
('navigation', 35, 18, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 35, 0, 0, 0, 0, 0, 0, 0),
('navigation', 36, 18, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 36, 0, 0, 0, 0, 0, 0, 0),
('navigation', 37, 18, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 37, 0, 0, 0, 0, 0, 0, 0),
('navigation', 38, 17, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 17, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 17, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 39, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 18, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 40, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 20, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 41, 0, 0, 0, 0, 0, 0, 0),
('navigation', 42, 10, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 42, 0, 0, 0, 0, 0, 0, 0),
('navigation', 43, 10, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 43, 0, 0, 0, 0, 0, 0, 0),
('navigation', 44, 0, 'comment/reply/%', 'comment/reply/%', 'Reply to comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 45, 20, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 45, 0, 0, 0, 0, 0, 0, 0),
('navigation', 46, 18, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 46, 0, 0, 0, 0, 0, 0, 0),
('navigation', 47, 18, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 47, 0, 0, 0, 0, 0, 0, 0),
('navigation', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0),
('navigation', 49, 17, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 49, 0, 0, 0, 0, 0, 0, 0),
('navigation', 50, 20, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 50, 0, 0, 0, 0, 0, 0, 0),
('navigation', 51, 20, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 51, 0, 0, 0, 0, 0, 0, 0),
('navigation', 52, 15, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 52, 0, 0, 0, 0, 0, 0, 0),
('navigation', 53, 15, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 53, 0, 0, 0, 0, 0, 0, 0),
('navigation', 54, 15, 'admin/help/comment', 'admin/help/comment', 'comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 54, 0, 0, 0, 0, 0, 0, 0),
('navigation', 55, 15, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 55, 0, 0, 0, 0, 0, 0, 0),
('navigation', 56, 15, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 56, 0, 0, 0, 0, 0, 0, 0),
('navigation', 57, 15, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 57, 0, 0, 0, 0, 0, 0, 0),
('navigation', 58, 15, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 58, 0, 0, 0, 0, 0, 0, 0),
('navigation', 59, 15, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 59, 0, 0, 0, 0, 0, 0, 0),
('navigation', 60, 15, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 60, 0, 0, 0, 0, 0, 0, 0),
('navigation', 61, 36, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 61, 0, 0, 0, 0, 0, 0),
('navigation', 62, 26, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 26, 62, 0, 0, 0, 0, 0, 0),
('navigation', 63, 23, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 63, 0, 0, 0, 0, 0, 0),
('navigation', 64, 25, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 64, 0, 0, 0, 0, 0, 0),
('navigation', 65, 17, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 65, 0, 0, 0, 0, 0, 0, 0),
('navigation', 66, 30, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 66, 0, 0, 0, 0, 0, 0),
('navigation', 67, 25, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 67, 0, 0, 0, 0, 0, 0),
('navigation', 68, 36, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 68, 0, 0, 0, 0, 0, 0),
('navigation', 69, 22, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 69, 0, 0, 0, 0, 0, 0),
('navigation', 70, 45, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 45, 70, 0, 0, 0, 0, 0, 0),
('navigation', 71, 22, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 71, 0, 0, 0, 0, 0, 0),
('navigation', 72, 48, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 72, 0, 0, 0, 0, 0, 0),
('navigation', 73, 42, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 42, 73, 0, 0, 0, 0, 0, 0),
('navigation', 74, 23, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 74, 0, 0, 0, 0, 0, 0),
('navigation', 75, 48, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 75, 0, 0, 0, 0, 0, 0),
('navigation', 76, 48, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 76, 0, 0, 0, 0, 0, 0),
('navigation', 77, 23, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 77, 0, 0, 0, 0, 0, 0),
('navigation', 78, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 79, 25, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 79, 0, 0, 0, 0, 0, 0),
('navigation', 80, 39, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 80, 0, 0, 0, 0, 0, 0),
('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 82, 39, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 82, 0, 0, 0, 0, 0, 0),
('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 86, 38, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 86, 0, 0, 0, 0, 0, 0),
('navigation', 87, 38, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 87, 0, 0, 0, 0, 0, 0),
('navigation', 88, 38, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 88, 0, 0, 0, 0, 0, 0),
('navigation', 89, 38, 'admin/build/menu-customize/navigation', 'admin/build/menu-customize/%', 'Navigation', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 89, 0, 0, 0, 0, 0, 0),
('navigation', 90, 38, 'admin/build/menu-customize/primary-links', 'admin/build/menu-customize/%', 'Primary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 90, 0, 0, 0, 0, 0, 0),
('navigation', 91, 38, 'admin/build/menu-customize/secondary-links', 'admin/build/menu-customize/%', 'Secondary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 91, 0, 0, 0, 0, 0, 0),
('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 93, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 93, 0, 0, 0, 0, 0, 0, 0),
('navigation', 94, 10, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 94, 0, 0, 0, 0, 0, 0, 0),
('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 96, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 96, 0, 0, 0, 0, 0, 0, 0),
('navigation', 97, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 97, 0, 0, 0, 0, 0, 0, 0),
('navigation', 98, 15, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 98, 0, 0, 0, 0, 0, 0, 0),
('navigation', 99, 15, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 99, 0, 0, 0, 0, 0, 0, 0),
('navigation', 100, 37, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 37, 100, 0, 0, 0, 0, 0, 0),
('navigation', 101, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 16, 101, 0, 0, 0, 0, 0, 0, 0),
('navigation', 102, 94, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 102, 0, 0, 0, 0, 0, 0),
('navigation', 103, 94, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 103, 0, 0, 0, 0, 0, 0),
('navigation', 104, 94, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 104, 0, 0, 0, 0, 0, 0),
('navigation', 105, 16, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 105, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 603, 169, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 603, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 604, 170, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Lightbox2', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 604, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 605, 170, 'admin/settings/vertical-tabs', 'admin/settings/vertical-tabs', 'Vertical Tabs', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 605, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 494, 11, 'node/add/company', 'node/add/company', 'Company', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"a production company";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 494, 0, 0, 0, 0, 0, 0, 0, 0),
('book-toc-35', 485, 0, 'node/35', 'node/%', 'Willkommen beim Views Workshop für Anfänger', 'a:0:{}', 'book', 0, 0, 0, 0, 0, 1, 0, 485, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 523, 0, 'admin_menu/flush-cache', 'admin_menu/flush-cache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 523, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 488, 274, 'http://drupal.org/project/issues/collapse_text', '', 'Collapse Text issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 488, 0, 0, 0, 0, 0, 0, 0),
('navigation', 108, 15, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 108, 0, 0, 0, 0, 0, 0, 0),
('navigation', 109, 105, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 109, 0, 0, 0, 0, 0, 0),
('navigation', 332, 10, 'admin/content/node-type/movie', 'admin/content/node-type/movie', 'Movie', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 332, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 652, 651, 'admin/content/node-type/movie/display/basic', 'admin/content/node-type/movie/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 338, 651, 652, 0, 0, 0, 0, 0),
('navigation', 497, 0, 'admin/content/node-type/company/delete', 'admin/content/node-type/company/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 497, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 602, 170, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 602, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 601, 170, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 601, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 600, 169, 'admin/build/demo', 'admin/build/demo', 'Demonstration site', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 600, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 599, 170, 'admin/settings/date_popup', 'admin/settings/date_popup', 'Date Popup Configuration', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 599, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 598, 170, 'admin/settings/admin_menu', 'admin/settings/admin_menu', 'Administration menu', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 598, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 589, 0, 'admin/content/node-type/company/groups/%/remove', 'admin/content/node-type/company/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 589, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 590, 0, 'admin/content/node-type/movie/groups/%/remove', 'admin/content/node-type/movie/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 590, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 591, 0, 'admin/content/node-type/actor/fields/field_gender/remove', 'admin/content/node-type/actor/fields/field_gender/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 591, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 592, 0, 'admin/content/node-type/actor/fields/field_image_actor/remove', 'admin/content/node-type/actor/fields/field_image_actor/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 592, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 593, 0, 'admin/content/node-type/company/fields/field_company_image/remove', 'admin/content/node-type/company/fields/field_company_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 593, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 594, 0, 'admin/content/node-type/movie/fields/field_cast/remove', 'admin/content/node-type/movie/fields/field_cast/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 594, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 595, 0, 'admin/content/node-type/movie/fields/field_image/remove', 'admin/content/node-type/movie/fields/field_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 595, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 596, 0, 'admin/content/node-type/movie/fields/field_production_company/remove', 'admin/content/node-type/movie/fields/field_production_company/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 596, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 597, 0, 'admin/content/node-type/movie/fields/field_release_date/remove', 'admin/content/node-type/movie/fields/field_release_date/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 597, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 586, 552, 'admin/build/views/%/preview/%', 'admin/build/views/%/preview/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 586, 0, 0, 0, 0, 0, 0),
('navigation', 587, 0, 'admin/content/node-type/actor/groups/%/remove', 'admin/content/node-type/actor/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 587, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 588, 0, 'admin/content/node-type/book/groups/%/remove', 'admin/content/node-type/book/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 588, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 585, 552, 'admin/build/views/%/details/%', 'admin/build/views/%/details/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 585, 0, 0, 0, 0, 0, 0),
('navigation', 584, 552, 'admin/build/views/%/analyze/%', 'admin/build/views/%/analyze/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 584, 0, 0, 0, 0, 0, 0),
('navigation', 583, 552, 'admin/build/views/%/%/%', 'admin/build/views/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 583, 0, 0, 0, 0, 0, 0),
('navigation', 575, 0, 'admin/build/imagecache/%/add/%', 'admin/build/imagecache/%/add/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 575, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 576, 0, 'admin/build/imagecache/%/%/delete', 'admin/build/imagecache/%/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 576, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 577, 30, 'admin/settings/date-time/formats/delete/%', 'admin/settings/date-time/formats/delete/%', 'Delete date format', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Allow users to delete a configured date format.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 577, 0, 0, 0, 0, 0, 0),
('navigation', 578, 0, 'admin/content/node-type/actor/groups/%', 'admin/content/node-type/actor/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 578, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 579, 0, 'admin/content/node-type/book/groups/%', 'admin/content/node-type/book/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 579, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 580, 0, 'admin/content/node-type/company/groups/%', 'admin/content/node-type/company/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 580, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 581, 0, 'admin/content/node-type/movie/groups/%', 'admin/content/node-type/movie/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 581, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 582, 552, 'admin/build/views/%/add-display/%', 'admin/build/views/%/add-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 582, 0, 0, 0, 0, 0, 0),
('navigation', 568, 552, 'admin/build/views/disable/%', 'admin/build/views/disable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 568, 0, 0, 0, 0, 0, 0),
('navigation', 569, 552, 'admin/build/views/enable/%', 'admin/build/views/enable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 569, 0, 0, 0, 0, 0, 0),
('navigation', 570, 552, 'admin/build/views/break-lock/%', 'admin/build/views/break-lock/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 570, 0, 0, 0, 0, 0, 0),
('navigation', 571, 552, 'admin/build/views/delete/%', 'admin/build/views/delete/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 571, 0, 0, 0, 0, 0, 0),
('navigation', 572, 2, 'admin/views/ajax/autocomplete/user', 'admin/views/ajax/autocomplete/user', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 572, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 573, 2, 'admin/views/ajax/autocomplete/tag', 'admin/views/ajax/autocomplete/tag', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 573, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 574, 552, 'admin/build/views/clone/%', 'admin/build/views/clone/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 574, 0, 0, 0, 0, 0, 0),
('admin_menu', 163, 0, '<front>', '', '<img class="admin-menu-icon" src="/sites/default/files/garland_favicon.ico" width="16" height="16" alt="Home" />', 'a:3:{s:11:"extra class";s:15:"admin-menu-icon";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, -100, 1, 0, 163, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 164, 0, 'logout', 'logout', 'Log out @username', 'a:3:{s:11:"extra class";s:35:"admin-menu-action admin-menu-logout";s:1:"t";a:0:{}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -100, 1, 0, 164, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 165, 0, 'user', 'user', 'icon_users', 'a:3:{s:11:"extra class";s:50:"admin-menu-action admin-menu-icon admin-menu-users";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -90, 1, 0, 165, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 166, 0, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 167, 0, 'admin/help', 'admin/help', 'Help', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 9, 1, 0, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 168, 0, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 5, 1, 0, 168, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 169, 0, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 170, 0, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -5, 1, 0, 170, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 171, 0, 'admin/user', 'admin/user', 'User management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 1, 0, 171, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 172, 171, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 171, 172, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 173, 170, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 173, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 619, 602, 'admin/settings/imageapi/list', 'admin/settings/imageapi/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 170, 602, 619, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 175, 170, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 175, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 176, 168, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 10, 2, 0, 168, 176, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 177, 169, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 177, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 178, 170, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 178, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 179, 166, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 179, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 180, 166, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 180, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 181, 166, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 181, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 182, 170, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 182, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 618, 606, 'admin/build/views/add', 'admin/build/views/add', 'Add', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 606, 618, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 184, 170, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 184, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 185, 170, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 185, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 186, 170, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 186, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 617, 603, 'admin/build/imagecache/list', 'admin/build/imagecache/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 169, 603, 617, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 616, 606, 'admin/build/views/import', 'admin/build/views/import', 'Import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 606, 616, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 189, 170, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 189, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 190, 170, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 170, 190, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 191, 169, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 191, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 192, 169, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 192, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 193, 170, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 193, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 194, 171, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 171, 194, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 195, 166, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 166, 195, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 196, 166, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 166, 196, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 197, 168, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 2, 0, 168, 197, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 198, 171, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 171, 198, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 199, 170, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 199, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 200, 170, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 170, 200, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 201, 168, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 10, 2, 0, 168, 201, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 202, 166, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 202, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 203, 169, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 203, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 204, 168, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 168, 204, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 205, 168, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 168, 205, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 206, 171, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 171, 206, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 207, 171, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 171, 207, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 209, 177, 'admin/build/block/add', 'admin/build/block/add', 'Add block', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 177, 209, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 210, 181, 'admin/content/types/add', 'admin/content/types/add', 'Add content type', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 181, 210, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 211, 189, 'admin/settings/filters/add', 'admin/settings/filters/add', 'Add input format', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 170, 189, 211, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 212, 191, 'admin/build/menu/add', 'admin/build/menu/add', 'Add menu', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 191, 212, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 214, 172, 'admin/user/rules/add', 'admin/user/rules/add', 'Add rule', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 171, 172, 214, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 215, 207, 'admin/user/user/create', 'admin/user/user/create', 'Add user', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 171, 207, 215, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 216, 179, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Approval queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 179, 216, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 217, 172, 'admin/user/rules/check', 'admin/user/rules/check', 'Check rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 171, 172, 217, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 633, 350, 'admin/content/node-type/actor/display', 'admin/content/node-type/actor/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 166, 181, 350, 633, 0, 0, 0, 0, 0, 0),
('admin_menu', 219, 203, 'admin/build/themes/settings', 'admin/build/themes/settings', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 169, 203, 219, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 632, 163, 'update.php', '', 'Run updates', 'a:2:{s:8:"external";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 50, 2, 0, 163, 632, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 221, 190, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 170, 190, 221, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 631, 625, 'admin/build/views/tools/basic', 'admin/build/views/tools/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 169, 606, 625, 631, 0, 0, 0, 0, 0, 0),
('admin_menu', 223, 177, 'admin/build/block/list', 'admin/build/block/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 3, 0, 169, 177, 223, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 630, 625, 'admin/build/views/tools/convert', 'admin/build/views/tools/convert', 'Convert', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 169, 606, 625, 630, 0, 0, 0, 0, 0, 0),
('admin_menu', 225, 180, 'admin/content/node/overview', 'admin/content/node/overview', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 166, 180, 225, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 226, 202, 'admin/content/taxonomy/list', 'admin/content/taxonomy/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 166, 202, 226, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 227, 181, 'admin/content/types/list', 'admin/content/types/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 166, 181, 227, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 228, 172, 'admin/user/rules/list', 'admin/user/rules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 171, 172, 228, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 229, 176, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 168, 176, 229, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 230, 207, 'admin/user/user/list', 'admin/user/user/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 171, 207, 230, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 232, 203, 'admin/build/themes/select', 'admin/build/themes/select', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 169, 203, 232, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 233, 192, 'admin/build/modules/list', 'admin/build/modules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 192, 233, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 629, 613, 'admin/settings/date-time/formats/custom', 'admin/settings/date-time/formats/custom', 'Custom formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 170, 182, 613, 629, 0, 0, 0, 0, 0, 0),
('admin_menu', 235, 189, 'admin/settings/filters/list', 'admin/settings/filters/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 170, 189, 235, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 236, 191, 'admin/build/menu/list', 'admin/build/menu/list', 'List menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 169, 191, 236, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 237, 173, 'admin/settings/actions/manage', 'admin/settings/actions/manage', 'Manage actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -2, 3, 0, 170, 173, 237, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 628, 613, 'admin/settings/date-time/formats/configure', 'admin/settings/date-time/formats/configure', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 170, 182, 613, 628, 0, 0, 0, 0, 0, 0),
('admin_menu', 239, 179, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 166, 179, 239, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 627, 613, 'admin/settings/date-time/formats/add', 'admin/settings/date-time/formats/add', 'Add format', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 4, 0, 170, 182, 613, 627, 0, 0, 0, 0, 0, 0),
('admin_menu', 626, 609, 'admin/settings/imageapi/config/imageapi_gd', 'admin/settings/imageapi/config/imageapi_gd', '@name', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 170, 602, 609, 626, 0, 0, 0, 0, 0, 0),
('admin_menu', 243, 191, 'admin/build/menu/settings', 'admin/build/menu/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 5, 3, 0, 169, 191, 243, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 244, 176, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 168, 176, 244, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 246, 192, 'admin/build/modules/uninstall', 'admin/build/modules/uninstall', 'Uninstall', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 192, 246, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 624, 600, 'admin/build/demo/maintenance', 'admin/build/demo/maintenance', 'Status', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 600, 624, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 625, 606, 'admin/build/views/tools', 'admin/build/views/tools', 'Tools', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 169, 606, 625, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 249, 223, 'admin/build/block/list/acquia_prosper', 'admin/build/block/list/acquia_prosper', 'Acquia Prosper', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 249, 0, 0, 0, 0, 0, 0),
('admin_menu', 250, 219, 'admin/build/themes/settings/acquia_prosper', 'admin/build/themes/settings/acquia_prosper', 'Acquia Prosper', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 250, 0, 0, 0, 0, 0, 0),
('admin_menu', 251, 223, 'admin/build/block/list/bluemarine', 'admin/build/block/list/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 251, 0, 0, 0, 0, 0, 0),
('admin_menu', 252, 219, 'admin/build/themes/settings/bluemarine', 'admin/build/themes/settings/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 252, 0, 0, 0, 0, 0, 0),
('admin_menu', 253, 223, 'admin/build/block/list/chameleon', 'admin/build/block/list/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 253, 0, 0, 0, 0, 0, 0),
('admin_menu', 254, 219, 'admin/build/themes/settings/chameleon', 'admin/build/themes/settings/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 254, 0, 0, 0, 0, 0, 0),
('admin_menu', 255, 223, 'admin/build/block/list/fusion_core', 'admin/build/block/list/fusion_core', 'Fusion Core', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 255, 0, 0, 0, 0, 0, 0),
('admin_menu', 256, 219, 'admin/build/themes/settings/fusion_core', 'admin/build/themes/settings/fusion_core', 'Fusion Core', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 256, 0, 0, 0, 0, 0, 0),
('admin_menu', 257, 223, 'admin/build/block/list/fusion_starter', 'admin/build/block/list/fusion_starter', 'Fusion Starter', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 257, 0, 0, 0, 0, 0, 0),
('admin_menu', 648, 645, 'admin/content/node-type/company/display/rss', 'admin/content/node-type/company/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 502, 645, 648, 0, 0, 0, 0, 0),
('admin_menu', 259, 219, 'admin/build/themes/settings/fusion_starter', 'admin/build/themes/settings/fusion_starter', 'Fusion Starter', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 259, 0, 0, 0, 0, 0, 0),
('admin_menu', 260, 223, 'admin/build/block/list/garland', 'admin/build/block/list/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 169, 177, 223, 260, 0, 0, 0, 0, 0, 0),
('admin_menu', 261, 219, 'admin/build/themes/settings/garland', 'admin/build/themes/settings/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 261, 0, 0, 0, 0, 0, 0),
('admin_menu', 262, 219, 'admin/build/themes/settings/global', 'admin/build/themes/settings/global', 'Global settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 4, 0, 169, 203, 219, 262, 0, 0, 0, 0, 0, 0),
('admin_menu', 263, 223, 'admin/build/block/list/marvin', 'admin/build/block/list/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 263, 0, 0, 0, 0, 0, 0),
('admin_menu', 264, 219, 'admin/build/themes/settings/marvin', 'admin/build/themes/settings/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 264, 0, 0, 0, 0, 0, 0),
('admin_menu', 265, 223, 'admin/build/block/list/minnelli', 'admin/build/block/list/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 265, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES
('admin_menu', 266, 219, 'admin/build/themes/settings/minnelli', 'admin/build/themes/settings/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 266, 0, 0, 0, 0, 0, 0),
('admin_menu', 268, 223, 'admin/build/block/list/pushbutton', 'admin/build/block/list/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 177, 223, 268, 0, 0, 0, 0, 0, 0),
('admin_menu', 269, 219, 'admin/build/themes/settings/pushbutton', 'admin/build/themes/settings/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 169, 203, 219, 269, 0, 0, 0, 0, 0, 0),
('admin_menu', 270, 202, 'admin/content/taxonomy/add/vocabulary', 'admin/content/taxonomy/add/vocabulary', 'Add vocabulary', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 202, 270, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 271, 163, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 50, 2, 0, 163, 271, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 615, 604, 'admin/settings/lightbox2/html_content', 'admin/settings/lightbox2/html_content', 'HTML Content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 3, 0, 170, 604, 615, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 273, 170, 'admin/by-module', 'admin/by-module', 'By module', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 2, 0, 170, 273, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 274, 163, 'http://drupal.org', '', 'Drupal.org', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, 100, 2, 0, 163, 274, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 275, 274, 'http://drupal.org/project/issues/drupal', '', 'Drupal issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, -10, 3, 0, 163, 274, 275, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 276, 274, 'http://drupal.org/project/issues/admin_menu', '', 'Administration menu issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 276, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 277, 274, 'http://drupal.org/project/issues/cck', '', 'Content issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 277, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 278, 274, 'http://drupal.org/project/issues/demo', '', 'Demonstration site issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 278, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 279, 274, 'http://drupal.org/project/issues/filefield', '', 'FileField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 279, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 280, 274, 'http://drupal.org/project/issues/imageapi', '', 'ImageAPI issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 280, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 281, 274, 'http://drupal.org/project/issues/imagecache', '', 'ImageCache issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 281, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 282, 274, 'http://drupal.org/project/issues/imagefield', '', 'ImageField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 282, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 283, 274, 'http://drupal.org/project/issues/views', '', 'Views issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 283, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 284, 166, 'node/add', 'node/add', 'Create content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 284, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 651, 338, 'admin/content/node-type/movie/display', 'admin/content/node-type/movie/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 166, 181, 338, 651, 0, 0, 0, 0, 0, 0),
('navigation', 331, 11, 'node/add/movie', 'node/add/movie', 'Movie', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 331, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 566, 0, 'filefield/ahah/%/%/%', 'filefield/ahah/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 566, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 567, 30, 'admin/settings/date-time/delete/%', 'admin/settings/date-time/delete/%', 'Delete date format type', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:52:"Allow users to delete a configured date format type.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 567, 0, 0, 0, 0, 0, 0),
('navigation', 565, 552, 'admin/build/views/export/%', 'admin/build/views/export/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 552, 565, 0, 0, 0, 0, 0, 0),
('navigation', 564, 538, 'admin/build/demo/delete/%', 'admin/build/demo/delete/%', 'Delete snapshot', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 538, 564, 0, 0, 0, 0, 0, 0),
('admin_menu', 501, 284, 'node/add/company', 'node/add/company', 'Company', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 284, 501, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 502, 181, 'admin/content/node-type/company', 'admin/content/node-type/company', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:7:"Company";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 166, 181, 502, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 647, 645, 'admin/content/node-type/company/display/print', 'admin/content/node-type/company/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 502, 645, 647, 0, 0, 0, 0, 0),
('admin_menu', 609, 602, 'admin/settings/imageapi/config', 'admin/settings/imageapi/config', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 170, 602, 609, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 610, 600, 'admin/build/demo/dump', 'admin/build/demo/dump', 'Create snapshot', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 3, 0, 169, 600, 610, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 611, 182, 'admin/settings/date-time/configure', 'admin/settings/date-time/configure', 'Date and time', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 170, 182, 611, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 612, 181, 'admin/content/types/fields', 'admin/content/types/fields', 'Fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 181, 612, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 613, 182, 'admin/settings/date-time/formats', 'admin/settings/date-time/formats', 'Formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 3, 0, 170, 182, 613, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 614, 604, 'admin/settings/lightbox2/general', 'admin/settings/lightbox2/general', 'General', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 170, 604, 614, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 608, 604, 'admin/settings/lightbox2/automatic', 'admin/settings/lightbox2/automatic', 'Automatic image handling', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 3, 0, 170, 604, 608, 0, 0, 0, 0, 0, 0, 0),
('navigation', 550, 15, 'admin/help/lightbox2', 'admin/help/lightbox2', 'lightbox2', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 550, 0, 0, 0, 0, 0, 0, 0),
('navigation', 551, 15, 'admin/help/markdown', 'admin/help/markdown', 'markdown', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 551, 0, 0, 0, 0, 0, 0, 0),
('navigation', 552, 17, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:144:"Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 552, 0, 0, 0, 0, 0, 0, 0),
('navigation', 553, 15, 'admin/help/views_ui', 'admin/help/views_ui', 'views_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 553, 0, 0, 0, 0, 0, 0, 0),
('navigation', 554, 540, 'admin/build/imagecache/%', 'admin/build/imagecache/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 540, 554, 0, 0, 0, 0, 0, 0),
('navigation', 555, 0, 'sites/default/files/imagecache', 'sites/default/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 555, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 556, 17, 'admin/build/views1/convert', 'admin/build/views1/convert', 'Convert view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 556, 0, 0, 0, 0, 0, 0, 0),
('navigation', 557, 17, 'admin/build/views1/delete', 'admin/build/views1/delete', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 557, 0, 0, 0, 0, 0, 0, 0),
('navigation', 558, 0, 'admin/build/imagecache/%/delete', 'admin/build/imagecache/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 558, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 559, 0, 'admin/build/imagecache/%/export', 'admin/build/imagecache/%/export', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 559, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 560, 0, 'admin/build/imagecache/%/flush', 'admin/build/imagecache/%/flush', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 560, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 561, 0, 'admin/build/imagecache/%/override', 'admin/build/imagecache/%/override', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 561, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 562, 0, 'admin/build/imagecache/%/%', 'admin/build/imagecache/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 562, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 563, 30, 'admin/settings/date-time/formats/lookup', 'admin/settings/date-time/formats/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 563, 0, 0, 0, 0, 0, 0),
('admin_menu', 317, 274, 'http://drupal.org/project/issues/date', '', 'Date issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 317, 0, 0, 0, 0, 0, 0, 0),
('navigation', 333, 0, 'admin/content/node-type/movie/delete', 'admin/content/node-type/movie/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 333, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 549, 15, 'admin/help/jcalendar', 'admin/help/jcalendar', 'jcalendar', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 549, 0, 0, 0, 0, 0, 0, 0),
('navigation', 548, 15, 'admin/help/imagecache_ui', 'admin/help/imagecache_ui', 'imagecache_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 548, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 337, 284, 'node/add/movie', 'node/add/movie', 'Movie', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 284, 337, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 338, 181, 'admin/content/node-type/movie', 'admin/content/node-type/movie', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:5:"Movie";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 166, 181, 338, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 644, 473, 'admin/content/node-type/book/fields', 'admin/content/node-type/book/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 166, 181, 473, 644, 0, 0, 0, 0, 0, 0),
('admin_menu', 645, 502, 'admin/content/node-type/company/display', 'admin/content/node-type/company/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 166, 181, 502, 645, 0, 0, 0, 0, 0, 0),
('admin_menu', 646, 645, 'admin/content/node-type/company/display/basic', 'admin/content/node-type/company/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 502, 645, 646, 0, 0, 0, 0, 0),
('admin_menu', 643, 640, 'admin/content/node-type/book/display/rss', 'admin/content/node-type/book/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 473, 640, 643, 0, 0, 0, 0, 0),
('navigation', 343, 11, 'node/add/actor', 'node/add/actor', 'Actor', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 343, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 344, 10, 'admin/content/node-type/actor', 'admin/content/node-type/actor', 'Actor', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 344, 0, 0, 0, 0, 0, 0, 0),
('navigation', 345, 0, 'admin/content/node-type/actor/delete', 'admin/content/node-type/actor/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 345, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 547, 15, 'admin/help/date', 'admin/help/date', 'date', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 547, 0, 0, 0, 0, 0, 0, 0),
('navigation', 546, 15, 'admin/help/content', 'admin/help/content', 'content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 546, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 349, 284, 'node/add/actor', 'node/add/actor', 'Actor', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 284, 349, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 350, 181, 'admin/content/node-type/actor', 'admin/content/node-type/actor', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:5:"Actor";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 166, 181, 350, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 640, 473, 'admin/content/node-type/book/display', 'admin/content/node-type/book/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 166, 181, 473, 640, 0, 0, 0, 0, 0, 0),
('admin_menu', 641, 640, 'admin/content/node-type/book/display/basic', 'admin/content/node-type/book/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 473, 640, 641, 0, 0, 0, 0, 0),
('admin_menu', 642, 640, 'admin/content/node-type/book/display/print', 'admin/content/node-type/book/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 473, 640, 642, 0, 0, 0, 0, 0),
('navigation', 543, 18, 'admin/settings/vertical-tabs', 'admin/settings/vertical-tabs', 'Vertical Tabs', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 543, 0, 0, 0, 0, 0, 0, 0),
('navigation', 544, 15, 'admin/help/admin_menu', 'admin/help/admin_menu', 'admin_menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 544, 0, 0, 0, 0, 0, 0, 0),
('navigation', 545, 15, 'admin/help/calendar', 'admin/help/calendar', 'calendar', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 545, 0, 0, 0, 0, 0, 0, 0),
('navigation', 541, 18, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Lightbox2', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:51:"Allows the user to configure the lightbox2 settings";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 541, 0, 0, 0, 0, 0, 0, 0),
('navigation', 542, 0, 'user/login/lightbox2', 'user/login/lightbox2', 'Login', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 542, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 540, 17, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Administer imagecache presets and actions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 540, 0, 0, 0, 0, 0, 0, 0),
('navigation', 539, 18, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Configure ImageAPI.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 539, 0, 0, 0, 0, 0, 0, 0),
('navigation', 520, 0, 'upload/js', 'upload/js', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 520, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 538, 17, 'admin/build/demo', 'admin/build/demo', 'Demonstration site', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:73:"Administer reset interval, create new dumps and manually reset this site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 538, 0, 0, 0, 0, 0, 0, 0),
('navigation', 496, 10, 'admin/content/node-type/company', 'admin/content/node-type/company', 'Company', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 496, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 623, 604, 'admin/settings/lightbox2/slideshow', 'admin/settings/lightbox2/slideshow', 'Slideshow', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 170, 604, 623, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 622, 600, 'admin/build/demo/reset', 'admin/build/demo/reset', 'Reset site', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 3, 0, 169, 600, 622, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 620, 606, 'admin/build/views/list', 'admin/build/views/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 169, 606, 620, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 621, 600, 'admin/build/demo/manage', 'admin/build/demo/manage', 'Manage snapshots', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 169, 600, 621, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 607, 603, 'admin/build/imagecache/add', 'admin/build/imagecache/add', 'Add new preset', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 169, 603, 607, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 606, 169, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 169, 606, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 388, 274, 'http://drupal.org/project/issues/calendar', '', 'Calendar issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 388, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 389, 274, 'http://drupal.org/project/issues/flag', '', 'Flag issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 389, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 390, 274, 'http://drupal.org/project/issues/multi_node_add', '', 'Multiple Node Add issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 390, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 391, 274, 'http://drupal.org/project/issues/vertical_tabs', '', 'Vertical Tabs issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 391, 0, 0, 0, 0, 0, 0, 0),
('navigation', 537, 18, 'admin/settings/date_popup', 'admin/settings/date_popup', 'Date Popup Configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:53:"Allows the user to configure the Date Popup settings.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 537, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 518, 0, 'admin/build/demo/reset', 'admin/build', 'Demoversionen', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Zurücksetzen der Demoversionen";}}', 'menu', 0, 0, 0, 0, 50, 1, 1, 518, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 650, 649, 'admin/content/node-type/company/fields/field_company_image', 'admin/content/node-type/company/fields/field_company_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 502, 649, 650, 0, 0, 0, 0, 0),
('admin_menu', 431, 274, 'http://drupal.org/project/issues/views_attach', '', 'Views attach issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 431, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 432, 274, 'http://drupal.org/project/issues/views_cycle', '', 'Views Cycle issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 432, 0, 0, 0, 0, 0, 0, 0),
('navigation', 527, 0, 'demo/download', 'demo/download', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 527, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 528, 0, 'filefield/progress', 'filefield/progress', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 528, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 529, 0, 'contact/lightbox2', 'contact/lightbox2', 'Contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 529, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 530, 0, 'jcalendar/getnode', 'jcalendar/getnode', 'Get Calendar Node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 530, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 531, 0, 'nodereference/autocomplete', 'nodereference/autocomplete', 'Nodereference autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 531, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 532, 0, 'user/timezone', 'user/timezone', 'User timezone', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 532, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 533, 0, 'userreference/autocomplete', 'userreference/autocomplete', 'Userreference autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 533, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 534, 0, 'views/ajax', 'views/ajax', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Ajax callback for view loading.";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 534, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 535, 0, 'system/files/imagecache', 'system/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 535, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 536, 18, 'admin/settings/admin_menu', 'admin/settings/admin_menu', 'Administration menu', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"Adjust administration menu settings.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 536, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 443, 274, 'http://drupal.org/project/issues/lightbox2', '', 'Lightbox2 issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 443, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 484, 0, 'node/35', 'node/%', 'Home', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Willkommen beim Views Workshop für Anfänger";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 484, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 467, 166, 'admin/content/book', 'admin/content/book', 'Books', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 166, 467, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 452, 274, 'http://drupal.org/project/issues/markdown', '', 'Markdown filter issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 163, 274, 452, 0, 0, 0, 0, 0, 0, 0),
('navigation', 453, 0, 'book', 'book', 'Books', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 453, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 455, 453, 'book/js/form', 'book/js/form', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 453, 455, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 456, 11, 'node/add/book', 'node/add/book', 'Book page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 456, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 457, 10, 'admin/content/book', 'admin/content/book', 'Books', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Manage your site''s book outlines.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 457, 0, 0, 0, 0, 0, 0, 0),
('navigation', 458, 15, 'admin/help/book', 'admin/help/book', 'book', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 458, 0, 0, 0, 0, 0, 0, 0),
('navigation', 459, 453, 'book/export/%/%', 'book/export/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 453, 459, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 461, 10, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Book page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 461, 0, 0, 0, 0, 0, 0, 0),
('navigation', 462, 457, 'admin/content/book/%', 'admin/content/book/%', 'Re-order book pages and change titles', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 457, 462, 0, 0, 0, 0, 0, 0),
('navigation', 463, 0, 'node/%/outline/remove', 'node/%/outline/remove', 'Remove from outline', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 463, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 464, 0, 'admin/content/node-type/book/delete', 'admin/content/node-type/book/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 464, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 525, 0, 'content/js_add_more', 'content/js_add_more', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 525, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 526, 0, 'demo/autocomplete', 'demo/autocomplete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 526, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 524, 0, 'admin_menu/toggle-modules', 'admin_menu/toggle-modules', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 524, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 468, 467, 'admin/content/book/list', 'admin/content/book/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 467, 468, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 469, 467, 'admin/content/book/settings', 'admin/content/book/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 8, 3, 0, 166, 467, 469, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 471, 284, 'node/add/book', 'node/add/book', 'Book page', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 166, 284, 471, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 649, 502, 'admin/content/node-type/company/fields', 'admin/content/node-type/company/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 166, 181, 502, 649, 0, 0, 0, 0, 0, 0),
('admin_menu', 473, 181, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:9:"Book page";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 166, 181, 473, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 636, 633, 'admin/content/node-type/actor/display/rss', 'admin/content/node-type/actor/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 350, 633, 636, 0, 0, 0, 0, 0),
('admin_menu', 637, 350, 'admin/content/node-type/actor/fields', 'admin/content/node-type/actor/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 166, 181, 350, 637, 0, 0, 0, 0, 0, 0),
('admin_menu', 638, 637, 'admin/content/node-type/actor/fields/field_gender', 'admin/content/node-type/actor/fields/field_gender', 'Gender', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 350, 637, 638, 0, 0, 0, 0, 0),
('admin_menu', 639, 637, 'admin/content/node-type/actor/fields/field_image_actor', 'admin/content/node-type/actor/fields/field_image_actor', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 350, 637, 639, 0, 0, 0, 0, 0),
('admin_menu', 634, 633, 'admin/content/node-type/actor/display/basic', 'admin/content/node-type/actor/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 350, 633, 634, 0, 0, 0, 0, 0),
('admin_menu', 635, 633, 'admin/content/node-type/actor/display/print', 'admin/content/node-type/actor/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 350, 633, 635, 0, 0, 0, 0, 0),
('navigation', 521, 18, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Control how files may be attached to content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 521, 0, 0, 0, 0, 0, 0, 0),
('navigation', 522, 15, 'admin/help/upload', 'admin/help/upload', 'upload', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 522, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 653, 651, 'admin/content/node-type/movie/display/print', 'admin/content/node-type/movie/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 338, 651, 653, 0, 0, 0, 0, 0),
('admin_menu', 654, 651, 'admin/content/node-type/movie/display/rss', 'admin/content/node-type/movie/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 166, 181, 338, 651, 654, 0, 0, 0, 0, 0),
('admin_menu', 655, 338, 'admin/content/node-type/movie/fields', 'admin/content/node-type/movie/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 166, 181, 338, 655, 0, 0, 0, 0, 0, 0),
('admin_menu', 656, 655, 'admin/content/node-type/movie/fields/field_cast', 'admin/content/node-type/movie/fields/field_cast', 'Cast', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 338, 655, 656, 0, 0, 0, 0, 0),
('admin_menu', 657, 655, 'admin/content/node-type/movie/fields/field_image', 'admin/content/node-type/movie/fields/field_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 338, 655, 657, 0, 0, 0, 0, 0),
('admin_menu', 658, 655, 'admin/content/node-type/movie/fields/field_production_company', 'admin/content/node-type/movie/fields/field_production_company', 'Production company', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 338, 655, 658, 0, 0, 0, 0, 0),
('admin_menu', 659, 655, 'admin/content/node-type/movie/fields/field_release_date', 'admin/content/node-type/movie/fields/field_release_date', 'Release Date', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 166, 181, 338, 655, 659, 0, 0, 0, 0, 0),
('admin_menu', 660, 163, 'admin_menu/flush-cache', 'admin_menu/flush-cache', 'Flush all caches', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 1, 0, 20, 2, 0, 163, 660, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 661, 660, 'admin_menu/flush-cache/admin_menu', 'admin_menu/flush-cache', 'Administration menu', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 163, 660, 661, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 662, 660, 'admin_menu/flush-cache/cache', 'admin_menu/flush-cache', 'Cache tables', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 163, 660, 662, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 663, 660, 'admin_menu/flush-cache/menu', 'admin_menu/flush-cache', 'Menu', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 163, 660, 663, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 664, 660, 'admin_menu/flush-cache/requisites', 'admin_menu/flush-cache', 'Page requisites', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 163, 660, 664, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 665, 660, 'admin_menu/flush-cache/theme', 'admin_menu/flush-cache', 'Theme registry', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 163, 660, 665, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 666, 163, 'admin_menu/toggle-modules', 'admin_menu/toggle-modules', 'Disable developer modules', 'a:2:{s:5:"query";s:11:"destination";s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 88, 2, 0, 163, 666, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE menu_links ENABLE KEYS */;

--
-- Table structure for table 'menu_router'
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'menu_router'
--

/*!40000 ALTER TABLE menu_router DISABLE KEYS */;
INSERT INTO `menu_router` VALUES
('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, ''),
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, ''),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('book', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'book_render', 'a:0:{}', 1, 1, '', 'book', 'Books', 't', '', 20, '', '', '', 0, 'modules/book/book.pages.inc'),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('filefield/progress', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'filefield_progress', 'a:0:{}', 3, 2, '', 'filefield/progress', '', 't', '', 4, '', '', '', 0, ''),
('contact/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'lightbox2_contact', 'a:0:{}', 3, 2, '', 'contact/lightbox2', 'Contact', 't', '', 4, '', '', '', 0, ''),
('nodereference/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'nodereference_autocomplete', 'a:0:{}', 3, 2, '', 'nodereference/autocomplete', 'Nodereference autocomplete', 't', '', 4, '', '', '', 0, ''),
('upload/js', '', '', 'user_access', 'a:1:{i:0;s:12:"upload files";}', 'upload_js', 'a:0:{}', 3, 2, '', 'upload/js', '', 't', '', 4, '', '', '', 0, ''),
('user/timezone', '', '', '1', 'a:0:{}', 'user_timezone', 'a:0:{}', 3, 2, '', 'user/timezone', 'User timezone', 't', '', 4, '', '', '', 0, ''),
('userreference/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'userreference_autocomplete', 'a:0:{}', 3, 2, '', 'userreference/autocomplete', 'Userreference autocomplete', 't', '', 4, '', '', '', 0, ''),
('admin_menu/flush-cache', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'admin_menu_flush_cache', 'a:0:{}', 3, 2, '', 'admin_menu/flush-cache', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/admin_menu/admin_menu.inc'),
('admin_menu/toggle-modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'admin_menu_toggle_modules', 'a:0:{}', 3, 2, '', 'admin_menu/toggle-modules', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/admin_menu/admin_menu.inc'),
('content/js_add_more', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'content_add_more_js', 'a:0:{}', 3, 2, '', 'content/js_add_more', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.node_form.inc'),
('demo/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'demo_autocomplete', 'a:0:{}', 3, 2, '', 'demo/autocomplete', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('demo/download', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'demo_download', 'a:0:{}', 3, 2, '', 'demo/download', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc'),
('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('system/files', '', '', '1', 'a:1:{i:0;s:19:"view uploaded files";}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, ''),
('jcalendar/getnode', '', '', '1', 'a:0:{}', 'get_calendar_node', 'a:2:{i:0;i:2;i:1;i:3;}', 3, 2, '', 'jcalendar/getnode', 'Get Calendar Node', 't', '', 4, '', '', '', 0, ''),
('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc'),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('views/ajax', '', '', '1', 'a:0:{}', 'views_ajax', 'a:0:{}', 3, 2, '', 'views/ajax', 'Views', 't', '', 4, '', 'Ajax callback for view loading.', '', 0, 'sites/all/modules/contrib/views/includes/ajax.inc'),
('admin/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc'),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc'),
('admin/build', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/settings', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc'),
('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('system/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache_private', 'a:0:{}', 7, 3, '', 'system/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('user/login/lightbox2', '', '', 'user_is_anonymous', 'a:0:{}', 'lightbox2_login', 'a:0:{}', 7, 3, '', 'user/login/lightbox2', 'Login', 't', '', 4, '', '', '', 0, ''),
('book/js/form', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'book_form_update', 'a:0:{}', 7, 3, '', 'book/js/form', '', 't', '', 4, '', '', '', 0, 'modules/book/book.pages.inc'),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/content/book', '', '', 'user_access', 'a:1:{i:0;s:24:"administer book outlines";}', 'book_admin_overview', 'a:0:{}', 7, 3, '', 'admin/content/book', 'Books', 't', '', 6, '', 'Manage your site''s book outlines.', '', 0, 'modules/book/book.admin.inc'),
('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc'),
('admin/settings/imageapi', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 7, 3, '', 'admin/settings/imageapi', 'ImageAPI', 't', '', 6, '', 'Configure ImageAPI.', '', 0, ''),
('admin/build/imagecache', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 7, 3, '', 'admin/build/imagecache', 'ImageCache', 't', '', 6, '', 'Administer imagecache presets and actions.', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc'),
('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/settings/vertical-tabs', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"vertical_tabs_settings_form";}', 7, 3, '', 'admin/settings/vertical-tabs', 'Vertical Tabs', 't', '', 6, '', '', '', 0, 'sites/all/modules/contrib/vertical_tabs/vertical_tabs.admin.inc'),
('admin/help/admin_menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/admin_menu', 'admin_menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/book', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/book', 'book', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/calendar', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/calendar', 'calendar', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/content', 'content', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/date', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/date', 'date', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/imagecache_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/imagecache_ui', 'imagecache_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/jcalendar', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/jcalendar', 'jcalendar', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/lightbox2', 'lightbox2', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/markdown', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/markdown', 'markdown', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/upload', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/upload', 'upload', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/views_ui', 'views_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/settings/admin_menu', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"admin_menu_theme_settings";}', 7, 3, '', 'admin/settings/admin_menu', 'Administration menu', 't', '', 6, '', 'Adjust administration menu settings.', '', 0, 'sites/all/modules/contrib/admin_menu/admin_menu.inc'),
('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/settings/date_popup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"date_popup_settings";}', 7, 3, '', 'admin/settings/date_popup', 'Date Popup Configuration', 't', '', 6, '', 'Allows the user to configure the Date Popup settings.', '', 0, ''),
('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/demo', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:19:"demo_admin_settings";}', 7, 3, '', 'admin/build/demo', 'Demonstration site', 't', '', 6, '', 'Administer reset interval, create new dumps and manually reset this site.', '', 0, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc'),
('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/uploads', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"upload_admin_settings";}', 7, 3, '', 'admin/settings/uploads', 'File uploads', 't', '', 6, '', 'Control how files may be attached to content.', '', 0, 'modules/upload/upload.admin.inc'),
('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('admin/settings/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'lightbox2_settings_page', 'a:0:{}', 7, 3, '', 'admin/settings/lightbox2', 'Lightbox2', 't', '', 6, '', 'Allows the user to configure the lightbox2 settings', '', 0, 'sites/all/modules/contrib/lightbox2/lightbox2.admin.inc'),
('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc'),
('node/%/outline', 'a:1:{i:1;s:9:"node_load";}', '', '_book_outline_access', 'a:1:{i:0;i:1;}', 'book_outline', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Outline', 't', '', 128, '', '', '', 2, 'modules/book/book.pages.inc'),
('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc'),
('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc'),
('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc'),
('comment/reply/%', 'a:1:{i:2;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:2;}', 'comment_reply', 'a:1:{i:0;i:2;}', 6, 3, '', 'comment/reply/%', 'Reply to comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc'),
('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, '', 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, '', 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc'),
('admin/build/views', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 7, 3, '', 'admin/build/views', 'Views', 't', '', 6, '', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/add/actor', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"actor";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/actor', 'Actor', 'check_plain', '', 6, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 7, 3, '', 'admin/settings/admin', 'Administration theme', 't', '', 6, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 0, 'modules/system/system.admin.inc'),
('node/add/book', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"book";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/book', 'Book page', 'check_plain', '', 6, '', 'A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.', '', 0, 'modules/node/node.pages.inc'),
('node/add/company', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:7:"company";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/company', 'Company', 'check_plain', '', 6, '', 'a production company', '', 0, 'modules/node/node.pages.inc'),
('node/add/movie', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"movie";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/movie', 'Movie', 'check_plain', '', 6, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/build/imagecache/list', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc'),
('admin/content/book/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer book outlines";}', 'book_admin_overview', 'a:0:{}', 15, 4, 'admin/content/book', 'admin/content/book', 'List', 't', '', 136, '', '', '', 0, 'modules/book/book.admin.inc'),
('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/settings/imageapi/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'List', 't', '', 136, '', '', '', -1, ''),
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc'),
('admin/build/demo/maintenance', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:19:"demo_admin_settings";}', 15, 4, 'admin/build/demo', 'admin/build/demo', 'Status', 't', '', 136, '', '', '', 0, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('sites/default/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache', 'a:0:{}', 15, 4, '', 'sites/default/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/imageapi/config', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'Configure', 't', '', 128, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/types/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_fields_list', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'Fields', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('book/export/%/%', 'a:2:{i:2;N;i:3;N;}', '', 'user_access', 'a:1:{i:0;s:31:"access printer-friendly version";}', 'book_export', 'a:2:{i:0;i:2;i:1;i:3;}', 12, 4, '', 'book/export/%/%', '', 't', '', 4, '', '', '', 0, 'modules/book/book.pages.inc'),
('admin/content/node-type/actor', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"actor";s:4:"name";s:5:"Actor";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:4:"Name";s:8:"has_body";s:1:"1";s:10:"body_label";s:3:"Bio";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/actor', 'Actor', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/views/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_page', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'Add', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/imagecache/add', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imagecache_ui_preset_form";}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'Add new preset', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/book', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 15, 4, '', 'admin/content/node-type/book', 'Book page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/company', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"company";s:4:"name";s:7:"Company";s:6:"module";s:4:"node";s:11:"description";s:20:"a production company";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/company', 'Company', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/demo/dump', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:14:"demo_dump_form";}', 15, 4, 'admin/build/demo', 'admin/build/demo', 'Create snapshot', 't', '', 128, '', '', '', 2, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/demo/manage', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:16:"demo_manage_form";}', 15, 4, 'admin/build/demo', 'admin/build/demo', 'Manage snapshots', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/build/views/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'List', 't', '', 136, '', '', '', -1, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/content/node-type/movie', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"movie";s:4:"name";s:5:"Movie";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:11:"Description";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/movie', 'Movie', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/demo/reset', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:18:"demo_reset_confirm";}', 15, 4, 'admin/build/demo', 'admin/build/demo', 'Reset site', 't', '', 128, '', '', '', 3, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/content/book/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"book_admin_settings";}', 15, 4, 'admin/content/book', 'admin/content/book', 'Settings', 't', '', 128, '', '', '', 8, 'modules/book/book.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 128, '', '', '', 0, 'modules/update/update.settings.inc'),
('admin/build/views1/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_convert1', 'a:1:{i:0;i:4;}', 15, 4, '', 'admin/build/views1/convert', 'Convert view', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/convert.inc'),
('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/settings/date-time/configure', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 15, 4, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 't', '', 136, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/date-time/formats', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:26:"date_api_date_formats_form";}', 15, 4, 'admin/settings/date-time', 'admin/settings/date-time', 'Formats', 't', '', 128, '', 'Allow users to configure date formats', '', 1, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('admin/content/book/%', 'a:1:{i:3;s:9:"node_load";}', '', '_book_outline_access', 'a:1:{i:0;i:3;}', 'drupal_get_form', 'a:2:{i:0;s:15:"book_admin_edit";i:1;i:3;}', 14, 4, '', 'admin/content/book/%', 'Re-order book pages and change titles', 't', '', 4, '', '', '', 0, 'modules/book/book.admin.inc'),
('admin/build/views1/delete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:24:"views_ui_delete1_confirm";i:1;i:4;}', 15, 4, '', 'admin/build/views1/delete', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/convert.inc'),
('admin/build/views/import', '', '', 'views_import_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_import_page";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Import', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('node/%/outline/remove', 'a:1:{i:1;s:9:"node_load";}', '', '_book_outline_remove_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:16:"book_remove_form";i:1;i:1;}', 11, 4, '', 'node/%/outline/remove', 'Remove from outline', 't', '', 4, '', '', '', 0, 'modules/book/book.pages.inc'),
('admin/build/views/tools', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Tools', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/imagecache/%', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;}', 14, 4, '', 'admin/build/imagecache/%', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:24:"Edit preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/settings/lightbox2/automatic', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:43:"lightbox2_auto_image_handling_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Automatic image handling', 't', '', 128, '', 'Allows the user to configure the lightbox2 automatic image handling settings', '', 3, 'sites/all/modules/contrib/lightbox2/lightbox2.admin.inc'),
('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/settings/lightbox2/general', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:31:"lightbox2_general_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'General', 't', '', 136, '', 'Allows the user to configure the lightbox2 settings', '', 0, 'sites/all/modules/contrib/lightbox2/lightbox2.admin.inc'),
('admin/settings/lightbox2/html_content', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:30:"lightbox2_iframe_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'HTML Content', 't', '', 128, '', 'Allows the user to configure the lightbox2 HTML content functionality.', '', 2, 'sites/all/modules/contrib/lightbox2/lightbox2.admin.inc'),
('admin/settings/lightbox2/slideshow', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:33:"lightbox2_slideshow_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Slideshow', 't', '', 128, '', 'Allows the user to configure the lightbox2 slideshow functionality', '', 1, 'sites/all/modules/contrib/lightbox2/lightbox2.admin.inc'),
('admin/content/node-type/actor/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"actor";s:4:"name";s:5:"Actor";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:4:"Name";s:8:"has_body";s:1:"1";s:10:"body_label";s:3:"Bio";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/actor', 'admin/content/node-type/actor', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/book/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 31, 5, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/company/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"company";s:4:"name";s:7:"Company";s:6:"module";s:4:"node";s:11:"description";s:20:"a production company";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/company', 'admin/content/node-type/company', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/movie/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"movie";s:4:"name";s:5:"Movie";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:11:"Description";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/movie', 'admin/content/node-type/movie', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/date-time/formats/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'date_api_date_time_lookup', 'a:0:{}', 31, 5, '', 'admin/settings/date-time/formats/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, ''),
('admin/build/themes/settings/acquia_prosper', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:51:"sites/all/themes/acquia_prosper/acquia_prosper.info";s:4:"name";s:14:"acquia_prosper";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:14:"Acquia Prosper";s:11:"description";s:385:"<a href="http://www.acquia.com">Acquia''s</a> Prosper is grid-enabled and designed for <a href="http://www.ubercart.org">Ubercart</a> e-commerce. It uses the <a href="http://drupal.org/project/fusion">Fusion Core</a> base theme and <a href="http://drupal.org/project/skinr">Skinr</a> module for easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:28:"css/acquia-prosper-style.css";s:60:"sites/all/themes/acquia_prosper/css/acquia-prosper-style.css";s:26:"design_packs/gray/gray.css";s:58:"sites/all/themes/acquia_prosper/design_packs/gray/gray.css";}}s:7:"scripts";a:2:{s:19:"js/jquery.corner.js";s:51:"sites/all/themes/acquia_prosper/js/jquery.corner.js";s:27:"js/acquia-prosper-script.js";s:59:"sites/all/themes/acquia_prosper/js/acquia-prosper-script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:8:"fluid-95";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:5:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:16:"; Prosper styles";s:22:"prosper-general-styles";a:4:{s:5:"title";s:37:"Acquia Prosper - general theme styles";s:4:"type";s:6:"radios";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:10:{i:1;a:2:{s:5:"label";s:48:"Gray rounded title background, plain white block";s:5:"class";s:48:"prosper-gray-rounded-plain prosper-rounded-title";}i:2;a:2:{s:5:"label";s:43:"Gray rounded title background, list styling";s:5:"class";s:48:"prosper-gray-rounded-style prosper-rounded-title";}i:3;a:2:{s:5:"label";s:30:"Rounded corner dark background";s:5:"class";s:33:"prosper-grayborder-darkbackground";}i:4;a:2:{s:5:"label";s:32:"Light gray background and border";s:5:"class";s:34:"prosper-lightgraybackground-border";}i:5;a:2:{s:5:"label";s:41:"Medium gray background with bottom border";s:5:"class";s:41:"prosper-mediumgraybackground-bottomborder";}i:6;a:2:{s:5:"label";s:49:"Gradient background with padding and thick border";s:5:"class";s:23:"prosper-gradient-border";}i:7;a:2:{s:5:"label";s:9:"Menu list";s:5:"class";s:17:"prosper-menu-list";}i:8;a:2:{s:5:"label";s:32:"Shopping cart - Light background";s:5:"class";s:26:"prosper-shoppingcart-light";}i:9;a:2:{s:5:"label";s:31:"Shopping cart - Dark background";s:5:"class";s:25:"prosper-shoppingcart-dark";}i:10;a:2:{s:5:"label";s:50:"Tabbed block - also set Quicktabs style to Default";s:5:"class";s:17:"prosper-quicktabs";}}}s:16:"prosper-comments";a:4:{s:5:"title";s:30:"Acquia Prosper: comment styles";s:4:"type";s:6:"radios";s:8:"features";a:1:{i:0;s:15:"comment_wrapper";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:43:"Simple with white background and separators";s:5:"class";s:22:"prosper-comments-clean";}i:2;a:2:{s:5:"label";s:32:"Speech bubbles with pointed edge";s:5:"class";s:21:"prosper-comments-edgy";}}}s:21:"prosper-common-styles";a:4:{s:5:"title";s:36:"Acquia Prosper - common theme styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:24:"Gray border around image";s:5:"class";s:25:"prosper-gray-border-image";}}}}s:7:"version";s:13:"6.x-1.0-beta4";s:7:"project";s:14:"acquia_prosper";s:9:"datestamp";s:10:"1263168904";s:10:"screenshot";s:46:"sites/all/themes/acquia_prosper/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:28:"css/acquia-prosper-style.css";s:60:"sites/all/themes/acquia_prosper/css/acquia-prosper-style.css";s:26:"design_packs/gray/gray.css";s:58:"sites/all/themes/acquia_prosper/design_packs/gray/gray.css";}}s:7:"scripts";a:2:{s:19:"js/jquery.corner.js";s:51:"sites/all/themes/acquia_prosper/js/jquery.corner.js";s:27:"js/acquia-prosper-script.js";s:59:"sites/all/themes/acquia_prosper/js/acquia-prosper-script.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:11:"fusion_core";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:14:"acquia_prosper";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Acquia Prosper', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/bluemarine', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/chameleon', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-type/actor/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"actor";s:4:"name";s:5:"Actor";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:4:"Name";s:8:"has_body";s:1:"1";s:10:"body_label";s:3:"Bio";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/actor/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/book/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 31, 5, '', 'admin/content/node-type/book/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/company/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:7:"company";s:4:"name";s:7:"Company";s:6:"module";s:4:"node";s:11:"description";s:20:"a production company";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/company/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/movie/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"movie";s:4:"name";s:5:"Movie";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:11:"Description";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/movie/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes/settings/fusion_core', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:52:"sites/all/themes/fusion/fusion_core/fusion_core.info";s:4:"name";s:11:"fusion_core";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:11:"Fusion Core";s:11:"description";s:287:"<a href="http://drupal.org/project/fusion">Fusion Core</a> is the grid-enabled base theme for powerful sub-themes.  With the <a href="http://drupal.org/project/skinr">Skinr</a> module, it enables easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:5:{s:13:"css/style.css";s:49:"sites/all/themes/fusion/fusion_core/css/style.css";s:18:"css/typography.css";s:54:"sites/all/themes/fusion/fusion_core/css/typography.css";s:17:"css/superfish.css";s:53:"sites/all/themes/fusion/fusion_core/css/superfish.css";s:24:"css/superfish-navbar.css";s:60:"sites/all/themes/fusion/fusion_core/css/superfish-navbar.css";s:26:"css/superfish-vertical.css";s:62:"sites/all/themes/fusion/fusion_core/css/superfish-vertical.css";}}s:7:"scripts";a:7:{s:25:"js/jquery.bgiframe.min.js";s:61:"sites/all/themes/fusion/fusion_core/js/jquery.bgiframe.min.js";s:17:"js/hoverIntent.js";s:53:"sites/all/themes/fusion/fusion_core/js/hoverIntent.js";s:17:"js/supposition.js";s:53:"sites/all/themes/fusion/fusion_core/js/supposition.js";s:15:"js/supersubs.js";s:51:"sites/all/themes/fusion/fusion_core/js/supersubs.js";s:15:"js/superfish.js";s:51:"sites/all/themes/fusion/fusion_core/js/superfish.js";s:16:"js/screenshot.js";s:52:"sites/all/themes/fusion/fusion_core/js/screenshot.js";s:12:"js/script.js";s:48:"sites/all/themes/fusion/fusion_core/js/script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:4:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";i:2;s:10:"grid12-960";i:3;s:12:"grid12-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-13";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:13:{s:12:"grid16-width";a:4:{s:5:"title";s:22:"Width (16 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:16:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (60px/6.25%)";s:5:"class";s:8:"grid16-1";}i:2;a:2:{s:5:"label";s:26:"2 units wide (120px/12.5%)";s:5:"class";s:8:"grid16-2";}i:3;a:2:{s:5:"label";s:27:"3 units wide (180px/18.75%)";s:5:"class";s:8:"grid16-3";}i:4;a:2:{s:5:"label";s:24:"4 units wide (240px/25%)";s:5:"class";s:8:"grid16-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (300px/31.25%)";s:5:"class";s:8:"grid16-5";}i:6;a:2:{s:5:"label";s:26:"6 units wide (360px/37.5%)";s:5:"class";s:8:"grid16-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (420px/43.75%)";s:5:"class";s:8:"grid16-7";}i:8;a:2:{s:5:"label";s:24:"8 units wide (480px/50%)";s:5:"class";s:8:"grid16-8";}i:9;a:2:{s:5:"label";s:27:"9 units wide (540px/56.25%)";s:5:"class";s:8:"grid16-9";}i:10;a:2:{s:5:"label";s:27:"10 units wide (600px/62.5%)";s:5:"class";s:9:"grid16-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (660px/68.75%)";s:5:"class";s:9:"grid16-11";}i:12;a:2:{s:5:"label";s:25:"12 units wide (720px/75%)";s:5:"class";s:9:"grid16-12";}i:13;a:2:{s:5:"label";s:28:"13 units wide (780px/81.25%)";s:5:"class";s:9:"grid16-13";}i:14;a:2:{s:5:"label";s:27:"14 units wide (840px/87.5%)";s:5:"class";s:9:"grid16-14";}i:15;a:2:{s:5:"label";s:28:"15 units wide (900px/93.75%)";s:5:"class";s:9:"grid16-15";}i:16;a:2:{s:5:"label";s:26:"16 units wide (960px/100%)";s:5:"class";s:9:"grid16-16";}}}s:12:"grid12-width";a:4:{s:5:"title";s:22:"Width (12 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:12:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (80px/8.33%)";s:5:"class";s:8:"grid12-1";}i:2;a:2:{s:5:"label";s:27:"2 units wide (160px/16.67%)";s:5:"class";s:8:"grid12-2";}i:3;a:2:{s:5:"label";s:24:"3 units wide (240px/25%)";s:5:"class";s:8:"grid12-3";}i:4;a:2:{s:5:"label";s:27:"4 units wide (320px/33.33%)";s:5:"class";s:8:"grid12-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (400px/41.67%)";s:5:"class";s:8:"grid12-5";}i:6;a:2:{s:5:"label";s:24:"6 units wide (480px/50%)";s:5:"class";s:8:"grid12-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (560px/58.33%)";s:5:"class";s:8:"grid12-7";}i:8;a:2:{s:5:"label";s:27:"8 units wide (640px/66.67%)";s:5:"class";s:8:"grid12-8";}i:9;a:2:{s:5:"label";s:24:"9 units wide (720px/75%)";s:5:"class";s:8:"grid12-9";}i:10;a:2:{s:5:"label";s:28:"10 units wide (800px/83.33%)";s:5:"class";s:9:"grid12-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (680px/91.67%)";s:5:"class";s:9:"grid12-11";}i:12;a:2:{s:5:"label";s:26:"12 units wide (960px/100%)";s:5:"class";s:9:"grid12-12";}}}s:10:"grid-width";a:1:{s:11:"description";s:215:"Change the width of this block. Fluid grid % widths are relative to the parent region''s width. Default widths: sidebar blocks default to the sidebar width; in other regions width is divided equally among all blocks.";}s:16:"fusion-alignment";a:5:{s:5:"title";s:14:"Block position";s:4:"type";s:6:"select";s:11:"description";s:67:"Change the position of this block (default is to float to the left)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:3:{i:1;a:2:{s:5:"label";s:24:"Float block to the right";s:5:"class";s:12:"fusion-right";}i:2;a:2:{s:5:"label";s:28:"Position block in the center";s:5:"class";s:13:"fusion-center";}i:3;a:2:{s:5:"label";s:40:"Clear floats (block drops to a new line)";s:5:"class";s:12:"fusion-clear";}}}s:24:"fusion-content-alignment";a:4:{s:5:"title";s:17:"Content alignment";s:4:"type";s:6:"select";s:11:"description";s:31:"Default is left aligned content";s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:41:"Center align content within its container";s:5:"class";s:21:"fusion-center-content";}i:2;a:2:{s:5:"label";s:40:"Right align content within its container";s:5:"class";s:20:"fusion-right-content";}}}s:21:"fusion-general-styles";a:5:{s:5:"title";s:14:"General styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:50:"These are some generally useful options for blocks";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:4:{i:1;a:2:{s:5:"label";s:142:"<span class="preview-text">Text: large, bold callout style <span class="preview-icon" id="fusion-general-styles-fusion-callout"></span></span>";s:5:"class";s:14:"fusion-callout";}i:2;a:2:{s:5:"label";s:128:"<span class="preview-text">Links: bold all links <span class="preview-icon" id="fusion-general-styles-bold-links"></span></span>";s:5:"class";s:17:"fusion-bold-links";}i:3;a:2:{s:5:"label";s:155:"<span class="preview-text">Padding: add 30px extra padding inside block <span class="preview-icon" id="fusion-general-styles-fusion-padding"></span></span>";s:5:"class";s:14:"fusion-padding";}i:4;a:2:{s:5:"label";s:149:"<span class="preview-text">Border: add 1px border and 10px padding <span class="preview-icon" id="fusion-general-styles-fusion-border"></span></span>";s:5:"class";s:13:"fusion-border";}}}s:20:"fusion-equal-heights";a:6:{s:5:"title";s:13:"Equal heights";s:4:"type";s:10:"checkboxes";s:11:"description";s:39:"Make blocks in a region the same height";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:25:"js/jquery.equalheights.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:190:"<span class="preview-text">Equal heights: equalize the heights of blocks with this style in the same region <span class="preview-icon" id="fusion-general-styles-equal-heights"></span></span>";s:5:"class";s:13:"equal-heights";}}}s:15:"fusion-multicol";a:5:{s:5:"title";s:12:"List columns";s:4:"type";s:6:"select";s:11:"description";s:64:"Put items in lists (menus, list views, etc.) in multiple columns";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:28:"2-column list/menu (50%/50%)";s:5:"class";s:26:"fusion-2-col-list clearfix";}i:2;a:2:{s:5:"label";s:32:"3-column list/menu (33%/33%/33%)";s:5:"class";s:26:"fusion-3-col-list clearfix";}}}s:11:"fusion-menu";a:5:{s:5:"title";s:11:"Menu layout";s:4:"type";s:6:"radios";s:11:"description";s:54:"Different layouts and alignment options for your menus";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:137:"<span class="preview-text">Single line menu with separators <span class="preview-icon" id="fusion-menu-fusion-inline-menu"></span></span>";s:5:"class";s:18:"fusion-inline-menu";}i:2;a:2:{s:5:"label";s:171:"<span class="preview-text">Multi-column menu with bold headers (set menu items to Expanded) <span class="preview-icon" id="fusion-menu-fusion-multicol-menu"></span></span>";s:5:"class";s:29:"fusion-multicol-menu clearfix";}}}s:18:"fusion-list-styles";a:4:{s:5:"title";s:16:"List/menu styles";s:4:"type";s:10:"checkboxes";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:126:"<span class="preview-text">Bottom border (no bullets) <span class="preview-icon" id="list-styles-bottom-border"></span></span>";s:5:"class";s:25:"fusion-list-bottom-border";}i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Extra vertical spacing (no bullets) <span class="preview-icon" id="list-styles-extra-vertical-spacing"></span></span>";s:5:"class";s:28:"fusion-list-vertical-spacing";}}}s:16:"fusion-superfish";a:5:{s:5:"title";s:21:"Superfish menu styles";s:4:"type";s:6:"radios";s:11:"description";s:63:"Superfish dropdown menus (must also set menu items to Expanded)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:1:{i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Vertical menu (for sidebar blocks) <span class="preview-icon" id="fusion-superfish-superfish-vertical"></span></span>";s:5:"class";s:28:"superfish superfish-vertical";}}}s:23:"fusion-float-imagefield";a:5:{s:5:"title";s:21:"Image floating styles";s:4:"type";s:6:"select";s:11:"description";s:90:"These options will float ImageField images in content to the left or right and add margins";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:4:"node";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:21:"Float ImageField left";s:5:"class";s:28:"fusion-float-imagefield-left";}i:2;a:2:{s:5:"label";s:22:"Float ImageField right";s:5:"class";s:29:"fusion-float-imagefield-right";}}}s:12:"fusion-login";a:5:{s:5:"title";s:23:"User login block styles";s:4:"type";s:6:"radios";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:22:"js/jquery.overlabel.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:205:"<span class="preview-text">Horizontal: puts user login block on a single line with label overlays (good for Header Top region) <span class="preview-icon" id="fusion-login-fusion-horiz-login"></span></span>";s:5:"class";s:18:"fusion-horiz-login";}}}}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:10:"screenshot";s:50:"sites/all/themes/fusion/fusion_core/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:5:{s:13:"css/style.css";s:49:"sites/all/themes/fusion/fusion_core/css/style.css";s:18:"css/typography.css";s:54:"sites/all/themes/fusion/fusion_core/css/typography.css";s:17:"css/superfish.css";s:53:"sites/all/themes/fusion/fusion_core/css/superfish.css";s:24:"css/superfish-navbar.css";s:60:"sites/all/themes/fusion/fusion_core/css/superfish-navbar.css";s:26:"css/superfish-vertical.css";s:62:"sites/all/themes/fusion/fusion_core/css/superfish-vertical.css";}}s:7:"scripts";a:7:{s:25:"js/jquery.bgiframe.min.js";s:61:"sites/all/themes/fusion/fusion_core/js/jquery.bgiframe.min.js";s:17:"js/hoverIntent.js";s:53:"sites/all/themes/fusion/fusion_core/js/hoverIntent.js";s:17:"js/supposition.js";s:53:"sites/all/themes/fusion/fusion_core/js/supposition.js";s:15:"js/supersubs.js";s:51:"sites/all/themes/fusion/fusion_core/js/supersubs.js";s:15:"js/superfish.js";s:51:"sites/all/themes/fusion/fusion_core/js/superfish.js";s:16:"js/screenshot.js";s:52:"sites/all/themes/fusion/fusion_core/js/screenshot.js";s:12:"js/script.js";s:48:"sites/all/themes/fusion/fusion_core/js/script.js";}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:11:"fusion_core";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Fusion Core', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/fusion_starter', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:58:"sites/all/themes/fusion/fusion_starter/fusion_starter.info";s:4:"name";s:14:"fusion_starter";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:14:"Fusion Starter";s:11:"description";s:200:"Fusion Starter sub-theme. Requires <a href="http://drupal.org/project/fusion">Fusion Core</a> and the <a href="http://drupal.org/project/skinr">Skinr</a> module to enable easy point-and-click theming.";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:28:"css/fusion-starter-style.css";s:67:"sites/all/themes/fusion/fusion_starter/css/fusion-starter-style.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:2:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:65:"; Sample Skinr style (uncomment to use, see Skinr section in CSS)";}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:7:"scripts";a:1:{s:9:"script.js";s:48:"sites/all/themes/fusion/fusion_starter/script.js";}s:10:"screenshot";s:53:"sites/all/themes/fusion/fusion_starter/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:28:"css/fusion-starter-style.css";s:67:"sites/all/themes/fusion/fusion_starter/css/fusion-starter-style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:11:"fusion_core";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:14:"fusion_starter";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Fusion Starter', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Garland', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/themes/settings/marvin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/minnelli', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/imageapi/config/imageapi_gd', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 31, 5, 'admin/settings/imageapi/config', 'admin/settings/imageapi', '@name', 't', 'a:1:{s:5:"@name";s:12:"ImageAPI GD2";}', 136, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES
('admin/build/block/list/acquia_prosper', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:51:"sites/all/themes/acquia_prosper/acquia_prosper.info";s:4:"name";s:14:"acquia_prosper";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:14:"Acquia Prosper";s:11:"description";s:385:"<a href="http://www.acquia.com">Acquia''s</a> Prosper is grid-enabled and designed for <a href="http://www.ubercart.org">Ubercart</a> e-commerce. It uses the <a href="http://drupal.org/project/fusion">Fusion Core</a> base theme and <a href="http://drupal.org/project/skinr">Skinr</a> module for easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:28:"css/acquia-prosper-style.css";s:60:"sites/all/themes/acquia_prosper/css/acquia-prosper-style.css";s:26:"design_packs/gray/gray.css";s:58:"sites/all/themes/acquia_prosper/design_packs/gray/gray.css";}}s:7:"scripts";a:2:{s:19:"js/jquery.corner.js";s:51:"sites/all/themes/acquia_prosper/js/jquery.corner.js";s:27:"js/acquia-prosper-script.js";s:59:"sites/all/themes/acquia_prosper/js/acquia-prosper-script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:8:"fluid-95";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:5:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:16:"; Prosper styles";s:22:"prosper-general-styles";a:4:{s:5:"title";s:37:"Acquia Prosper - general theme styles";s:4:"type";s:6:"radios";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:10:{i:1;a:2:{s:5:"label";s:48:"Gray rounded title background, plain white block";s:5:"class";s:48:"prosper-gray-rounded-plain prosper-rounded-title";}i:2;a:2:{s:5:"label";s:43:"Gray rounded title background, list styling";s:5:"class";s:48:"prosper-gray-rounded-style prosper-rounded-title";}i:3;a:2:{s:5:"label";s:30:"Rounded corner dark background";s:5:"class";s:33:"prosper-grayborder-darkbackground";}i:4;a:2:{s:5:"label";s:32:"Light gray background and border";s:5:"class";s:34:"prosper-lightgraybackground-border";}i:5;a:2:{s:5:"label";s:41:"Medium gray background with bottom border";s:5:"class";s:41:"prosper-mediumgraybackground-bottomborder";}i:6;a:2:{s:5:"label";s:49:"Gradient background with padding and thick border";s:5:"class";s:23:"prosper-gradient-border";}i:7;a:2:{s:5:"label";s:9:"Menu list";s:5:"class";s:17:"prosper-menu-list";}i:8;a:2:{s:5:"label";s:32:"Shopping cart - Light background";s:5:"class";s:26:"prosper-shoppingcart-light";}i:9;a:2:{s:5:"label";s:31:"Shopping cart - Dark background";s:5:"class";s:25:"prosper-shoppingcart-dark";}i:10;a:2:{s:5:"label";s:50:"Tabbed block - also set Quicktabs style to Default";s:5:"class";s:17:"prosper-quicktabs";}}}s:16:"prosper-comments";a:4:{s:5:"title";s:30:"Acquia Prosper: comment styles";s:4:"type";s:6:"radios";s:8:"features";a:1:{i:0;s:15:"comment_wrapper";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:43:"Simple with white background and separators";s:5:"class";s:22:"prosper-comments-clean";}i:2;a:2:{s:5:"label";s:32:"Speech bubbles with pointed edge";s:5:"class";s:21:"prosper-comments-edgy";}}}s:21:"prosper-common-styles";a:4:{s:5:"title";s:36:"Acquia Prosper - common theme styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:24:"Gray border around image";s:5:"class";s:25:"prosper-gray-border-image";}}}}s:7:"version";s:13:"6.x-1.0-beta4";s:7:"project";s:14:"acquia_prosper";s:9:"datestamp";s:10:"1263168904";s:10:"screenshot";s:46:"sites/all/themes/acquia_prosper/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:28:"css/acquia-prosper-style.css";s:60:"sites/all/themes/acquia_prosper/css/acquia-prosper-style.css";s:26:"design_packs/gray/gray.css";s:58:"sites/all/themes/acquia_prosper/design_packs/gray/gray.css";}}s:7:"scripts";a:2:{s:19:"js/jquery.corner.js";s:51:"sites/all/themes/acquia_prosper/js/jquery.corner.js";s:27:"js/acquia-prosper-script.js";s:59:"sites/all/themes/acquia_prosper/js/acquia-prosper-script.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:11:"fusion_core";}}', 'block_admin_display', 'a:1:{i:0;s:14:"acquia_prosper";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Acquia Prosper', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/date-time/formats/custom', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'date_api_configure_custom_date_formats', 'a:0:{}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Custom formats', 't', '', 128, '', 'Allow users to configure custom date formats.', '', 2, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, ''),
('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/demo/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:2:{i:0;s:19:"demo_delete_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/demo/delete/%', 'Delete snapshot', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/content/node-type/actor/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:5:"actor";}', 31, 5, 'admin/content/node-type/actor', 'admin/content/node-type/actor', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/views/ajax/autocomplete/user', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_user', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/ajax.inc'),
('admin/content/node-type/book/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:4:"book";}', 31, 5, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_autocomplete_tag', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/content/node-type/company/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:7:"company";}', 31, 5, 'admin/content/node-type/company', 'admin/content/node-type/company', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:5:"movie";}', 31, 5, 'admin/content/node-type/movie', 'admin/content/node-type/movie', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/fusion_core', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:52:"sites/all/themes/fusion/fusion_core/fusion_core.info";s:4:"name";s:11:"fusion_core";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:11:"Fusion Core";s:11:"description";s:287:"<a href="http://drupal.org/project/fusion">Fusion Core</a> is the grid-enabled base theme for powerful sub-themes.  With the <a href="http://drupal.org/project/skinr">Skinr</a> module, it enables easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:5:{s:13:"css/style.css";s:49:"sites/all/themes/fusion/fusion_core/css/style.css";s:18:"css/typography.css";s:54:"sites/all/themes/fusion/fusion_core/css/typography.css";s:17:"css/superfish.css";s:53:"sites/all/themes/fusion/fusion_core/css/superfish.css";s:24:"css/superfish-navbar.css";s:60:"sites/all/themes/fusion/fusion_core/css/superfish-navbar.css";s:26:"css/superfish-vertical.css";s:62:"sites/all/themes/fusion/fusion_core/css/superfish-vertical.css";}}s:7:"scripts";a:7:{s:25:"js/jquery.bgiframe.min.js";s:61:"sites/all/themes/fusion/fusion_core/js/jquery.bgiframe.min.js";s:17:"js/hoverIntent.js";s:53:"sites/all/themes/fusion/fusion_core/js/hoverIntent.js";s:17:"js/supposition.js";s:53:"sites/all/themes/fusion/fusion_core/js/supposition.js";s:15:"js/supersubs.js";s:51:"sites/all/themes/fusion/fusion_core/js/supersubs.js";s:15:"js/superfish.js";s:51:"sites/all/themes/fusion/fusion_core/js/superfish.js";s:16:"js/screenshot.js";s:52:"sites/all/themes/fusion/fusion_core/js/screenshot.js";s:12:"js/script.js";s:48:"sites/all/themes/fusion/fusion_core/js/script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:4:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";i:2;s:10:"grid12-960";i:3;s:12:"grid12-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-13";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:13:{s:12:"grid16-width";a:4:{s:5:"title";s:22:"Width (16 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:16:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (60px/6.25%)";s:5:"class";s:8:"grid16-1";}i:2;a:2:{s:5:"label";s:26:"2 units wide (120px/12.5%)";s:5:"class";s:8:"grid16-2";}i:3;a:2:{s:5:"label";s:27:"3 units wide (180px/18.75%)";s:5:"class";s:8:"grid16-3";}i:4;a:2:{s:5:"label";s:24:"4 units wide (240px/25%)";s:5:"class";s:8:"grid16-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (300px/31.25%)";s:5:"class";s:8:"grid16-5";}i:6;a:2:{s:5:"label";s:26:"6 units wide (360px/37.5%)";s:5:"class";s:8:"grid16-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (420px/43.75%)";s:5:"class";s:8:"grid16-7";}i:8;a:2:{s:5:"label";s:24:"8 units wide (480px/50%)";s:5:"class";s:8:"grid16-8";}i:9;a:2:{s:5:"label";s:27:"9 units wide (540px/56.25%)";s:5:"class";s:8:"grid16-9";}i:10;a:2:{s:5:"label";s:27:"10 units wide (600px/62.5%)";s:5:"class";s:9:"grid16-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (660px/68.75%)";s:5:"class";s:9:"grid16-11";}i:12;a:2:{s:5:"label";s:25:"12 units wide (720px/75%)";s:5:"class";s:9:"grid16-12";}i:13;a:2:{s:5:"label";s:28:"13 units wide (780px/81.25%)";s:5:"class";s:9:"grid16-13";}i:14;a:2:{s:5:"label";s:27:"14 units wide (840px/87.5%)";s:5:"class";s:9:"grid16-14";}i:15;a:2:{s:5:"label";s:28:"15 units wide (900px/93.75%)";s:5:"class";s:9:"grid16-15";}i:16;a:2:{s:5:"label";s:26:"16 units wide (960px/100%)";s:5:"class";s:9:"grid16-16";}}}s:12:"grid12-width";a:4:{s:5:"title";s:22:"Width (12 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:12:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (80px/8.33%)";s:5:"class";s:8:"grid12-1";}i:2;a:2:{s:5:"label";s:27:"2 units wide (160px/16.67%)";s:5:"class";s:8:"grid12-2";}i:3;a:2:{s:5:"label";s:24:"3 units wide (240px/25%)";s:5:"class";s:8:"grid12-3";}i:4;a:2:{s:5:"label";s:27:"4 units wide (320px/33.33%)";s:5:"class";s:8:"grid12-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (400px/41.67%)";s:5:"class";s:8:"grid12-5";}i:6;a:2:{s:5:"label";s:24:"6 units wide (480px/50%)";s:5:"class";s:8:"grid12-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (560px/58.33%)";s:5:"class";s:8:"grid12-7";}i:8;a:2:{s:5:"label";s:27:"8 units wide (640px/66.67%)";s:5:"class";s:8:"grid12-8";}i:9;a:2:{s:5:"label";s:24:"9 units wide (720px/75%)";s:5:"class";s:8:"grid12-9";}i:10;a:2:{s:5:"label";s:28:"10 units wide (800px/83.33%)";s:5:"class";s:9:"grid12-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (680px/91.67%)";s:5:"class";s:9:"grid12-11";}i:12;a:2:{s:5:"label";s:26:"12 units wide (960px/100%)";s:5:"class";s:9:"grid12-12";}}}s:10:"grid-width";a:1:{s:11:"description";s:215:"Change the width of this block. Fluid grid % widths are relative to the parent region''s width. Default widths: sidebar blocks default to the sidebar width; in other regions width is divided equally among all blocks.";}s:16:"fusion-alignment";a:5:{s:5:"title";s:14:"Block position";s:4:"type";s:6:"select";s:11:"description";s:67:"Change the position of this block (default is to float to the left)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:3:{i:1;a:2:{s:5:"label";s:24:"Float block to the right";s:5:"class";s:12:"fusion-right";}i:2;a:2:{s:5:"label";s:28:"Position block in the center";s:5:"class";s:13:"fusion-center";}i:3;a:2:{s:5:"label";s:40:"Clear floats (block drops to a new line)";s:5:"class";s:12:"fusion-clear";}}}s:24:"fusion-content-alignment";a:4:{s:5:"title";s:17:"Content alignment";s:4:"type";s:6:"select";s:11:"description";s:31:"Default is left aligned content";s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:41:"Center align content within its container";s:5:"class";s:21:"fusion-center-content";}i:2;a:2:{s:5:"label";s:40:"Right align content within its container";s:5:"class";s:20:"fusion-right-content";}}}s:21:"fusion-general-styles";a:5:{s:5:"title";s:14:"General styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:50:"These are some generally useful options for blocks";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:4:{i:1;a:2:{s:5:"label";s:142:"<span class="preview-text">Text: large, bold callout style <span class="preview-icon" id="fusion-general-styles-fusion-callout"></span></span>";s:5:"class";s:14:"fusion-callout";}i:2;a:2:{s:5:"label";s:128:"<span class="preview-text">Links: bold all links <span class="preview-icon" id="fusion-general-styles-bold-links"></span></span>";s:5:"class";s:17:"fusion-bold-links";}i:3;a:2:{s:5:"label";s:155:"<span class="preview-text">Padding: add 30px extra padding inside block <span class="preview-icon" id="fusion-general-styles-fusion-padding"></span></span>";s:5:"class";s:14:"fusion-padding";}i:4;a:2:{s:5:"label";s:149:"<span class="preview-text">Border: add 1px border and 10px padding <span class="preview-icon" id="fusion-general-styles-fusion-border"></span></span>";s:5:"class";s:13:"fusion-border";}}}s:20:"fusion-equal-heights";a:6:{s:5:"title";s:13:"Equal heights";s:4:"type";s:10:"checkboxes";s:11:"description";s:39:"Make blocks in a region the same height";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:25:"js/jquery.equalheights.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:190:"<span class="preview-text">Equal heights: equalize the heights of blocks with this style in the same region <span class="preview-icon" id="fusion-general-styles-equal-heights"></span></span>";s:5:"class";s:13:"equal-heights";}}}s:15:"fusion-multicol";a:5:{s:5:"title";s:12:"List columns";s:4:"type";s:6:"select";s:11:"description";s:64:"Put items in lists (menus, list views, etc.) in multiple columns";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:28:"2-column list/menu (50%/50%)";s:5:"class";s:26:"fusion-2-col-list clearfix";}i:2;a:2:{s:5:"label";s:32:"3-column list/menu (33%/33%/33%)";s:5:"class";s:26:"fusion-3-col-list clearfix";}}}s:11:"fusion-menu";a:5:{s:5:"title";s:11:"Menu layout";s:4:"type";s:6:"radios";s:11:"description";s:54:"Different layouts and alignment options for your menus";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:137:"<span class="preview-text">Single line menu with separators <span class="preview-icon" id="fusion-menu-fusion-inline-menu"></span></span>";s:5:"class";s:18:"fusion-inline-menu";}i:2;a:2:{s:5:"label";s:171:"<span class="preview-text">Multi-column menu with bold headers (set menu items to Expanded) <span class="preview-icon" id="fusion-menu-fusion-multicol-menu"></span></span>";s:5:"class";s:29:"fusion-multicol-menu clearfix";}}}s:18:"fusion-list-styles";a:4:{s:5:"title";s:16:"List/menu styles";s:4:"type";s:10:"checkboxes";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:126:"<span class="preview-text">Bottom border (no bullets) <span class="preview-icon" id="list-styles-bottom-border"></span></span>";s:5:"class";s:25:"fusion-list-bottom-border";}i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Extra vertical spacing (no bullets) <span class="preview-icon" id="list-styles-extra-vertical-spacing"></span></span>";s:5:"class";s:28:"fusion-list-vertical-spacing";}}}s:16:"fusion-superfish";a:5:{s:5:"title";s:21:"Superfish menu styles";s:4:"type";s:6:"radios";s:11:"description";s:63:"Superfish dropdown menus (must also set menu items to Expanded)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:1:{i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Vertical menu (for sidebar blocks) <span class="preview-icon" id="fusion-superfish-superfish-vertical"></span></span>";s:5:"class";s:28:"superfish superfish-vertical";}}}s:23:"fusion-float-imagefield";a:5:{s:5:"title";s:21:"Image floating styles";s:4:"type";s:6:"select";s:11:"description";s:90:"These options will float ImageField images in content to the left or right and add margins";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:4:"node";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:21:"Float ImageField left";s:5:"class";s:28:"fusion-float-imagefield-left";}i:2;a:2:{s:5:"label";s:22:"Float ImageField right";s:5:"class";s:29:"fusion-float-imagefield-right";}}}s:12:"fusion-login";a:5:{s:5:"title";s:23:"User login block styles";s:4:"type";s:6:"radios";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:22:"js/jquery.overlabel.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:205:"<span class="preview-text">Horizontal: puts user login block on a single line with label overlays (good for Header Top region) <span class="preview-icon" id="fusion-login-fusion-horiz-login"></span></span>";s:5:"class";s:18:"fusion-horiz-login";}}}}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:10:"screenshot";s:50:"sites/all/themes/fusion/fusion_core/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:5:{s:13:"css/style.css";s:49:"sites/all/themes/fusion/fusion_core/css/style.css";s:18:"css/typography.css";s:54:"sites/all/themes/fusion/fusion_core/css/typography.css";s:17:"css/superfish.css";s:53:"sites/all/themes/fusion/fusion_core/css/superfish.css";s:24:"css/superfish-navbar.css";s:60:"sites/all/themes/fusion/fusion_core/css/superfish-navbar.css";s:26:"css/superfish-vertical.css";s:62:"sites/all/themes/fusion/fusion_core/css/superfish-vertical.css";}}s:7:"scripts";a:7:{s:25:"js/jquery.bgiframe.min.js";s:61:"sites/all/themes/fusion/fusion_core/js/jquery.bgiframe.min.js";s:17:"js/hoverIntent.js";s:53:"sites/all/themes/fusion/fusion_core/js/hoverIntent.js";s:17:"js/supposition.js";s:53:"sites/all/themes/fusion/fusion_core/js/supposition.js";s:15:"js/supersubs.js";s:51:"sites/all/themes/fusion/fusion_core/js/supersubs.js";s:15:"js/superfish.js";s:51:"sites/all/themes/fusion/fusion_core/js/superfish.js";s:16:"js/screenshot.js";s:52:"sites/all/themes/fusion/fusion_core/js/screenshot.js";s:12:"js/script.js";s:48:"sites/all/themes/fusion/fusion_core/js/script.js";}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:11:"fusion_core";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Fusion Core', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/fusion_starter', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:58:"sites/all/themes/fusion/fusion_starter/fusion_starter.info";s:4:"name";s:14:"fusion_starter";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:14:"Fusion Starter";s:11:"description";s:200:"Fusion Starter sub-theme. Requires <a href="http://drupal.org/project/fusion">Fusion Core</a> and the <a href="http://drupal.org/project/skinr">Skinr</a> module to enable easy point-and-click theming.";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:28:"css/fusion-starter-style.css";s:67:"sites/all/themes/fusion/fusion_starter/css/fusion-starter-style.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:2:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:65:"; Sample Skinr style (uncomment to use, see Skinr section in CSS)";}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:7:"scripts";a:1:{s:9:"script.js";s:48:"sites/all/themes/fusion/fusion_starter/script.js";}s:10:"screenshot";s:53:"sites/all/themes/fusion/fusion_starter/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:28:"css/fusion-starter-style.css";s:67:"sites/all/themes/fusion/fusion_starter/css/fusion-starter-style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:11:"fusion_core";}}', 'block_admin_display', 'a:1:{i:0;s:14:"fusion_starter";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Fusion Starter', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/content/node-type/actor/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:5:"actor";}', 31, 5, 'admin/content/node-type/actor', 'admin/content/node-type/actor', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/book/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:4:"book";}', 31, 5, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/company/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:7:"company";}', 31, 5, 'admin/content/node-type/company', 'admin/content/node-type/company', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:5:"movie";}', 31, 5, 'admin/content/node-type/movie', 'admin/content/node-type/movie', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('filefield/ahah/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', 'filefield_edit_access', 'a:1:{i:0;i:3;}', 'filefield_js', 'a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}', 24, 5, '', 'filefield/ahah/%/%/%', '', 't', '', 4, '', '', '', 0, ''),
('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc'),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/settings/date-time/formats/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:30:"date_api_add_date_formats_form";}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Add format', 't', '', 128, '', 'Allow users to add additional date formats.', '', 3, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('admin/build/views/export/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:20:"views_ui_export_page";i:1;i:4;}', 30, 5, '', 'admin/build/views/export/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/clone/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/clone/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/disable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_disable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/disable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/enable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_enable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/enable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/tools/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_admin_convert', 'a:0:{}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Convert', 't', '', 128, '', 'Convert stored Views 1 views.', '', 1, 'sites/all/modules/contrib/views/includes/convert.inc'),
('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/date-time/formats/configure', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:26:"date_api_date_formats_form";}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Configure', 't', '', 136, '', 'Allow users to configure date formats', '', 1, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('admin/settings/date-time/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:32:"date_api_delete_format_type_form";i:1;i:4;}', 30, 5, '', 'admin/settings/date-time/delete/%', 'Delete date format type', 't', '', 4, '', 'Allow users to delete a configured date format type.', '', 0, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, ''),
('admin/build/views/break-lock/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:27:"views_ui_break_lock_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/break-lock/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/delete/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:23:"views_ui_delete_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/delete/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/tools/basic', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Basic', 't', '', 136, '', '', '', -10, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/edit/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/views', 'admin/build/views', 'Edit', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/imagecache/%/delete', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_delete_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/delete', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Delete preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/export', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_export_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/export', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Export preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/imagecache/%/flush', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:16:"flush imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:31:"imagecache_ui_preset_flush_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/flush', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:25:"Flush preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/override', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;i:2;b:1;}', 29, 5, '', 'admin/build/imagecache/%/override', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:28:"Override preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/imagecache/%/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_action_form";i:1;i:3;i:2;i:4;}', 28, 5, '', 'admin/build/imagecache/%/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"!action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/actor/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"actor";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/actor/display', 'admin/content/node-type/actor', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/book/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"book";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/book/display', 'admin/content/node-type/book', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/company/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:7:"company";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/company/display', 'admin/content/node-type/company', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"movie";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/movie/display', 'admin/content/node-type/movie', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/actor/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"actor";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/actor/display', 'admin/content/node-type/actor', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/book/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"book";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/book/display', 'admin/content/node-type/book', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/company/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:7:"company";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/company/display', 'admin/content/node-type/company', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"movie";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/movie/display', 'admin/content/node-type/movie', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/actor/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"actor";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/actor/display', 'admin/content/node-type/actor', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/book/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"book";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/book/display', 'admin/content/node-type/book', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/content/node-type/company/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:7:"company";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/company/display', 'admin/content/node-type/company', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"movie";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/movie/display', 'admin/content/node-type/movie', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/actor/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:5:"actor";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/actor/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/book/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:4:"book";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/book/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/company/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:7:"company";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/company/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/movie/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:5:"movie";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/movie/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/movie/fields/field_cast', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"movie";i:2;s:10:"field_cast";}', 63, 6, 'admin/content/node-type/movie/fields', 'admin/content/node-type/movie', 'Cast', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/node-type/actor/fields/field_gender', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"actor";i:2;s:12:"field_gender";}', 63, 6, 'admin/content/node-type/actor/fields', 'admin/content/node-type/actor', 'Gender', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/actor/fields/field_image_actor', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"actor";i:2;s:17:"field_image_actor";}', 63, 6, 'admin/content/node-type/actor/fields', 'admin/content/node-type/actor', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/company/fields/field_company_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:7:"company";i:2;s:19:"field_company_image";}', 63, 6, 'admin/content/node-type/company/fields', 'admin/content/node-type/company', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"movie";i:2;s:11:"field_image";}', 63, 6, 'admin/content/node-type/movie/fields', 'admin/content/node-type/movie', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_production_company', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"movie";i:2;s:24:"field_production_company";}', 63, 6, 'admin/content/node-type/movie/fields', 'admin/content/node-type/movie', 'Production company', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_release_date', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"movie";i:2;s:18:"field_release_date";}', 63, 6, 'admin/content/node-type/movie/fields', 'admin/content/node-type/movie', 'Release Date', 't', '', 128, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/settings/date-time/formats/delete/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:27:"date_api_delete_format_form";i:1;i:5;}', 62, 6, '', 'admin/settings/date-time/formats/delete/%', 'Delete date format', 't', '', 4, '', 'Allow users to delete a configured date format.', '', 0, 'sites/all/modules/contrib/date/date_api.admin.inc'),
('admin/build/views/%/add-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_display', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/add-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/%/%/%', 'a:3:{i:3;s:16:"views_ui_js_load";i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;i:3;i:1;i:4;i:2;i:5;}', 56, 6, '', 'admin/build/views/%/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/%/analyze/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_analyze_view', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/analyze/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/%/details/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_details', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/details/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/build/views/%/preview/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/preview/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/imagecache/%/add/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:5;N;}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_action_add_page', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/imagecache/%/add/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"Add !actionname to !presetname";i:1;i:3;i:2;i:5;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/%/delete', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:32:"imagecache_ui_action_delete_form";i:1;i:3;i:2;i:4;}', 57, 6, '', 'admin/build/imagecache/%/%/delete', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:37:"Delete !action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/contrib/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/actor/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:5:"actor";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/actor/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/book/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:4:"book";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/book/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/company/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:7:"company";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/company/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/movie/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:5:"movie";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/movie/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/actor/fields/field_gender/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"actor";i:2;s:12:"field_gender";}', 127, 7, '', 'admin/content/node-type/actor/fields/field_gender/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/actor/fields/field_image_actor/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"actor";i:2;s:17:"field_image_actor";}', 127, 7, '', 'admin/content/node-type/actor/fields/field_image_actor/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/company/fields/field_company_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:7:"company";i:2;s:19:"field_company_image";}', 127, 7, '', 'admin/content/node-type/company/fields/field_company_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_cast/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"movie";i:2;s:10:"field_cast";}', 127, 7, '', 'admin/content/node-type/movie/fields/field_cast/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"movie";i:2;s:11:"field_image";}', 127, 7, '', 'admin/content/node-type/movie/fields/field_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_production_company/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"movie";i:2;s:24:"field_production_company";}', 127, 7, '', 'admin/content/node-type/movie/fields/field_production_company/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc'),
('admin/content/node-type/movie/fields/field_release_date/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"movie";i:2;s:18:"field_release_date";}', 127, 7, '', 'admin/content/node-type/movie/fields/field_release_date/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/contrib/cck/includes/content.admin.inc');
/*!40000 ALTER TABLE menu_router ENABLE KEYS */;

--
-- Table structure for table 'node'
--

CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node'
--

/*!40000 ALTER TABLE node DISABLE KEYS */;
INSERT INTO `node` VALUES
(1, 1, 'actor', '', 'Elizabeth Banks', 1, 1, 1267188655, 1267189878, 2, 0, 0, 0, 0, 0),
(2, 2, 'actor', '', 'Seth Rogen', 0, 1, 1267189807, 1267189807, 0, 0, 0, 0, 0, 0),
(3, 3, 'actor', '', 'Kevin Smith', 0, 1, 1267189842, 1267189842, 0, 0, 0, 0, 0, 0),
(4, 4, 'actor', '', 'Jennifer Schwalbach Smith', 0, 1, 1267189999, 1267233808, 0, 0, 0, 0, 0, 0),
(5, 5, 'actor', '', 'Jason Mewes', 0, 1, 1267190029, 1267190029, 0, 0, 0, 0, 0, 0),
(6, 6, 'actor', '', 'Ben Affleck', 0, 1, 1267190080, 1267190080, 0, 0, 0, 0, 0, 0),
(7, 7, 'actor', '', 'Matt Damon', 0, 1, 1267190101, 1267190101, 0, 0, 0, 0, 0, 0),
(8, 8, 'actor', '', 'Christian Ulmen', 0, 1, 1267190459, 1267190459, 0, 0, 0, 0, 0, 0),
(9, 9, 'actor', '', 'Christoph Waltz', 0, 1, 1267190482, 1267190482, 0, 0, 0, 0, 0, 0),
(10, 10, 'movie', '', 'Dogma', 1, 1, 1267231819, 1267294654, 2, 0, 0, 0, 0, 0),
(11, 11, 'actor', '', 'Rosaria Dawson', 1, 1, 1267233728, 1267233728, 2, 0, 0, 0, 0, 0),
(12, 12, 'movie', '', 'Clerks 2', 1, 1, 1267233742, 1267294630, 2, 0, 0, 0, 0, 0),
(13, 13, 'actor', '', 'Brian O''Halloran', 1, 1, 1267264708, 1267264708, 0, 0, 0, 0, 0, 0),
(14, 14, 'actor', '', 'Jeff Anderson', 1, 1, 1267264878, 1267264878, 2, 0, 0, 0, 0, 0),
(15, 15, 'movie', '', 'Clerks', 1, 1, 1267265031, 1267294676, 2, 0, 0, 0, 0, 0),
(16, 16, 'actor', '', 'Mallrats', 1, 1, 1267265274, 1267265274, 2, 0, 0, 0, 0, 0),
(17, 17, 'actor', '', 'Shannen Doherty', 1, 1, 1267265369, 1267265369, 2, 0, 0, 0, 0, 0),
(18, 18, 'actor', '', 'Joey Lauren Adams', 1, 1, 1267265589, 1267265589, 2, 0, 0, 0, 0, 0),
(19, 19, 'actor', '', 'Jason Lee', 1, 1, 1267265706, 1267265706, 2, 0, 0, 0, 0, 0),
(20, 20, 'movie', '', 'Mallrats', 1, 1, 1267265730, 1267294666, 2, 0, 0, 0, 0, 0),
(21, 21, 'movie', '', 'Chasing Amy', 1, 1, 1267265931, 1267294660, 2, 0, 0, 0, 0, 0),
(22, 22, 'actor', '', 'Linda Fiorentino', 1, 1, 1267265986, 1267265986, 2, 0, 0, 0, 0, 0),
(23, 23, 'actor', '', 'Chris Rock', 1, 1, 1267266168, 1267266168, 2, 0, 0, 0, 0, 0),
(24, 24, 'movie', '', 'Jay und Silent Bob schlagen zurück', 1, 1, 1267266247, 1267294645, 2, 0, 0, 0, 0, 0),
(25, 25, 'actor', '', 'Liv Tyler', 1, 1, 1267266620, 1267266620, 2, 0, 0, 0, 0, 0),
(26, 26, 'movie', '', 'Jersey Girl', 1, 1, 1267266776, 1267294638, 2, 0, 0, 0, 0, 0),
(27, 27, 'movie', '', 'Zack and Miri Make a Porno', 1, 1, 1267267331, 1267294577, 2, 0, 0, 0, 0, 0),
(28, 28, 'movie', '', 'Herr Lehmann', 1, 1, 1267267471, 1267294512, 2, 0, 0, 0, 0, 0),
(29, 29, 'actor', '', 'Brad Pitt', 1, 1, 1267267587, 1267267587, 2, 0, 0, 0, 0, 0),
(30, 30, 'actor', '', 'George Clooney', 1, 1, 1267267637, 1267267637, 2, 0, 0, 0, 0, 0),
(31, 31, 'movie', '', 'Inglorious Basterds', 1, 1, 1267267817, 1267267817, 2, 0, 0, 0, 0, 0),
(35, 35, 'book', '', 'Willkommen beim Views Workshop für Anfänger', 1, 1, 1267276459, 1273396036, 2, 0, 0, 0, 0, 0),
(33, 33, 'actor', '', 'John Malkovich', 1, 1, 1267269884, 1267269884, 2, 0, 0, 0, 0, 0),
(34, 34, 'movie', '', 'Burn After Reading', 1, 1, 1267270028, 1267294702, 2, 0, 0, 0, 0, 0),
(37, 37, 'company', '', 'Working Title Films', 1, 1, 1267294116, 1267294116, 2, 1, 0, 0, 0, 0),
(38, 38, 'company', '', 'View Askew Productions', 1, 1, 1267294194, 1267294194, 2, 1, 0, 0, 0, 0),
(39, 39, 'company', '', 'Boje Buck Produktion', 1, 1, 1267294382, 1267294382, 2, 1, 0, 0, 0, 0),
(40, 40, 'company', '', 'The Weinstein Company', 1, 1, 1267294788, 1267294788, 2, 1, 0, 0, 0, 0);
/*!40000 ALTER TABLE node ENABLE KEYS */;

--
-- Table structure for table 'node_access'
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node_access'
--

/*!40000 ALTER TABLE node_access DISABLE KEYS */;
INSERT INTO `node_access` VALUES
(0, 0, 'all', 1, 0, 0);
/*!40000 ALTER TABLE node_access ENABLE KEYS */;

--
-- Table structure for table 'node_comment_statistics'
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node_comment_statistics'
--

/*!40000 ALTER TABLE node_comment_statistics DISABLE KEYS */;
INSERT INTO `node_comment_statistics` VALUES
(1, 1267188655, NULL, 1, 0),
(2, 1267189807, NULL, 0, 0),
(3, 1267189842, NULL, 0, 0),
(4, 1267189999, NULL, 0, 0),
(5, 1267190029, NULL, 0, 0),
(6, 1267190080, NULL, 0, 0),
(7, 1267190101, NULL, 0, 0),
(8, 1267190459, NULL, 0, 0),
(9, 1267190482, NULL, 0, 0),
(10, 1267231819, NULL, 1, 0),
(11, 1267233728, NULL, 1, 0),
(12, 1267233742, NULL, 1, 0),
(13, 1267264708, NULL, 1, 0),
(14, 1267264878, NULL, 1, 0),
(15, 1267265031, NULL, 1, 0),
(16, 1267265274, NULL, 1, 0),
(17, 1267265369, NULL, 1, 0),
(18, 1267265589, NULL, 1, 0),
(19, 1267265706, NULL, 1, 0),
(20, 1267265730, NULL, 1, 0),
(21, 1267265931, NULL, 1, 0),
(22, 1267265986, NULL, 1, 0),
(23, 1267266168, NULL, 1, 0),
(24, 1267266247, NULL, 1, 0),
(25, 1267266620, NULL, 1, 0),
(26, 1267266776, NULL, 1, 0),
(27, 1267267331, NULL, 1, 0),
(28, 1267267471, NULL, 1, 0),
(29, 1267267587, NULL, 1, 0),
(30, 1267267637, NULL, 1, 0),
(31, 1267267817, NULL, 1, 0),
(35, 1267276459, NULL, 1, 0),
(33, 1267269884, NULL, 1, 0),
(34, 1267270028, NULL, 1, 0),
(37, 1267294116, NULL, 1, 0),
(38, 1267294194, NULL, 1, 0),
(39, 1267294382, NULL, 1, 0),
(40, 1267294788, NULL, 1, 0);
/*!40000 ALTER TABLE node_comment_statistics ENABLE KEYS */;

--
-- Table structure for table 'node_counter'
--

CREATE TABLE IF NOT EXISTS `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node_counter'
--

/*!40000 ALTER TABLE node_counter DISABLE KEYS */;
/*!40000 ALTER TABLE node_counter ENABLE KEYS */;

--
-- Table structure for table 'node_revisions'
--

CREATE TABLE IF NOT EXISTS `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node_revisions'
--

/*!40000 ALTER TABLE node_revisions DISABLE KEYS */;
INSERT INTO `node_revisions` VALUES
(1, 1, 1, 'Elizabeth Banks', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267189878, 1),
(2, 2, 1, 'Seth Rogen', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267189807, 0),
(3, 3, 1, 'Kevin Smith', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267189842, 0),
(4, 4, 1, 'Jennifer Schwalbach Smith', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267233808, 1),
(5, 5, 1, 'Jason Mewes', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267190029, 0),
(6, 6, 1, 'Ben Affleck', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267190080, 0),
(7, 7, 1, 'Matt Damon', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267190101, 0),
(8, 8, 1, 'Christian Ulmen', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267190459, 0),
(9, 9, 1, 'Christoph Waltz', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken. Wenn das liebe Tal um mich dampft, und die hohe Sonne an der Oberfläche der undurchdringlichen Finsternis meines Waldes ruht, und nur einzelne Strahlen sich in das innere Heiligtum stehlen, ich dann im hohen Grase am fallenden Bache liege, und näher an der Erde tausend mannigfaltige Gräschen mir merkwürdig werden; wenn ich das Wimmeln der kleinen Welt zwischen Halmen, die unzähligen, unergründlichen Gestalten der Würmchen, der Mückchen näher an meinem Herzen fühle, und fühle die Gegenwart des Allmächtigen, der uns nach seinem Bilde schuf, das Wehen des Alliebenden, der uns in ewiger Wonne schwebend trägt und erhält; mein Freund! Wenn''s dann um meine Augen dämmert, und die Welt um mich her und der Himmel ganz in meiner Seele ruhn wie die Gestalt einer ', 'Eine wunderbare Heiterkeit hat meine ganze Seele eingenommen, gleich den süßen Frühlingsmorgen, die ich mit ganzem Herzen genieße. Ich bin allein und freue mich meines Lebens in dieser Gegend, die für solche Seelen geschaffen ist wie die meine. Ich bin so glücklich, mein Bester, so ganz in dem Gefühle von ruhigem Dasein versunken, daß meine Kunst darunter leidet. Ich könnte jetzt nicht zeichnen, nicht einen Strich, und bin nie ein größerer Maler gewesen als in diesen Augenblicken.', '', 1267190482, 0),
(10, 10, 1, 'Dogma', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', '', 1267294654, 1),
(11, 11, 1, 'Rosaria Dawson', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', '', 1267233728, 1),
(12, 12, 1, 'Clerks 2', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', 'Melior huic scisco vel abbas quia haero ymo vindico. Ullamcorper et neque wisi quibus quidne quis damnum euismod. Iustum antehabeo occuro diam utrum importunus amet nimis defui.Gravis quia uxor virtus quidem commodo immitto modo. Distineo letalis gravis tamen persto acsi capto et neque jumentum. Paratus dolus in hos autem ulciscor. Aptent pagus augue ludus vulpes dolore. Ludus refoveo sagaciter ibidem iusto volutpat odio imputo et.', '', 1267294630, 1),
(13, 13, 1, 'Brian O''Halloran', '', '', '', 1267264708, 1),
(14, 14, 1, 'Jeff Anderson', '', '', '', 1267264878, 1),
(15, 15, 1, 'Clerks', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.', '', 1267294676, 1),
(16, 16, 1, 'Mallrats', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.', '', 1267265274, 1),
(17, 17, 1, 'Shannen Doherty', '', '', '', 1267265369, 1),
(18, 18, 1, 'Joey Lauren Adams', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.', '', 1267265589, 1),
(19, 19, 1, 'Jason Lee', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.', '', 1267265706, 1),
(20, 20, 1, 'Mallrats', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.', '', 1267294666, 1),
(21, 21, 1, 'Chasing Amy', 'Jemand musste Josef K. verleumdet haben, denn ohne dass er etwas Böses getan hätte, wurde er eines Morgens verhaftet. »Wie ein Hund! « sagte er, es war, als sollte die Scham ihn überleben. Als Gregor Samsa eines Morgens aus unruhigen Träumen erwachte, fand er sich in seinem Bett zu einem ungeheueren Ungeziefer verwandelt. Und es war ihnen wie eine Bestätigung ihrer neuen Träume und guten Absichten, als am Ziele ihrer Fahrt die Tochter als erste sich erhob und ihren jungen Körper dehnte. »Es ist ein eigentümlicher Apparat«, sagte der Offizier zu dem Forschungsreisenden und überblickte mit einem gewissermaßen bewundernden Blick den ihm doch wohlbekannten Apparat. Sie hätten noch ins Boot springen können, aber der Reisende hob ein schweres, geknotetes Tau vom Boden, drohte ihnen damit und hielt sie dadurch von dem Sprunge ab. In den letzten Jahrzehnten ist das Interesse an Hungerkünstlern sehr zurückgegangen. Aber sie überwanden sich, umdrängten den Käfig und wollten sich gar nicht fortrühren. Jemand musste Josef K. verleumdet haben, denn ohne dass er etwas Böses getan hätte, wurde er eines Morgens verhaftet. »Wie ein Hund! « sagte er, es war, als sollte die Scham ihn überleben. Als Gregor Samsa eines Morgens aus unruhigen Träumen erwachte, fand er sich ', 'Jemand musste Josef K. verleumdet haben, denn ohne dass er etwas Böses getan hätte, wurde er eines Morgens verhaftet. »Wie ein Hund! « sagte er, es war, als sollte die Scham ihn überleben. Als Gregor Samsa eines Morgens aus unruhigen Träumen erwachte, fand er sich in seinem Bett zu einem ungeheueren Ungeziefer verwandelt. Und es war ihnen wie eine Bestätigung ihrer neuen Träume und guten Absichten, als am Ziele ihrer Fahrt die Tochter als erste sich erhob und ihren jungen Körper dehnte.', '', 1267294660, 1),
(22, 22, 1, 'Linda Fiorentino', 'r hörte leise Schritte hinter sich. Das bedeutete nichts Gutes. Wer würde ihm schon folgen, spät in der Nacht und dazu noch in dieser engen Gasse mitten im übel beleumundeten Hafenviertel? Gerade jetzt, wo er das Ding seines Lebens gedreht hatte und mit der Beute verschwinden wollte! Hatte einer seiner zahllosen Kollegen dieselbe Idee gehabt, ihn beobachtet und abgewartet, um ihn nun um die Früchte seiner Arbeit zu erleichtern? Oder gehörten die Schritte hinter ihm zu einem der unzähligen Gesetzeshüter dieser Stadt, und die stählerne Acht um seine Handgelenke würde gleich zuschnappen? Er konnte die Aufforderung stehen zu bleiben schon hören. Gehetzt sah er sich um. Plötzlich erblickte er den schmalen Durchgang. Blitzartig drehte er sich nach rechts und verschwand zwischen den beiden Gebäuden. Beinahe wäre er dabei über den umgestürzten Mülleimer gefallen, der mitten im Weg lag. Er versuchte, sich in der Dunkelheit seinen Weg zu ertasten und erstarrte: Anscheinend gab es kein', 'r hörte leise Schritte hinter sich. Das bedeutete nichts Gutes. Wer würde ihm schon folgen, spät in der Nacht und dazu noch in dieser engen Gasse mitten im übel beleumundeten Hafenviertel? Gerade jetzt, wo er das Ding seines Lebens gedreht hatte und mit der Beute verschwinden wollte! Hatte einer seiner zahllosen Kollegen dieselbe Idee gehabt, ihn beobachtet und abgewartet, um ihn nun um die Früchte seiner Arbeit zu erleichtern? Oder gehörten die Schritte hinter ihm zu einem der unzähligen Gesetzeshüter dieser Stadt, und die stählerne Acht um seine Handgelenke würde gleich zuschnappen?', '', 1267265986, 1),
(23, 23, 1, 'Chris Rock', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fi', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt.', '', 1267266168, 1),
(24, 24, 1, 'Jay und Silent Bob schlagen zurück', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fi', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt.', '', 1267294645, 1),
(25, 25, 1, 'Liv Tyler', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fi', 'Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt. Franz jagt im komplett verwahrlosten Taxi quer durch Bayern. Zwölf Boxkämpfer jagen Viktor quer über den großen Sylter Deich. Vogel Quax zwickt Johnys Pferd Bim. Sylvia wagt quick den Jux bei Pforzheim. Polyfon zwitschernd aßen Mäxchens Vögel Rüben, Joghurt und Quark. "Fix, Schwyz! " quäkt Jürgen blöd vom Paß. Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich. Falsches Üben von Xylophonmusik quält jeden größeren Zwerg. Heizölrückstoßabdämpfung. Zwei flinke Boxer jagen die quirlige Eva und ihren Mops durch Sylt.', '', 1267266620, 1),
(26, 26, 1, 'Jersey Girl', 'Forget about who you thought you were, and just accept who you are.\r\n\r\nOllie Trinkie is a publicist, who has a great girlfriend, Gertrude, whom he marries and they are expecting a baby but while he is looking forward to being a father, he doesn''t lighten his workload. Gertrude gives birth but dies in the process. Ollie doesn''t live up to his responsibilities as a father. Eventually the strain and pressure of losing his wife and being a father gets to him and he has breakdown, which leads to his termination. So with nothing much to do he tries to be good father to his daughter, Gertie. He also meets a young woman name Maya, who likes him but he is still not over his wife. Written by rcs0411@yahoo.com\r\n\r\nIn New York, the young executive Oliver "Ollie" Trinke is a successful PR of the music industry. He meets and falls in love for Gertrude Steiney, who soon gets pregnant. However, she dies in the childbirth and Ollie decides to return to his father''s home in New Jersey. Pressed by the situation of lonely father, the workaholic Ollie blows-up in an important press conference and makes a fatal statement, losing his job and becoming blacklisted in his publicist career. He promises to be the "best father in the world" to the young Gertie, and stays single, grieving his beloved wife, without dating any woman for seven years and trying to retrieve a position of public relation. One day, he meets the rental clerk Maya, they become friends and she helps him to supersede his past life. Written by Claudio Carvalho, Rio de Janeiro, Brazil\r\n\r\nWhen a work-a-holic man becomes a father and loses his wife in one fell swoop, he does what any man would do, he pawns the kid off on his father and buries himself in his work. But when his father decides that it''s time that he shoulder his responsibilities, he learns what it means to be a dad. Written by Eric Samuel Labuda\r\n\r\nOllie Trinke is expecting a baby with his new wife, Gertrude. When the baby arrives, Gertrude has an aneurysm and passes away after the birth of their new baby daughter Gertrude "Gerti" Trinke. He is forced to live with his father while raising little Gerti. After Gertrude''s death, problems occur with Ollie at his job. After getting fired, Ollie''s life changes after he meets a video store clerk and Gerti''s life is struggling while her father is at a new job. Then later, Ollie learns that your family matters more to you in life. Written by Jacob Sanchez\r\n\r\nOllie is a big time publicist in New York, with his wife Gertie, who is expecting a baby. During the birth of her daughter, Gertie dies and Ollie finds himself in a state of anger and depression. Who continues to keep plugging away at his job but after saying some things at a Will Smith appearance he is fired and ends up living with his father Ollie Sr. Written by MVanGTO17@hotmail.com\r\n\r\nOllie is a top of his game N.Y publicist. He has a perfect life with a beautiful wife and a baby on the way. Suddenly things go astray and Ollie finds himself jobless and a single father. He''s forced to move in with his father. Things start to look up for him when he meets another great girl and her daughter and learns that life sometimes throws you a few different directions and you can''t choose the path you''re given. Written by Movie Jungle - Peter Dimako\r\n\r\n', 'Forget about who you thought you were, and just accept who you are.\r\n\r', '', 1267294638, 1),
(27, 27, 1, 'Zack and Miri Make a Porno', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. S', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden.', '', 1267294577, 1),
(28, 28, 1, 'Herr Lehmann', 'Erfolgreiche Kreuzberger Komödie nach dem Debütroman von Sven Regener.\r\n\r\nhinzufügengesamte crew\r\n', 'Erfolgreiche Kreuzberger Komödie nach dem Debütroman von Sven Regener.\r\n\r\nhinzufügengesamte crew\r\n', '', 1267294512, 1),
(29, 29, 1, 'Brad Pitt', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. S', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden.', '', 1267267587, 1),
(30, 30, 1, 'George Clooney', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. S', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden.', '', 1267267637, 1),
(31, 31, 1, 'Inglorious Basterds', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. S', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden.', '', 1267267817, 1),
(35, 35, 1, 'Willkommen beim Views Workshop für Anfänger', 'Mit dieser Installation kann der Inhalt der <a href="http://www.drupal-dev-days.de/de/sessions/views-2-workshop-f%C3%BCr-anf%C3%A4nger">Session von den Drupal Dev Days in München</a> mit- und nachgearbeitet werden.\r\n\r\nDer User#1 hat folgende Login Daten\r\nBenutzername: admin\r\nPasswort: drupaldevdays\r\n\r\nDie Aufgaben zum Workshop finden sich im Anhang als PDF.\r\n\r\nUnter <a href="/admin/build/modules">admin/build/modules</a> (Bereich: Features) können die Views zu den einzelnen Aufgaben (a1, m1, s1 ,....) einzeln per Modul aktiviert werden.\r\n\r\n\r\n\r\n\r\n', 'Mit dieser Installation kann der Inhalt der <a href="http://www.drupal-dev-days.de/de/sessions/views-2-workshop-f%C3%BCr-anf%C3%A4nger">Session von den Drupal Dev Days in München</a> mit- und nachgearbeitet werden.\r\n\r\nDer User#1 hat folgende Login Daten\r\nBenutzername: admin\r\nPasswort: drupaldevdays\r\n\r\nDie Aufgaben zum Workshop finden sich im Anhang als PDF.\r\n\r\nUnter <a href="/admin/build/modules">admin/build/modules</a> (Bereich: Features) können die Views zu den einzelnen Aufgaben (a1, m1, s1 ,....) einzeln per Modul aktiviert werden.\r\n\r\n\r\n\r\n\r\n', '', 1273396036, 1),
(33, 33, 1, 'John Malkovich', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden. Und weil Sie nun schon die Güte haben, mich ein paar weitere Sätze lang zu begleiten, möchte ich diese Gelegenheit nutzen, Ihnen nicht nur als Lückenfüller zu dienen, sondern auf etwas hinzuweisen, das es ebenso verdient wahrgenommen zu werden: Webstandards nämlich. Sehen Sie, Webstandards sind das Regelwerk, auf dem Webseiten aufbauen. S', 'Überall dieselbe alte Leier. Das Layout ist fertig, der Text lässt auf sich warten. Damit das Layout nun nicht nackt im Raume steht und sich klein und leer vorkommt, springe ich ein: der Blindtext. Genau zu diesem Zwecke erschaffen, immer im Schatten meines großen Bruders »Lorem Ipsum«, freue ich mich jedes Mal, wenn Sie ein paar Zeilen lesen. Denn esse est percipi - Sein ist wahrgenommen werden.', '', 1267269884, 1),
(34, 34, 1, 'Burn After Reading', 'Osbourne Cox, a Balkan expert, is fired at the CIA, so he begins a memoir. His wife wants a divorce and expects her lover, Harry, a philandering State Department marshal, to leave his wife. A diskette falls out of a gym bag at a Georgetown fitness center. Two employees there try to turn it into cash: Linda, who wants money for elective surgery, and Chad, an amiable goof. Information on the disc leads them to Osbourne who rejects their sales pitch; then they visit the Russian embassy. To sweeten the pot, they decide they need more of Osbourne''s secrets. Meanwhile, Linda''s boss likes her, and Harry''s wife leaves for a book tour. All roads lead to Osbourne''s house. Written by {jhailey@hotmail.com}', 'Osbourne Cox, a Balkan expert, is fired at the CIA, so he begins a memoir. His wife wants a divorce and expects her lover, Harry, a philandering State Department marshal, to leave his wife. A diskette falls out of a gym bag at a Georgetown fitness center. Two employees there try to turn it into cash: Linda, who wants money for elective surgery, and Chad, an amiable goof. Information on the disc leads them to Osbourne who rejects their sales pitch; then they visit the Russian embassy. To sweeten the pot, they decide they need more of Osbourne''s secrets.', '', 1267294702, 1),
(37, 37, 1, 'Working Title Films', '', '', '', 1267294116, 1),
(38, 38, 1, 'View Askew Productions', '', '', '', 1267294194, 1),
(39, 39, 1, 'Boje Buck Produktion', '', '', '', 1267294382, 1),
(40, 40, 1, 'The Weinstein Company', '', '', '', 1267294788, 1);
/*!40000 ALTER TABLE node_revisions ENABLE KEYS */;

--
-- Table structure for table 'node_type'
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'node_type'
--

/*!40000 ALTER TABLE node_type DISABLE KEYS */;
INSERT INTO `node_type` VALUES
('company', 'Company', 'node', 'a production company', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, ''),
('movie', 'Movie', 'node', '', '', 1, 'Title', 1, 'Description', 0, 1, 1, 0, ''),
('actor', 'Actor', 'node', '', '', 1, 'Name', 1, 'Bio', 0, 1, 1, 0, ''),
('book', 'Book page', 'node', 'A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'book');
/*!40000 ALTER TABLE node_type ENABLE KEYS */;

--
-- Table structure for table 'permission'
--

CREATE TABLE IF NOT EXISTS `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'permission'
--

/*!40000 ALTER TABLE permission DISABLE KEYS */;
INSERT INTO `permission` VALUES
(1, 1, 'access content', 0),
(2, 2, 'access comments, access content, post comments, post comments without approval', 0);
/*!40000 ALTER TABLE permission ENABLE KEYS */;

--
-- Table structure for table 'role'
--

CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'role'
--

/*!40000 ALTER TABLE role DISABLE KEYS */;
INSERT INTO `role` VALUES
(1, 'anonymous user'),
(2, 'authenticated user');
/*!40000 ALTER TABLE role ENABLE KEYS */;

--
-- Table structure for table 'semaphore'
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'semaphore'
--

/*!40000 ALTER TABLE semaphore DISABLE KEYS */;
/*!40000 ALTER TABLE semaphore ENABLE KEYS */;

--
-- Table structure for table 'sessions'
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'sessions'
--

/*!40000 ALTER TABLE sessions DISABLE KEYS */;
INSERT INTO `sessions` VALUES
(1, 'db28727cda1c24ee8ccdd28401510a47', '127.0.0.1', 1273334363, 0, ''),
(1, 'e0ff66ed576bd02dc659b9c1dc548ec6', '127.0.0.1', 1273396780, 0, 'user_overview_filter|a:0:{}'),
(1, 'c9831a582d2b5bd16545663f8aaa6978', '127.0.0.1', 1273334363, 0, ''),
(1, '748177294855c183c1248f0ba42321c2', '127.0.0.1', 1273334411, 0, ''),
(1, '25660a8e18cbaa18a9b375fc72201c00', '127.0.0.1', 1273334411, 0, '');
/*!40000 ALTER TABLE sessions ENABLE KEYS */;

--
-- Table structure for table 'system'
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'system'
--

/*!40000 ALTER TABLE system DISABLE KEYS */;
INSERT INTO `system` VALUES
('sites/all/themes/acquia_prosper/acquia_prosper.info', 'acquia_prosper', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:16:{s:4:"name";s:14:"Acquia Prosper";s:11:"description";s:385:"<a href="http://www.acquia.com">Acquia''s</a> Prosper is grid-enabled and designed for <a href="http://www.ubercart.org">Ubercart</a> e-commerce. It uses the <a href="http://drupal.org/project/fusion">Fusion Core</a> base theme and <a href="http://drupal.org/project/skinr">Skinr</a> module for easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:28:"css/acquia-prosper-style.css";s:60:"sites/all/themes/acquia_prosper/css/acquia-prosper-style.css";s:26:"design_packs/gray/gray.css";s:58:"sites/all/themes/acquia_prosper/design_packs/gray/gray.css";}}s:7:"scripts";a:2:{s:19:"js/jquery.corner.js";s:51:"sites/all/themes/acquia_prosper/js/jquery.corner.js";s:27:"js/acquia-prosper-script.js";s:59:"sites/all/themes/acquia_prosper/js/acquia-prosper-script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:8:"fluid-95";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:5:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:16:"; Prosper styles";s:22:"prosper-general-styles";a:4:{s:5:"title";s:37:"Acquia Prosper - general theme styles";s:4:"type";s:6:"radios";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:10:{i:1;a:2:{s:5:"label";s:48:"Gray rounded title background, plain white block";s:5:"class";s:48:"prosper-gray-rounded-plain prosper-rounded-title";}i:2;a:2:{s:5:"label";s:43:"Gray rounded title background, list styling";s:5:"class";s:48:"prosper-gray-rounded-style prosper-rounded-title";}i:3;a:2:{s:5:"label";s:30:"Rounded corner dark background";s:5:"class";s:33:"prosper-grayborder-darkbackground";}i:4;a:2:{s:5:"label";s:32:"Light gray background and border";s:5:"class";s:34:"prosper-lightgraybackground-border";}i:5;a:2:{s:5:"label";s:41:"Medium gray background with bottom border";s:5:"class";s:41:"prosper-mediumgraybackground-bottomborder";}i:6;a:2:{s:5:"label";s:49:"Gradient background with padding and thick border";s:5:"class";s:23:"prosper-gradient-border";}i:7;a:2:{s:5:"label";s:9:"Menu list";s:5:"class";s:17:"prosper-menu-list";}i:8;a:2:{s:5:"label";s:32:"Shopping cart - Light background";s:5:"class";s:26:"prosper-shoppingcart-light";}i:9;a:2:{s:5:"label";s:31:"Shopping cart - Dark background";s:5:"class";s:25:"prosper-shoppingcart-dark";}i:10;a:2:{s:5:"label";s:50:"Tabbed block - also set Quicktabs style to Default";s:5:"class";s:17:"prosper-quicktabs";}}}s:16:"prosper-comments";a:4:{s:5:"title";s:30:"Acquia Prosper: comment styles";s:4:"type";s:6:"radios";s:8:"features";a:1:{i:0;s:15:"comment_wrapper";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:43:"Simple with white background and separators";s:5:"class";s:22:"prosper-comments-clean";}i:2;a:2:{s:5:"label";s:32:"Speech bubbles with pointed edge";s:5:"class";s:21:"prosper-comments-edgy";}}}s:21:"prosper-common-styles";a:4:{s:5:"title";s:36:"Acquia Prosper - common theme styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:68:"Acquia Prosper''s styles for blocks, panels, views, and content types";s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:24:"Gray border around image";s:5:"class";s:25:"prosper-gray-border-image";}}}}s:7:"version";s:13:"6.x-1.0-beta4";s:7:"project";s:14:"acquia_prosper";s:9:"datestamp";s:10:"1263168904";s:10:"screenshot";s:46:"sites/all/themes/acquia_prosper/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/fusion/fusion_core/fusion_core.info', 'fusion_core', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:15:{s:4:"name";s:11:"Fusion Core";s:11:"description";s:287:"<a href="http://drupal.org/project/fusion">Fusion Core</a> is the grid-enabled base theme for powerful sub-themes.  With the <a href="http://drupal.org/project/skinr">Skinr</a> module, it enables easy point-and-click theming. By <a href="http://www.topnotchthemes.com">TopNotchThemes</a>";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:5:{s:13:"css/style.css";s:49:"sites/all/themes/fusion/fusion_core/css/style.css";s:18:"css/typography.css";s:54:"sites/all/themes/fusion/fusion_core/css/typography.css";s:17:"css/superfish.css";s:53:"sites/all/themes/fusion/fusion_core/css/superfish.css";s:24:"css/superfish-navbar.css";s:60:"sites/all/themes/fusion/fusion_core/css/superfish-navbar.css";s:26:"css/superfish-vertical.css";s:62:"sites/all/themes/fusion/fusion_core/css/superfish-vertical.css";}}s:7:"scripts";a:7:{s:25:"js/jquery.bgiframe.min.js";s:61:"sites/all/themes/fusion/fusion_core/js/jquery.bgiframe.min.js";s:17:"js/hoverIntent.js";s:53:"sites/all/themes/fusion/fusion_core/js/hoverIntent.js";s:17:"js/supposition.js";s:53:"sites/all/themes/fusion/fusion_core/js/supposition.js";s:15:"js/supersubs.js";s:51:"sites/all/themes/fusion/fusion_core/js/supersubs.js";s:15:"js/superfish.js";s:51:"sites/all/themes/fusion/fusion_core/js/superfish.js";s:16:"js/screenshot.js";s:52:"sites/all/themes/fusion/fusion_core/js/screenshot.js";s:12:"js/script.js";s:48:"sites/all/themes/fusion/fusion_core/js/script.js";}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:4:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";i:2;s:10:"grid12-960";i:3;s:12:"grid12-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-13";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:13:{s:12:"grid16-width";a:4:{s:5:"title";s:22:"Width (16 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:16:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (60px/6.25%)";s:5:"class";s:8:"grid16-1";}i:2;a:2:{s:5:"label";s:26:"2 units wide (120px/12.5%)";s:5:"class";s:8:"grid16-2";}i:3;a:2:{s:5:"label";s:27:"3 units wide (180px/18.75%)";s:5:"class";s:8:"grid16-3";}i:4;a:2:{s:5:"label";s:24:"4 units wide (240px/25%)";s:5:"class";s:8:"grid16-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (300px/31.25%)";s:5:"class";s:8:"grid16-5";}i:6;a:2:{s:5:"label";s:26:"6 units wide (360px/37.5%)";s:5:"class";s:8:"grid16-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (420px/43.75%)";s:5:"class";s:8:"grid16-7";}i:8;a:2:{s:5:"label";s:24:"8 units wide (480px/50%)";s:5:"class";s:8:"grid16-8";}i:9;a:2:{s:5:"label";s:27:"9 units wide (540px/56.25%)";s:5:"class";s:8:"grid16-9";}i:10;a:2:{s:5:"label";s:27:"10 units wide (600px/62.5%)";s:5:"class";s:9:"grid16-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (660px/68.75%)";s:5:"class";s:9:"grid16-11";}i:12;a:2:{s:5:"label";s:25:"12 units wide (720px/75%)";s:5:"class";s:9:"grid16-12";}i:13;a:2:{s:5:"label";s:28:"13 units wide (780px/81.25%)";s:5:"class";s:9:"grid16-13";}i:14;a:2:{s:5:"label";s:27:"14 units wide (840px/87.5%)";s:5:"class";s:9:"grid16-14";}i:15;a:2:{s:5:"label";s:28:"15 units wide (900px/93.75%)";s:5:"class";s:9:"grid16-15";}i:16;a:2:{s:5:"label";s:26:"16 units wide (960px/100%)";s:5:"class";s:9:"grid16-16";}}}s:12:"grid12-width";a:4:{s:5:"title";s:22:"Width (12 column grid)";s:4:"type";s:6:"select";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:12:{i:1;a:2:{s:5:"label";s:24:"1 unit wide (80px/8.33%)";s:5:"class";s:8:"grid12-1";}i:2;a:2:{s:5:"label";s:27:"2 units wide (160px/16.67%)";s:5:"class";s:8:"grid12-2";}i:3;a:2:{s:5:"label";s:24:"3 units wide (240px/25%)";s:5:"class";s:8:"grid12-3";}i:4;a:2:{s:5:"label";s:27:"4 units wide (320px/33.33%)";s:5:"class";s:8:"grid12-4";}i:5;a:2:{s:5:"label";s:27:"5 units wide (400px/41.67%)";s:5:"class";s:8:"grid12-5";}i:6;a:2:{s:5:"label";s:24:"6 units wide (480px/50%)";s:5:"class";s:8:"grid12-6";}i:7;a:2:{s:5:"label";s:27:"7 units wide (560px/58.33%)";s:5:"class";s:8:"grid12-7";}i:8;a:2:{s:5:"label";s:27:"8 units wide (640px/66.67%)";s:5:"class";s:8:"grid12-8";}i:9;a:2:{s:5:"label";s:24:"9 units wide (720px/75%)";s:5:"class";s:8:"grid12-9";}i:10;a:2:{s:5:"label";s:28:"10 units wide (800px/83.33%)";s:5:"class";s:9:"grid12-10";}i:11;a:2:{s:5:"label";s:28:"11 units wide (680px/91.67%)";s:5:"class";s:9:"grid12-11";}i:12;a:2:{s:5:"label";s:26:"12 units wide (960px/100%)";s:5:"class";s:9:"grid12-12";}}}s:10:"grid-width";a:1:{s:11:"description";s:215:"Change the width of this block. Fluid grid % widths are relative to the parent region''s width. Default widths: sidebar blocks default to the sidebar width; in other regions width is divided equally among all blocks.";}s:16:"fusion-alignment";a:5:{s:5:"title";s:14:"Block position";s:4:"type";s:6:"select";s:11:"description";s:67:"Change the position of this block (default is to float to the left)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:3:{i:1;a:2:{s:5:"label";s:24:"Float block to the right";s:5:"class";s:12:"fusion-right";}i:2;a:2:{s:5:"label";s:28:"Position block in the center";s:5:"class";s:13:"fusion-center";}i:3;a:2:{s:5:"label";s:40:"Clear floats (block drops to a new line)";s:5:"class";s:12:"fusion-clear";}}}s:24:"fusion-content-alignment";a:4:{s:5:"title";s:17:"Content alignment";s:4:"type";s:6:"select";s:11:"description";s:31:"Default is left aligned content";s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:41:"Center align content within its container";s:5:"class";s:21:"fusion-center-content";}i:2;a:2:{s:5:"label";s:40:"Right align content within its container";s:5:"class";s:20:"fusion-right-content";}}}s:21:"fusion-general-styles";a:5:{s:5:"title";s:14:"General styles";s:4:"type";s:10:"checkboxes";s:11:"description";s:50:"These are some generally useful options for blocks";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:4:{i:1;a:2:{s:5:"label";s:142:"<span class="preview-text">Text: large, bold callout style <span class="preview-icon" id="fusion-general-styles-fusion-callout"></span></span>";s:5:"class";s:14:"fusion-callout";}i:2;a:2:{s:5:"label";s:128:"<span class="preview-text">Links: bold all links <span class="preview-icon" id="fusion-general-styles-bold-links"></span></span>";s:5:"class";s:17:"fusion-bold-links";}i:3;a:2:{s:5:"label";s:155:"<span class="preview-text">Padding: add 30px extra padding inside block <span class="preview-icon" id="fusion-general-styles-fusion-padding"></span></span>";s:5:"class";s:14:"fusion-padding";}i:4;a:2:{s:5:"label";s:149:"<span class="preview-text">Border: add 1px border and 10px padding <span class="preview-icon" id="fusion-general-styles-fusion-border"></span></span>";s:5:"class";s:13:"fusion-border";}}}s:20:"fusion-equal-heights";a:6:{s:5:"title";s:13:"Equal heights";s:4:"type";s:10:"checkboxes";s:11:"description";s:39:"Make blocks in a region the same height";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:25:"js/jquery.equalheights.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:190:"<span class="preview-text">Equal heights: equalize the heights of blocks with this style in the same region <span class="preview-icon" id="fusion-general-styles-equal-heights"></span></span>";s:5:"class";s:13:"equal-heights";}}}s:15:"fusion-multicol";a:5:{s:5:"title";s:12:"List columns";s:4:"type";s:6:"select";s:11:"description";s:64:"Put items in lists (menus, list views, etc.) in multiple columns";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:28:"2-column list/menu (50%/50%)";s:5:"class";s:26:"fusion-2-col-list clearfix";}i:2;a:2:{s:5:"label";s:32:"3-column list/menu (33%/33%/33%)";s:5:"class";s:26:"fusion-3-col-list clearfix";}}}s:11:"fusion-menu";a:5:{s:5:"title";s:11:"Menu layout";s:4:"type";s:6:"radios";s:11:"description";s:54:"Different layouts and alignment options for your menus";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:137:"<span class="preview-text">Single line menu with separators <span class="preview-icon" id="fusion-menu-fusion-inline-menu"></span></span>";s:5:"class";s:18:"fusion-inline-menu";}i:2;a:2:{s:5:"label";s:171:"<span class="preview-text">Multi-column menu with bold headers (set menu items to Expanded) <span class="preview-icon" id="fusion-menu-fusion-multicol-menu"></span></span>";s:5:"class";s:29:"fusion-multicol-menu clearfix";}}}s:18:"fusion-list-styles";a:4:{s:5:"title";s:16:"List/menu styles";s:4:"type";s:10:"checkboxes";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:11:"panels_pane";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:126:"<span class="preview-text">Bottom border (no bullets) <span class="preview-icon" id="list-styles-bottom-border"></span></span>";s:5:"class";s:25:"fusion-list-bottom-border";}i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Extra vertical spacing (no bullets) <span class="preview-icon" id="list-styles-extra-vertical-spacing"></span></span>";s:5:"class";s:28:"fusion-list-vertical-spacing";}}}s:16:"fusion-superfish";a:5:{s:5:"title";s:21:"Superfish menu styles";s:4:"type";s:6:"radios";s:11:"description";s:63:"Superfish dropdown menus (must also set menu items to Expanded)";s:8:"features";a:1:{i:0;s:5:"block";}s:7:"options";a:1:{i:2;a:2:{s:5:"label";s:144:"<span class="preview-text">Vertical menu (for sidebar blocks) <span class="preview-icon" id="fusion-superfish-superfish-vertical"></span></span>";s:5:"class";s:28:"superfish superfish-vertical";}}}s:23:"fusion-float-imagefield";a:5:{s:5:"title";s:21:"Image floating styles";s:4:"type";s:6:"select";s:11:"description";s:90:"These options will float ImageField images in content to the left or right and add margins";s:8:"features";a:3:{i:0;s:5:"block";i:1;s:4:"node";i:2;s:10:"views_view";}s:7:"options";a:2:{i:1;a:2:{s:5:"label";s:21:"Float ImageField left";s:5:"class";s:28:"fusion-float-imagefield-left";}i:2;a:2:{s:5:"label";s:22:"Float ImageField right";s:5:"class";s:29:"fusion-float-imagefield-right";}}}s:12:"fusion-login";a:5:{s:5:"title";s:23:"User login block styles";s:4:"type";s:6:"radios";s:8:"features";a:2:{i:0;s:5:"block";i:1;s:11:"panels_pane";}s:7:"scripts";a:1:{i:0;s:22:"js/jquery.overlabel.js";}s:7:"options";a:1:{i:1;a:2:{s:5:"label";s:205:"<span class="preview-text">Horizontal: puts user login block on a single line with label overlays (good for Header Top region) <span class="preview-icon" id="fusion-login-fusion-horiz-login"></span></span>";s:5:"class";s:18:"fusion-horiz-login";}}}}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:10:"screenshot";s:50:"sites/all/themes/fusion/fusion_core/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/chameleon.info', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/bluemarine/bluemarine.info', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/fusion/fusion_starter/fusion_starter.info', 'fusion_starter', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:16:{s:4:"name";s:14:"Fusion Starter";s:11:"description";s:200:"Fusion Starter sub-theme. Requires <a href="http://drupal.org/project/fusion">Fusion Core</a> and the <a href="http://drupal.org/project/skinr">Skinr</a> module to enable easy point-and-click theming.";s:10:"base theme";s:11:"fusion_core";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:28:"css/fusion-starter-style.css";s:67:"sites/all/themes/fusion/fusion_starter/css/fusion-starter-style.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"sidebar first";s:12:"sidebar_last";s:12:"sidebar last";s:10:"header_top";s:10:"header top";s:6:"header";s:6:"header";s:11:"preface_top";s:11:"preface top";s:14:"preface_bottom";s:14:"preface bottom";s:11:"content_top";s:11:"content top";s:7:"content";s:7:"content";s:14:"content_bottom";s:14:"content bottom";s:14:"postscript_top";s:14:"postscript top";s:17:"postscript_bottom";s:17:"postscript bottom";s:6:"footer";s:6:"footer";s:8:"node_top";s:8:"node top";s:11:"node_bottom";s:11:"node bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:6:"search";i:6;s:7:"favicon";i:7;s:13:"primary_links";i:8;s:15:"secondary_links";}s:8:"settings";a:7:{s:10:"theme_grid";s:10:"grid16-960";s:18:"theme_grid_options";a:2:{i:0;s:10:"grid16-960";i:1;s:12:"grid16-fluid";}s:16:"fluid_grid_width";s:9:"fluid-100";s:15:"theme_font_size";s:12:"font-size-12";s:14:"sidebar_layout";s:14:"sidebars-split";s:19:"sidebar_first_width";s:1:"3";s:18:"sidebar_last_width";s:1:"3";}s:5:"skinr";a:2:{s:7:"options";a:1:{s:13:"inherit_skins";s:4:"true";}s:12:"grid12-width";s:65:"; Sample Skinr style (uncomment to use, see Skinr section in CSS)";}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:6:"fusion";s:9:"datestamp";s:10:"1266132306";s:7:"scripts";a:1:{s:9:"script.js";s:48:"sites/all/themes/fusion/fusion_starter/script.js";}s:10:"screenshot";s:53:"sites/all/themes/fusion/fusion_starter/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/marvin/marvin.info', 'marvin', 'theme', '', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/pushbutton/pushbutton.info', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/garland/minnelli/minnelli.info', 'minnelli', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}'),
('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/admin_menu/admin_menu.module', 'admin_menu', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:19:"Administration menu";s:11:"description";s:123:"Provides a dropdown menu to most administrative tasks and other common destinations (to users with the proper permissions).";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:10:"admin_menu";s:9:"datestamp";s:10:"1246537502";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/book/book.module', 'book', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/color/color.module', 'color', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/contact/contact.module', 'contact', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/content.module', 'content', 'module', '', 1, 0, 0, 6010, 0, 'a:10:{s:4:"name";s:7:"Content";s:11:"description";s:50:"Allows administrators to define new content types.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/content_copy/content_copy.module', 'content_copy', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:12:"Content Copy";s:11:"description";s:51:"Enables ability to import/export field definitions.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/content_permissions/content_permissions.module', 'content_permissions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content Permissions";s:11:"description";s:43:"Set field-level permissions for CCK fields.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/demo/demo.module', 'demo', 'module', '', 1, 0, 0, 6100, 0, 'a:10:{s:4:"name";s:18:"Demonstration site";s:11:"description";s:74:"Create snapshots and reset the site for demonstration or testing purposes.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.4";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1266603905";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/demo/demo_reset.module', 'demo_reset', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:24:"Demonstration site reset";s:11:"description";s:176:"Allows to reset the site on cron runs and to <strong>reset the site WITHOUT CONFIRMATION.</strong> Only supposed to be used on public demonstration sites. Use at your own risk.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:4:"demo";}s:7:"version";s:7:"6.x-1.4";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1266603905";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/devel/devel.module', 'devel', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Devel";s:11:"description";s:52:"Various blocks, pages, and functions for developers.";s:7:"package";s:11:"Development";s:12:"dependencies";a:1:{i:0;s:4:"menu";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1253731828";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/devel/devel_generate.module', 'devel_generate', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Devel generate";s:11:"description";s:48:"Generate dummy users, nodes, and taxonomy terms.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1253731828";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/devel/devel_node_access.module', 'devel_node_access', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:17:"Devel node access";s:11:"description";s:67:"Developer block and page illustrating relevant node_access records.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1253731828";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/devel/devel_themer.module', 'devel_themer', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:15:"Theme developer";s:11:"description";s:52:"Essential theme API information for theme developers";s:7:"package";s:11:"Development";s:12:"dependencies";a:1:{i:0;s:5:"devel";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1253731828";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/fieldgroup/fieldgroup.module', 'fieldgroup', 'module', '', 1, 0, 0, 6007, 9, 'a:10:{s:4:"name";s:10:"Fieldgroup";s:11:"description";s:37:"Create display groups for CCK fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/filefield/filefield.module', 'filefield', 'module', '', 1, 0, 0, 6104, 0, 'a:10:{s:4:"name";s:9:"FileField";s:11:"description";s:26:"Defines a file field type.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-3.3";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1273102210";s:10:"dependents";a:0:{}}'),
('sites/all/modules/contrib/filefield/filefield_meta/filefield_meta.module', 'filefield_meta', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"FileField Meta";s:11:"description";s:48:"Add metadata gathering and storage to FileField.";s:12:"dependencies";a:2:{i:0;s:9:"filefield";i:1;s:6:"getid3";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-3.3";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1273102210";s:10:"dependents";a:0:{}}'),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/imagecache/imagecache.module', 'imagecache', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:10:"ImageCache";s:11:"description";s:36:"Dynamic image manipulator and cache.";s:7:"package";s:10:"ImageCache";s:12:"dependencies";a:1:{i:0;s:8:"imageapi";}s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-beta10";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1250716281";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/imagecache/imagecache_ui.module', 'imagecache_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"ImageCache UI";s:11:"description";s:26:"ImageCache User Interface.";s:12:"dependencies";a:2:{i:0;s:10:"imagecache";i:1;s:8:"imageapi";}s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-beta10";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1250716281";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/imagefield/imagefield.module', 'imagefield', 'module', '', 1, 0, 0, 6006, 0, 'a:10:{s:4:"name";s:10:"ImageField";s:11:"description";s:28:"Defines an image field type.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:9:"filefield";}s:7:"package";s:3:"CCK";s:7:"version";s:7:"6.x-3.3";s:7:"project";s:10:"imagefield";s:9:"datestamp";s:10:"1273102211";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/nodereference/nodereference.module', 'nodereference', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Node Reference";s:11:"description";s:59:"Defines a field type for referencing one node from another.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:6:"Number";s:11:"description";s:28:"Defines numeric field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.16";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/optionwidgets/optionwidgets.module', 'optionwidgets', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Option Widgets";s:11:"description";s:82:"Defines selection, check box and radio button widgets for text and numeric fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/path/path.module', 'path', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/devel/performance/performance.module', 'performance', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Performance Logging";s:11:"description";s:91:"Logs detailed and/or summary page generation time and memory consumption for page requests.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1253731828";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/search/search.module', 'search', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/skinr/skinr.module', 'skinr', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:5:"Skinr";s:11:"description";s:71:"Provides a way to define and/or skin bits of Drupal output from the UI.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.4";s:7:"project";s:5:"skinr";s:9:"datestamp";s:10:"1266016209";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/text/text.module', 'text', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:4:"Text";s:11:"description";s:32:"Defines simple text field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/update/update.module', 'update', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.16";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/upload/upload.module', 'upload', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.16";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1267662008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/cck/modules/userreference/userreference.module', 'userreference', 'module', '', 1, 0, 0, 6002, 0, 'a:10:{s:4:"name";s:14:"User Reference";s:11:"description";s:56:"Defines a field type for referencing a user from a node.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1257464735";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/views/views.module', 'views', 'module', '', 1, 0, 0, 6009, 10, 'a:10:{s:4:"name";s:5:"Views";s:11:"description";s:55:"Create customized lists and queries from your database.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1270766108";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/views_attach/views_attach.module', 'views_attach', 'module', '', 1, 0, 0, 0, 0, 'a:11:{s:4:"name";s:12:"Views attach";s:11:"description";s:72:"Provides new Views display types that can be attached to nodes or users.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:8:"suggests";a:1:{i:0;s:5:"token";}s:7:"package";s:5:"Views";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:12:"views_attach";s:9:"datestamp";s:10:"1255040204";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES
('sites/all/modules/contrib/views_cycle/views_cycle.module', 'views_cycle', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:11:"Views Cycle";s:11:"description";s:51:"Wrapper for using the jQuery cycle plugin in Views.";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.2";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"version";s:13:"6.x-1.0-beta4";s:7:"project";s:11:"views_cycle";s:9:"datestamp";s:10:"1264117809";s:10:"dependents";a:0:{}}'),
('sites/all/modules/contrib/views/views_export/views_export.module', 'views_export', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Views exporter";s:11:"description";s:40:"Allows exporting multiple views at once.";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1270766108";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Views UI";s:11:"description";s:93:"Administrative interface to views. Without this module, you cannot create or edit your views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"version";s:8:"6.x-2.10";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1270766108";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/imageapi/imageapi.module', 'imageapi', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"ImageAPI";s:11:"description";s:38:"ImageAPI supporting multiple toolkits.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.1";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/contrib/imageapi/imageapi_gd.module', 'imageapi_gd', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"ImageAPI GD2";s:11:"description";s:49:"Uses PHP''s built-in GD2 image processing support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/imageapi/imageapi_imagemagick.module', 'imageapi_imagemagick', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"ImageAPI ImageMagick";s:11:"description";s:33:"Command Line ImageMagick support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date/date.module', 'date', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:4:"Date";s:11:"description";s:41:"Defines CCK date/time fields and widgets.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:8:"date_api";i:2;s:13:"date_timezone";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_api.module', 'date_api', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:8:"Date API";s:11:"description";s:45:"A Date API that can be used by other modules.";s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_locale/date_locale.module', 'date_locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:11:"Date Locale";s:11:"description";s:124:"Allows the site admin to configure multiple formats for date/time display to tailor dates for a specific locale or audience.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:2:{i:0;s:8:"date_api";i:1;s:6:"locale";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_php4/date_php4.module', 'date_php4', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:9:"Date PHP4";s:11:"description";s:134:"Emulate PHP 5.2 date functions in PHP 4.x, PHP 5.0, and PHP 5.1. Required when using the Date API with PHP versions less than PHP 5.2.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_popup/date_popup.module', 'date_popup', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:10:"Date Popup";s:11:"description";s:84:"Enables jquery popup calendars and time entry widgets for selecting dates and times.";s:12:"dependencies";a:2:{i:0;s:8:"date_api";i:1;s:13:"date_timezone";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_repeat/date_repeat.module', 'date_repeat', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:15:"Date Repeat API";s:11:"description";s:73:"A Date Repeat API to calculate repeating dates and times from iCal rules.";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_timezone/date_timezone.module', 'date_timezone', 'module', '', 1, 0, 0, 5200, 0, 'a:10:{s:4:"name";s:13:"Date Timezone";s:11:"description";s:111:"Needed when using Date API. Overrides site and user timezone handling to set timezone names instead of offsets.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/date/date_tools/date_tools.module', 'date_tools', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Date Tools";s:11:"description";s:52:"Tools to import and auto-create dates and calendars.";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:4:"date";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.4";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1253103320";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/calendar/calendar.module', 'calendar', 'module', '', 1, 0, 0, 6002, 1, 'a:10:{s:4:"name";s:8:"Calendar";s:11:"description";s:60:"Views plugin to display views containing dates as Calendars.";s:12:"dependencies";a:3:{i:0;s:5:"views";i:1;s:8:"date_api";i:2;s:13:"date_timezone";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"calendar";s:9:"datestamp";s:10:"1248867038";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/calendar/calendar_ical/calendar_ical.module', 'calendar_ical', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:13:"Calendar iCal";s:11:"description";s:42:"Adds ical functionality to Calendar views.";s:12:"dependencies";a:3:{i:0;s:5:"views";i:1;s:8:"date_api";i:2;s:8:"calendar";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"calendar";s:9:"datestamp";s:10:"1248867038";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/calendar/jcalendar/jcalendar.module', 'jcalendar', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:14:"Calendar Popup";s:11:"description";s:115:"Replaces the links to calendar items with a javascript popup that gracefully regresses if javascript is not enabled";s:12:"dependencies";a:2:{i:0;s:8:"calendar";i:1;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"package";s:9:"Date/Time";s:7:"version";s:7:"6.x-2.2";s:7:"project";s:8:"calendar";s:9:"datestamp";s:10:"1248867038";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/flag/flag.module', 'flag', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Flag";s:11:"description";s:54:"Create customized flags that users can set on content.";s:4:"core";s:3:"6.x";s:7:"package";s:5:"Flags";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:4:"flag";s:9:"datestamp";s:10:"1262929205";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/flag/flag_actions.module', 'flag_actions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:12:"Flag actions";s:11:"description";s:31:"Execute actions on Flag events.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:4:"flag";}s:7:"package";s:5:"Flags";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:4:"flag";s:9:"datestamp";s:10:"1262929205";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/vertical_tabs/vertical_tabs.module', 'vertical_tabs', 'module', '', 1, 0, 0, 6104, 300, 'a:11:{s:4:"name";s:13:"Vertical Tabs";s:11:"description";s:67:"Provides vertical tabs for supported forms like the node edit page.";s:4:"core";s:3:"6.x";s:7:"package";s:14:"User interface";s:10:"recommends";a:1:{i:0;s:4:"form";}s:7:"version";s:11:"6.x-1.0-rc1";s:7:"project";s:13:"vertical_tabs";s:9:"datestamp";s:10:"1265224223";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/multi_node_add/multi_node_add.module', 'multi_node_add', 'module', '', 0, 0, 0, 0, 0, 'a:9:{s:4:"name";s:17:"Multiple Node Add";s:11:"description";s:63:"Provides a way to add multiple nodes in one page, in one round.";s:4:"core";s:3:"6.x";s:7:"version";s:13:"6.x-1.0-beta1";s:7:"project";s:14:"multi_node_add";s:9:"datestamp";s:10:"1261156554";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/lightbox2/lightbox2.module', 'lightbox2', 'module', '', 1, 0, 0, 3, 0, 'a:9:{s:4:"name";s:9:"Lightbox2";s:11:"description";s:28:"Enables Lightbox2 for Drupal";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.9";s:7:"project";s:9:"lightbox2";s:9:"datestamp";s:10:"1231421439";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/editablefields/editablefields.module', 'editablefields', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Editablefields";s:11:"description";s:44:"Allows you to make some view fields editable";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:9:"ajax_load";}s:7:"package";s:3:"CCK";s:7:"version";s:7:"6.x-2.0";s:4:"core";s:3:"6.x";s:7:"project";s:14:"editablefields";s:9:"datestamp";s:10:"1263936609";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/markdown/markdown.module', 'markdown', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:15:"Markdown filter";s:11:"description";s:111:"Allows content to be submitted using Markdown, a simple plain-text syntax that is transformed into valid XHTML.";s:7:"package";s:13:"Input filters";s:12:"dependencies";a:1:{i:0;s:6:"filter";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:8:"markdown";s:9:"datestamp";s:10:"1272513007";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/collapse_text/collapse_text.module', 'collapse_text', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"Collapse Text";s:11:"description";s:64:"Input filter allowing plain text sections to become collapsible.";s:12:"dependencies";a:1:{i:0;s:6:"filter";}s:7:"package";s:13:"Input filters";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.2";s:7:"version";s:7:"6.x-1.1";s:7:"project";s:13:"collapse_text";s:9:"datestamp";s:10:"1229359209";s:10:"dependents";a:0:{}}'),
('sites/all/modules/contrib/views_bulk_operations/actions_permissions.module', 'actions_permissions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Actions permissions";s:11:"description";s:46:"Integrates actions with the permission system.";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.9";s:7:"project";s:21:"views_bulk_operations";s:9:"datestamp";s:10:"1265245814";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/views_bulk_operations/views_bulk_operations.module', 'views_bulk_operations', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:21:"Views Bulk Operations";s:11:"description";s:103:"Exposes new Views style ''Bulk Operations'' for selecting multiple nodes and applying operations on them.";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-1.9";s:7:"project";s:21:"views_bulk_operations";s:9:"datestamp";s:10:"1265245814";s:10:"dependents";a:0:{}}'),
('sites/all/modules/customs/zzz/zzz.module', 'zzz', 'module', '', 0, 0, 0, -1, 0, 'a:7:{s:4:"name";s:11:"ZZZ Project";s:11:"description";s:16:"project specific";s:16:"package ZZZ\ncore";s:3:"6.x";s:7:"version";s:13:"project.x-dev";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/a1/a1.module', 'a1', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"a1";}}s:4:"name";s:2:"a1";s:7:"package";s:8:"Features";s:7:"project";s:2:"a1";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/a2/a2.module', 'a2', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"a2";}}s:4:"name";s:2:"a2";s:7:"package";s:8:"Features";s:7:"project";s:2:"a2";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/a3/a3.module', 'a3', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"a3";}}s:4:"name";s:2:"a3";s:7:"package";s:8:"Features";s:7:"project";s:2:"a3";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/features/features.module', 'features', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Features";s:11:"description";s:39:"Provides feature management for Drupal.";s:4:"core";s:3:"6.x";s:7:"package";s:8:"Features";s:7:"version";s:13:"6.x-1.0-beta6";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1265528707";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/contrib/features/tests/features_test.module', 'features_test', 'module', '', 0, 0, 0, -1, 0, 'a:11:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:4:{i:0;s:10:"fieldgroup";i:1;s:5:"views";i:2;s:4:"text";i:3;s:8:"features";}s:11:"description";s:33:"Test module for Features testing.";s:8:"features";a:7:{s:7:"content";a:3:{i:0;s:33:"features_test-field_features_test";i:1;s:41:"features_test-field_features_test_child_a";i:2;s:41:"features_test-field_features_test_child_b";}s:10:"fieldgroup";a:1:{i:0;s:33:"features_test-group_features_test";}s:6:"filter";a:1:{i:0;s:13:"features_test";}s:10:"imagecache";a:1:{i:0;s:13:"features_test";}s:4:"node";a:1:{i:0;s:13:"features_test";}s:4:"user";a:1:{i:0;s:28:"create features_test content";}s:5:"views";a:1:{i:0;s:13:"features_test";}}s:4:"name";s:14:"Features Tests";s:7:"package";s:7:"Testing";s:7:"version";s:13:"6.x-1.0-beta6";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1265528707";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/m1/m1.module', 'm1', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:8:"taxonomy";i:2;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"m1";}}s:4:"name";s:2:"m1";s:7:"package";s:8:"Features";s:7:"project";s:2:"m1";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/m1_plus/m1_plus.module', 'm1_plus', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:8:"taxonomy";i:2;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:7:"m1_plus";}}s:4:"name";s:7:"m1_plus";s:7:"package";s:8:"Features";s:7:"project";s:7:"m1_plus";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/m1_plusplus/m1_plusplus.module', 'm1_plusplus', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:8:"taxonomy";i:2;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:11:"m1_plusplus";}}s:4:"name";s:11:"m1_plusplus";s:7:"package";s:8:"Features";s:7:"project";s:11:"m1_plusplus";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/m2/m2.module', 'm2', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"m2";}}s:4:"name";s:2:"m2";s:7:"package";s:8:"Features";s:7:"project";s:2:"m2";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/m2_plus/m2_plus.module', 'm2_plus', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:7:"m2_plus";}}s:4:"name";s:7:"m2_plus";s:7:"package";s:8:"Features";s:7:"project";s:7:"m2_plus";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/workshop_views/s1/s1.module', 's1', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:8:"features";a:1:{s:5:"views";a:1:{i:0;s:2:"s1";}}s:4:"name";s:2:"s1";s:7:"package";s:8:"Features";s:7:"project";s:2:"s1";s:10:"dependents";a:0:{}s:11:"description";s:0:"";s:7:"version";N;s:3:"php";s:5:"4.3.5";}');
/*!40000 ALTER TABLE system ENABLE KEYS */;

--
-- Table structure for table 'term_data'
--

CREATE TABLE IF NOT EXISTS `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'term_data'
--

/*!40000 ALTER TABLE term_data DISABLE KEYS */;
INSERT INTO `term_data` VALUES
(1, 1, 'Comedy', '', 0),
(2, 1, 'Drama', '', 0),
(3, 1, 'Romance', '', 0),
(4, 1, 'Adventure', '', 0),
(5, 1, 'Fantasy', '', 0),
(6, 1, 'Mystery', '', 0),
(7, 1, 'Thriller', '', 0),
(8, 1, 'War', '', 0),
(9, 1, 'Crime', '', 0);
/*!40000 ALTER TABLE term_data ENABLE KEYS */;

--
-- Table structure for table 'term_hierarchy'
--

CREATE TABLE IF NOT EXISTS `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'term_hierarchy'
--

/*!40000 ALTER TABLE term_hierarchy DISABLE KEYS */;
INSERT INTO `term_hierarchy` VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);
/*!40000 ALTER TABLE term_hierarchy ENABLE KEYS */;

--
-- Table structure for table 'term_node'
--

CREATE TABLE IF NOT EXISTS `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'term_node'
--

/*!40000 ALTER TABLE term_node DISABLE KEYS */;
INSERT INTO `term_node` VALUES
(10, 10, 6),
(10, 10, 5),
(12, 12, 1),
(15, 15, 1),
(20, 20, 3),
(20, 20, 1),
(21, 21, 3),
(21, 21, 2),
(21, 21, 1),
(10, 10, 1),
(10, 10, 4),
(24, 24, 1),
(26, 26, 3),
(26, 26, 2),
(26, 26, 1),
(27, 27, 3),
(27, 27, 2),
(27, 27, 1),
(28, 28, 2),
(28, 28, 1),
(31, 31, 2),
(31, 31, 7),
(31, 31, 8),
(34, 34, 2),
(34, 34, 9),
(34, 34, 1);
/*!40000 ALTER TABLE term_node ENABLE KEYS */;

--
-- Table structure for table 'term_relation'
--

CREATE TABLE IF NOT EXISTS `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'term_relation'
--

/*!40000 ALTER TABLE term_relation DISABLE KEYS */;
/*!40000 ALTER TABLE term_relation ENABLE KEYS */;

--
-- Table structure for table 'term_synonym'
--

CREATE TABLE IF NOT EXISTS `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'term_synonym'
--

/*!40000 ALTER TABLE term_synonym DISABLE KEYS */;
/*!40000 ALTER TABLE term_synonym ENABLE KEYS */;

--
-- Table structure for table 'upload'
--

CREATE TABLE IF NOT EXISTS `upload` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `list` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`,`fid`),
  KEY `fid` (`fid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'upload'
--

/*!40000 ALTER TABLE upload DISABLE KEYS */;
INSERT INTO `upload` VALUES
(42, 35, 35, 'Slides zum Workshop (mit Aufgaben)', 1, 0);
/*!40000 ALTER TABLE upload ENABLE KEYS */;

--
-- Table structure for table 'url_alias'
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'url_alias'
--

/*!40000 ALTER TABLE url_alias DISABLE KEYS */;
/*!40000 ALTER TABLE url_alias ENABLE KEYS */;

--
-- Table structure for table 'users'
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  `timezone_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'users'
--

/*!40000 ALTER TABLE users DISABLE KEYS */;
INSERT INTO `users` VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL, ''),
(1, 'admin', 'fad040f128a0127247ffa0f6633500b5', 'mail@demo.paul', 0, 0, 0, '', '', 0, 1267175332, 1273396638, 1273332557, 1, '3600', '', '', 'domain@derhasi.de', 'a:1:{s:13:"form_build_id";s:37:"form-31f4443f73e641a73fa97eeb540f64f4";}', '');
/*!40000 ALTER TABLE users ENABLE KEYS */;

--
-- Table structure for table 'users_roles'
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'users_roles'
--

/*!40000 ALTER TABLE users_roles DISABLE KEYS */;
/*!40000 ALTER TABLE users_roles ENABLE KEYS */;

--
-- Table structure for table 'variable'
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'variable'
--

/*!40000 ALTER TABLE variable DISABLE KEYS */;
INSERT INTO `variable` VALUES
('theme_default', 's:7:"garland";'),
('filter_html_1', 's:1:"1";'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('drupal_private_key', 's:64:"c93b2d409ecb5d5ba2a7b043769af51288247139dea8e45cbd3235cf081fa9f8";'),
('menu_masks', 'a:25:{i:0;i:127;i:1;i:125;i:2;i:63;i:3;i:62;i:4;i:61;i:5;i:59;i:6;i:58;i:7;i:57;i:8;i:56;i:9;i:31;i:10;i:30;i:11;i:29;i:12;i:28;i:13;i:24;i:14;i:21;i:15;i:15;i:16;i:14;i:17;i:12;i:18;i:11;i:19;i:7;i:20;i:6;i:21;i:5;i:22;i:3;i:23;i:2;i:24;i:1;}'),
('install_task', 's:4:"done";'),
('menu_expanded', 'a:1:{i:0;s:10:"navigation";}'),
('site_name', 's:31:"Views 2 Workshop für Anfänger";'),
('site_mail', 's:20:"mail@work.derhasi.de";'),
('date_default_timezone', 'i:3600;'),
('user_email_verification', 'b:1;'),
('clean_url', 's:1:"1";'),
('install_time', 'i:1267175789;'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('vertical_tabs_forms', 'a:0:{}'),
('theme_settings', 'a:19:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:1;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:0;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:22:"toggle_node_info_actor";i:0;s:21:"toggle_node_info_book";i:0;s:22:"toggle_node_info_movie";i:0;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";}'),
('drupal_http_request_fails', 'b:0;'),
('css_js_query_string', 's:20:"VWT00000000000000000";'),
('install_profile', 's:7:"default";'),
('update_last_check', 'i:1273335037;'),
('content_schema_version', 'i:6009;'),
('fieldgroup_schema_version', 'i:6000;'),
('date_api_version', 's:3:"5.2";'),
('file_directory_temp', 's:36:"/Applications/XAMPP/xamppfiles/temp/";'),
('javascript_parsed', 'a:0:{}'),
('node_options_story', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}'),
('form_build_id_story', 's:37:"form-164869c5a1113433fdebeaeaf73dcef7";'),
('format', 's:1:"1";'),
('filter_html_nofollow_1', 'i:0;'),
('filter_html_help_1', 'i:1;'),
('allowed_html_1', 's:76:"<h1> <h2> <h3> <a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd>";'),
('filter_url_length_1', 's:2:"72";'),
('node_options_movie', 'a:1:{i:0;s:6:"status";}'),
('form_build_id_movie', 's:37:"form-4f329106f32cbf7fc60fca91f0ce1c9d";'),
('comment_movie', 's:1:"2";'),
('comment_default_mode_movie', 's:1:"4";'),
('comment_default_order_movie', 's:1:"1";'),
('comment_default_per_page_movie', 's:2:"50";'),
('comment_controls_movie', 's:1:"3";'),
('comment_anonymous_movie', 'i:0;'),
('comment_subject_field_movie', 's:1:"1";'),
('comment_preview_movie', 's:1:"1";'),
('comment_form_location_movie', 's:1:"0";'),
('node_options_actor', 'a:1:{i:0;s:6:"status";}'),
('form_build_id_actor', 's:37:"form-50fe19eef66b1197d7a8bfdec34eeeca";'),
('comment_actor', 's:1:"2";'),
('comment_default_mode_actor', 's:1:"4";'),
('comment_default_order_actor', 's:1:"1";'),
('comment_default_per_page_actor', 's:2:"50";'),
('comment_controls_actor', 's:1:"3";'),
('comment_anonymous_actor', 'i:0;'),
('comment_subject_field_actor', 's:1:"1";'),
('comment_preview_actor', 's:1:"1";'),
('comment_form_location_actor', 's:1:"0";'),
('content_extra_weights_movie', 'a:7:{s:5:"title";s:2:"-5";s:10:"body_field";s:1:"1";s:20:"revision_information";s:1:"2";s:16:"comment_settings";s:1:"4";s:4:"menu";s:1:"3";s:8:"taxonomy";s:2:"-4";s:4:"book";s:1:"5";}'),
('date_default_timezone_name', 's:13:"Europe/Berlin";'),
('configurable_timezones', 's:1:"0";'),
('date_first_day', 's:1:"1";'),
('date_format_long', 's:15:"l, j. F Y - G:i";'),
('date_format_medium', 's:12:"j. F Y - G:i";'),
('date_format_short', 's:11:"d.m.Y - H:i";'),
('add_date_format_title', 's:0:"";'),
('add_date_format_type', 's:0:"";'),
('content_extra_weights_actor', 'a:5:{s:5:"title";s:2:"-5";s:10:"body_field";s:1:"0";s:20:"revision_information";s:2:"-2";s:16:"comment_settings";s:1:"1";s:4:"menu";s:2:"-1";}'),
('date:movie:teaser:field_release_date_show_repeat_rule', 's:4:"show";'),
('date:movie:teaser:field_release_date_multiple_number', 's:0:"";'),
('date:movie:teaser:field_release_date_multiple_from', 's:0:"";'),
('date:movie:teaser:field_release_date_multiple_to', 's:0:"";'),
('date:movie:teaser:field_release_date_fromto', 's:4:"both";'),
('date:movie:full:field_release_date_show_repeat_rule', 's:4:"show";'),
('date:movie:full:field_release_date_multiple_number', 's:0:"";'),
('date:movie:full:field_release_date_multiple_from', 's:0:"";'),
('date:movie:full:field_release_date_multiple_to', 's:0:"";'),
('date:movie:full:field_release_date_fromto', 's:4:"both";'),
('site_slogan', 's:37:"by derHasi - Johannes Haseitl undPaul";'),
('site_mission', 's:0:"";'),
('site_footer', 's:90:"Powered by <a href="http://derhasi.de">DerHasi</a> <a href="http://undpaul.de">undPaul</a>";'),
('anonymous', 's:9:"Anonymous";'),
('site_frontpage', 's:7:"node/35";'),
('theme_garland_settings', 'a:20:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:1;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:0;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:12:"default_logo";i:0;s:9:"logo_path";s:36:"sites/default/files/garland_logo.png";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:39:"sites/default/files/garland_favicon.ico";s:14:"favicon_upload";s:0:"";s:6:"scheme";s:39:"#464849,#2f416f,#2a2b2d,#5d6779,#494949";s:7:"palette";a:5:{s:4:"base";s:7:"#464849";s:4:"link";s:7:"#2f416f";s:3:"top";s:7:"#2a2b2d";s:6:"bottom";s:7:"#5d6779";s:4:"text";s:7:"#494949";}s:5:"theme";s:7:"garland";s:4:"info";a:10:{s:7:"schemes";a:16:{s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:21:"Blue Lagoon (Default)";s:39:"#464849,#2f416f,#2a2b2d,#5d6779,#494949";s:3:"Ash";s:39:"#55c0e2,#000000,#085360,#007e94,#696969";s:10:"Aquamarine";s:39:"#d5b048,#6c420e,#331900,#971702,#494949";s:17:"Belgian Chocolate";s:39:"#3f3f3f,#336699,#6598cb,#6598cb,#000000";s:10:"Bluemarine";s:39:"#d0cb9a,#917803,#efde01,#e6fb2d,#494949";s:12:"Citrus Blast";s:39:"#0f005c,#434f8c,#4d91ff,#1a1575,#000000";s:8:"Cold Day";s:39:"#c9c497,#0c7a00,#03961e,#7be000,#494949";s:9:"Greenbeam";s:39:"#ffe23d,#a9290a,#fc6d1d,#a30f42,#494949";s:11:"Mediterrano";s:39:"#788597,#3f728d,#a9adbc,#d4d4d4,#707070";s:7:"Mercury";s:39:"#5b5fa9,#5b5faa,#0a2352,#9fa8d5,#494949";s:9:"Nocturnal";s:39:"#7db323,#6a9915,#b5d52a,#7db323,#191a19";s:6:"Olivia";s:39:"#12020b,#1b1a13,#f391c6,#f41063,#898080";s:12:"Pink Plastic";s:39:"#b7a0ba,#c70000,#a1443a,#f21107,#515d52";s:12:"Shiny Tomato";s:39:"#18583d,#1b5f42,#34775a,#52bf90,#2d2d2d";s:8:"Teal Top";s:0:"";s:6:"Custom";}s:4:"copy";a:4:{i:0;s:25:"images/menu-collapsed.gif";i:1;s:29:"images/menu-collapsed-rtl.gif";i:2;s:24:"images/menu-expanded.gif";i:3;s:20:"images/menu-leaf.gif";}s:3:"css";a:1:{i:0;s:9:"style.css";}s:8:"gradient";a:4:{i:0;i:0;i:1;i:37;i:2;i:760;i:3;i:121;}s:4:"fill";a:2:{s:4:"base";a:4:{i:0;i:0;i:1;i:0;i:2;i:760;i:3;i:568;}s:4:"link";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}}s:6:"slices";a:13:{s:15:"images/body.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:1;i:3;i:280;}s:17:"images/bg-bar.png";a:4:{i:0;i:202;i:1;i:530;i:2;i:76;i:3;i:14;}s:23:"images/bg-bar-white.png";a:4:{i:0;i:202;i:1;i:506;i:2;i:76;i:3;i:14;}s:17:"images/bg-tab.png";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}s:24:"images/bg-navigation.png";a:4:{i:0;i:0;i:1;i:0;i:2;i:7;i:3;i:37;}s:26:"images/bg-content-left.png";a:4:{i:0;i:40;i:1;i:117;i:2;i:50;i:3;i:352;}s:27:"images/bg-content-right.png";a:4:{i:0;i:510;i:1;i:117;i:2;i:50;i:3;i:352;}s:21:"images/bg-content.png";a:4:{i:0;i:299;i:1;i:117;i:2;i:7;i:3;i:200;}s:29:"images/bg-navigation-item.png";a:4:{i:0;i:32;i:1;i:37;i:2;i:17;i:3;i:12;}s:35:"images/bg-navigation-item-hover.png";a:4:{i:0;i:54;i:1;i:37;i:2;i:17;i:3;i:12;}s:25:"images/gradient-inner.png";a:4:{i:0;i:646;i:1;i:307;i:2;i:112;i:3;i:42;}s:8:"logo.png";a:4:{i:0;i:622;i:1;i:51;i:2;i:64;i:3;i:73;}s:14:"screenshot.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:400;i:3;i:240;}}s:12:"blend_target";s:7:"#ffffff";s:13:"preview_image";s:17:"color/preview.png";s:11:"preview_css";s:17:"color/preview.css";s:10:"base_image";s:14:"color/base.png";}}'),
('color_garland_palette', 'a:5:{s:4:"base";s:7:"#464849";s:4:"link";s:7:"#2f416f";s:3:"top";s:7:"#2a2b2d";s:6:"bottom";s:7:"#5d6779";s:4:"text";s:7:"#494949";}'),
('color_garland_logo', 's:51:"sites/default/files/color/garland-5bf78a71/logo.png";'),
('color_garland_screenshot', 's:57:"sites/default/files/color/garland-5bf78a71/screenshot.png";'),
('color_garland_stylesheets', 'a:2:{i:0;s:52:"sites/default/files/color/garland-5bf78a71/style.css";i:1;s:56:"sites/default/files/color/garland-5bf78a71/style-rtl.css";}'),
('color_garland_files', 'a:19:{i:0;s:61:"sites/default/files/color/garland-5bf78a71/menu-collapsed.gif";i:1;s:65:"sites/default/files/color/garland-5bf78a71/menu-collapsed-rtl.gif";i:2;s:60:"sites/default/files/color/garland-5bf78a71/menu-expanded.gif";i:3;s:56:"sites/default/files/color/garland-5bf78a71/menu-leaf.gif";i:4;s:51:"sites/default/files/color/garland-5bf78a71/body.png";i:5;s:53:"sites/default/files/color/garland-5bf78a71/bg-bar.png";i:6;s:59:"sites/default/files/color/garland-5bf78a71/bg-bar-white.png";i:7;s:53:"sites/default/files/color/garland-5bf78a71/bg-tab.png";i:8;s:60:"sites/default/files/color/garland-5bf78a71/bg-navigation.png";i:9;s:62:"sites/default/files/color/garland-5bf78a71/bg-content-left.png";i:10;s:63:"sites/default/files/color/garland-5bf78a71/bg-content-right.png";i:11;s:57:"sites/default/files/color/garland-5bf78a71/bg-content.png";i:12;s:65:"sites/default/files/color/garland-5bf78a71/bg-navigation-item.png";i:13;s:71:"sites/default/files/color/garland-5bf78a71/bg-navigation-item-hover.png";i:14;s:61:"sites/default/files/color/garland-5bf78a71/gradient-inner.png";i:15;s:51:"sites/default/files/color/garland-5bf78a71/logo.png";i:16;s:57:"sites/default/files/color/garland-5bf78a71/screenshot.png";i:17;s:52:"sites/default/files/color/garland-5bf78a71/style.css";i:18;s:56:"sites/default/files/color/garland-5bf78a71/style-rtl.css";}'),
('node_options_book', 'a:1:{i:0;s:6:"status";}'),
('book_allowed_types', 'a:1:{i:0;s:4:"book";}'),
('book_child_type', 's:4:"book";'),
('node_options_company', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}'),
('form_build_id_company', 's:37:"form-f47edd331817dbfc497d47c792e87c25";'),
('comment_company', 's:1:"2";'),
('comment_default_mode_company', 's:1:"4";'),
('comment_default_order_company', 's:1:"1";'),
('comment_default_per_page_company', 's:2:"50";'),
('comment_controls_company', 's:1:"3";'),
('comment_anonymous_company', 'i:0;'),
('comment_subject_field_company', 's:1:"1";'),
('comment_preview_company', 's:1:"1";'),
('comment_form_location_company', 's:1:"0";'),
('content_extra_weights_company', 'a:6:{s:5:"title";s:2:"-5";s:10:"body_field";s:2:"-3";s:20:"revision_information";s:1:"0";s:16:"comment_settings";s:1:"1";s:4:"menu";s:2:"-2";s:4:"book";s:2:"-1";}'),
('demo_dump_path', 's:24:"sites/default/files/demo";'),
('views_block_hashes', 'a:0:{}');
/*!40000 ALTER TABLE variable ENABLE KEYS */;

--
-- Table structure for table 'views_display'
--

CREATE TABLE IF NOT EXISTS `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `id` varchar(64) NOT NULL DEFAULT '',
  `display_title` varchar(64) NOT NULL DEFAULT '',
  `display_plugin` varchar(64) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '0',
  `display_options` longtext,
  PRIMARY KEY (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'views_display'
--

/*!40000 ALTER TABLE views_display DISABLE KEYS */;
/*!40000 ALTER TABLE views_display ENABLE KEYS */;

--
-- Table structure for table 'views_object_cache'
--

CREATE TABLE IF NOT EXISTS `views_object_cache` (
  `sid` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `obj` varchar(32) DEFAULT NULL,
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  KEY `sid_obj_name` (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table 'views_view'
--

CREATE TABLE IF NOT EXISTS `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `view_php` blob,
  `base_table` varchar(64) NOT NULL DEFAULT '',
  `is_cacheable` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'views_view'
--

/*!40000 ALTER TABLE views_view DISABLE KEYS */;
/*!40000 ALTER TABLE views_view ENABLE KEYS */;

--
-- Table structure for table 'vocabulary'
--

CREATE TABLE IF NOT EXISTS `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'vocabulary'
--

/*!40000 ALTER TABLE vocabulary DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES
(1, 'Genre', '', '', 1, 0, 1, 1, 1, 'taxonomy', 0);
/*!40000 ALTER TABLE vocabulary ENABLE KEYS */;

--
-- Table structure for table 'vocabulary_node_types'
--

CREATE TABLE IF NOT EXISTS `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'vocabulary_node_types'
--

/*!40000 ALTER TABLE vocabulary_node_types DISABLE KEYS */;
INSERT INTO `vocabulary_node_types` VALUES
(1, 'movie');
/*!40000 ALTER TABLE vocabulary_node_types ENABLE KEYS */;

--
-- Table structure for table 'watchdog'
--

CREATE TABLE IF NOT EXISTS `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
