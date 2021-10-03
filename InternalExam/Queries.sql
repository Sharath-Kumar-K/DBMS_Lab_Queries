DROP DATABASE Sales;
CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Item (
item_id INT(3) PRIMARY KEY,
item_desc VARCHAR(20) NOT NULL,
qty_on_hand INT NOT NULL,
price INT NOT NULL,
category VARCHAR(10),
tax INT NOT NULL
);

CREATE TABLE Sale (
sale_id INT PRIMARY KEY AUTO_INCREMENT,
item_id INT(3) NOT NULL,
qty_sold INT NOT NULL,
price INT NOT NULL,
total INT NOT NULL,
FOREIGN KEY(item_id) REFERENCES Item(item_id)
);

CREATE TABLE purchase_log ( 
serialNo INT PRIMARY KEY AUTO_INCREMENT,
item_id INT(3) NOT NULL,
item_desc VARCHAR(10),
time DATE NOT NULL,
FOREIGN KEY(item_id) REFERENCES Item(item_id)
);

INSERT INTO Item VALUES
(100, "notebook", 20, 20, "book", 5),
(101, "milkybar",  30, 5, "chocolate", 20),
(102, "apple", 50, 10, "fruit", 10);

SELECT * FROM Item;
SELECT * FROM Sale;
SELECT * FROM purchase_log;


-- 1. Create a procedure to update the total field of Sale table (which is the sum of product of qty_sold, price and its tax amount). tax attribute contains percentage of tax.
-- And the same procedure should decrement the qty_on_hand after sale of an item. Its should print all possible error messages.


DELIMITER //
CREATE PROCEDURE UpdateTotal(IN id INT(3))
BEGIN
    DECLARE qty_sold INT;
    DECLARE 

END //
DELIMITER ;











-- 
-- DELIMITER //
-- CREATE PROCEDURE startSale(IN id INT(3),IN quantity INT)
-- BEGIN
-- 	
--     DECLARE item_price DECIMAL(10,2);
--     DECLARE tax_total DECIMAL(10,2);
--     DECLARE tax_perc INT;
--     DECLARE qty_on_table INT;
--     
--     IF NOT EXISTS (SELECT * FROM item WHERE item_id=id)
--     THEN
--         SELECT 'Item ID:', id, 'does NOT exist' AS MESSAGE,MESSAGE;
--     ELSE
-- 	SELECT qty_on_hand INTO qty_on_table FROM item WHERE item_id = id;
--         IF qty_on_table >= quantity
--         THEN
--             SELECT price INTO item_price FROM item WHERE item_id = id;
--             SELECT tax INTO tax_perc FROM item WHERE item_id = id;
--             SET tax_total = (tax_perc*item_price*quantity)/100;
--             INSERT INTO Sale VALUES(null,id,quantity,item_price,tax_total+(item_price*quantity));    
--             UPDATE item SET qty_on_hand = qty_on_hand - quantity WHERE item_id=id;
--             SELECT 'Saled Successfully' AS MESSAGE; 
--         ELSE
--             select 'Insufficient quantity',quantity AS MESSAGE;
--         END IF;
--     END IF ;
-- END //
-- DELIMITER ;
-- 
-- -- 2. Create a trigger to insert an entry in the purchase_log to record the item details when attribute qty_on_hand becomes zero in the Item table
-- 
-- DELIMITER //
-- create trigger insertentry
-- after delete
-- on Item
-- for each row
-- BEGIN
--     IF(Item.qty_on_hand=0)
--     THEN
--       insert into purchase_log(serialNo,item_id,item_desc,time) values(null,old.item_id,old.item_desc,curdate());
--     END IF;
-- END //
-- DELIMITER ;
-- 
-- -- 3. Create a function to check the whether a given item is present in the item table.
-- -- And print appropriate messages. Also this function must be invoked from the above mentioned procedure.
-- 
-- DELIMITER //
-- CREATE FUNCTION check_item(id INT) RETURNS TEXT DETERMINISTIC
-- BEGIN
-- DECLARE ct INTEGER;
-- DECLARE myreturn VARCHAR(100);
-- 
-- SELECT count(item_id) INTO ct FROM item WHERE item_id=id;
-- if ct =1
-- then
-- 	set myreturn= "FOUND";
-- else
-- 	set myreturn = "NOT FOUND";
-- end if;
-- return myreturn;
-- 
-- END //
-- DELIMITER ;
-- 
-- 
-- -- 4. Write a SQL query to find the item description that ends with letter 'r'
-- 
-- SELECT item_desc FROM Item WHERE item_desc="%r";
-- 
-- 
-- -- 5. Write SQL query to find the item_id of item having lowest sale (based on total attribute)
-- 
-- SELECT item_id FROM Sale WHERE total = (SELECT MIN(total) FROM Sale);
-- 
-- 
-- -- 6. Write SQL query to find the item_desc of item having lowest sale (based on total attribute)
-- 
-- SELECT item_desc FROM Item, Sale WHERE total = (SELECT MIN(total) FROM Sale) AND Item.item_id = Sale.item_id;
-- 
-- 
-- 
-- -- 7. Create a view to get the sale_id and its corresponding category (of Item)
-- 
-- CREATE VIEW sale_info AS SELECT sale.sale_id , item.category from sale,item where sale.item_id = item.item_id ;
-- select * from Sale ;
-- 
-- 



