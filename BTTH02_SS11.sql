CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

CREATE TABLE IF NOT EXISTS customers (
    customerNumber INT PRIMARY KEY,
    city VARCHAR(50)
);

INSERT INTO customers (customerNumber, city) VALUES 
(1, 'NYC'), (2, 'NYC'), (3, 'Hanoi'), (4, 'Paris');

-- Bước 1: Thủ tục tính tổng khách hàng (Sử dụng tham số IN và OUT)
DELIMITER //
CREATE PROCEDURE sp_count_customers_by_city(
    IN city_in VARCHAR(50),
    OUT total_out INT
)
BEGIN
    SELECT COUNT(*) INTO total_out 
    FROM customers 
    WHERE city = city_in;
END //
DELIMITER ;

-- Thực thi Bước 1
CALL sp_count_customers_by_city('NYC', @total);
SELECT @total AS Total_Customers_NYC;

-- Bước 2 & Bước 3: Khai báo biến nội bộ, gán giá trị và lập trình cấu trúc điều khiển IF-ELSE
DELIMITER //
CREATE PROCEDURE sp_logic_test()
BEGIN
    DECLARE v_score DOUBLE;
    SET v_score = 8.5;

    IF v_score < 5 THEN
        SELECT 'Yếu' AS Classification;
    ELSEIF v_score < 8 THEN
        SELECT 'Khá' AS Classification;
    ELSE
        SELECT 'Giỏi' AS Classification;
    END IF;
END //
DELIMITER ;

-- Bước 4: Thực thi và Kiểm tra
CALL sp_logic_test();