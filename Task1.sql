// Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS times;
DELIMITER //
CREATE FUNCTION times (seconds INT)
RETURNS CHAR(255)
DETERMINISTIC
BEGIN
DECLARE days INT;
DECLARE hours, minutes, sec INT;
DECLARE result CHAR(255);
SET days = cast(floor(seconds/60/60/24) AS CHAR(3));
SET hours = cast(floor(mod(seconds/60/60/24,1)*24) AS CHAR(2));
SET minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) AS CHAR(2));
SET sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
SET result = concat(days, "days", hours, "hours", minutes, "minutes", sec, "seconds");
RETURN result;
END //
DELIMITER ;