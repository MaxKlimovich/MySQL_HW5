DROP DATABASE IF EXISTS lesson_5;
CREATE DATABASE IF NOT EXISTS lesson_5;
USE lesson_5;
DROP TABLE IF EXISTS train;
CREATE TABLE IF NOT EXISTS train
(
	train_id INT,
    station VARCHAR(45),
    station_time TIME 
);

INSERT train
VALUES
	(110, "San_Francisco", '10:00:00'),
    (110, "Redwood_City", '10:54:00'),
    (110, "Palo_Alto", '11:02:00'),
    (110, "San_Jose", '12:35:00'),
	(120, "San_Francisco", '11:00:00'),
    (120, "Palo_Alto ", '12:49:00'), 
    (120, "San_Jose", '13:30:00');
    
    SELECT * FROM train;
    
/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/    


SELECT 
	train_id,
    station,
    station_time,
	TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station
FROM train;