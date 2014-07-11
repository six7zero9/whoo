 set foreign_key_checks=0;
;CREATE TABLE `decks_cards` (
  `set_id` int(11) unsigned DEFAULT NULL,
  `count` int(11) unsigned DEFAULT NULL,
  `event_id` int(11) unsigned DEFAULT NULL,
  `finished` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `deck_id` int(11) unsigned DEFAULT NULL,
  FOREIGN KEY(`set_id`) REFERENCES `sets`(`id`),
  FOREIGN KEY(`event_id`) REFERENCES `events`(`id`),
  FOREIGN KEY(`deck_id`) REFERENCES `decks`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 