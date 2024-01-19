// Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP PROCEDURE IF EXISTS numbers;
DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();