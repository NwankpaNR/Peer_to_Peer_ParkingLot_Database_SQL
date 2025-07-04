CREATE DEFINER=`root`@`localhost` TRIGGER `delete_reservations` BEFORE DELETE ON `parking_space` FOR EACH ROW BEGIN
  DELETE FROM reservation
  WHERE parking_space_id = OLD.parking_space_id;
END