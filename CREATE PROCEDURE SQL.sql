DELIMITER //

CREATE PROCEDURE GetAllUsers()

BEGIN
	Select id, username, firstname, lastname, phone, email, isReviewer, isAdmin 
		from users;
END//

DELIMITER ;

CALL GetAllUsers();