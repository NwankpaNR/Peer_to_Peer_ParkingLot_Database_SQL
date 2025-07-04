CREATE DEFINER=`root`@`localhost` TRIGGER `parking_space_owner_BEFORE_INSERT` BEFORE INSERT ON `parking_space_owner` FOR EACH ROW BEGIN
	SET NEW.user_password = AES_ENCRYPT(NEW.user_password, 'nkiru');
END