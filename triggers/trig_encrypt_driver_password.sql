CREATE DEFINER=`root`@`localhost` TRIGGER `driver_BEFORE_INSERT` BEFORE INSERT ON `driver` FOR EACH ROW BEGIN
	SET NEW.user_password = AES_ENCRYPT(NEW.user_password, 'nkiru');
END