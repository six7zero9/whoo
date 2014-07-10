CREATE TABLE `cards` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `set_id` int(11) unsigned DEFAULT NULL,
  `mana` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cmc` int(11) unsigned DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;