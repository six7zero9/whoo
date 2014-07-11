CREATE TABLE `cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `multiverseid` int(11) unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `rarity` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `color` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `set_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;