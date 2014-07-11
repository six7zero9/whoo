CREATE TABLE `vendors` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',	
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `online_sources_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`online_sources_id`) REFERENCES online_sources(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;