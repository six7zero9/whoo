CREATE TABLE `decks` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `archetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `player` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',  
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;