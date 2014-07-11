CREATE TABLE `price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `quantity` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` int(11) unsigned DEFAULT NULL,
  `buylist` int(11) unsigned DEFAULT NULL,
  `card_id` int(11) unsigned DEFAULT NULL,
  `vendor_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`card_id`) REFERENCES cards(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;