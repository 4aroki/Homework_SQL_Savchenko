CREATE DATABASE IF NOT EXISTS Seconds;
USE Seconds;
-- DROP PROCEDURE Seconds;

DELIMITER //
CREATE PROCEDURE Seconds(IN total_seconds INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    SET days = total_seconds / 86400;
    SET hours = (total_seconds % 86400) / 3600;
    SET minutes = (total_seconds % 3600) / 60;
    SET seconds = total_seconds % 60;

    SELECT CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds') AS 'time';
END//

DELIMITER ;

CALL Seconds(123456);



DELIMITER //

-- DROP PROCEDURE  EvenNumbers; 
CREATE PROCEDURE EvenNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(250);
    SET result = '';
   
    WHILE i <= 10 DO
		IF i % 2 = 0 THEN
			SET result = CONCAT(result, i, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SELECT TRIM(TRAILING ', ' FROM result) as 'result';
END//

DELIMITER ;

CALL EvenNumbers();

