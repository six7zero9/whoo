CREATE TABLE `price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `quantity` int(11) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` decimal(11,2) unsigned DEFAULT NULL,
  `buylist` decimal(11,2) unsigned DEFAULT NULL,
  `card_id` int(11) unsigned DEFAULT NULL,
  `vendor_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `price_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;