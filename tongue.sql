--
-- Database: `tongue`
--

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `feed` varchar(255) COLLATE utf8_bin NOT NULL,
  `feed_server` varchar(255) COLLATE utf8_bin NOT NULL,
  `in_use` tinyint(1) NOT NULL,
  `dest` varchar(255) COLLATE utf8_bin NOT NULL,
  `http_stat` varchar(255) COLLATE utf8_bin NOT NULL,
  `sent` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feed` (`feed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE IF NOT EXISTS `seasons` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(255) NOT NULL,
  `show_id` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE IF NOT EXISTS `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `video_files`
--

CREATE TABLE IF NOT EXISTS `video_files` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `path_hash` varchar(255) NOT NULL,
  `season_id` int(255) NOT NULL,
  `show_id` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_hash` (`path_hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `waiting`
--

CREATE TABLE IF NOT EXISTS `waiting` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `video_id` int(255) NOT NULL,
  `feed` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `feed_server` varchar(255) NOT NULL,
  `seek` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=0 ;