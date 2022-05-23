Create Database Ecommerce;
Use Ecommerce;
-- drop database Ecommerce;

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);
-- iNSERT VALUES in Supplier table
INSERT INTO supplier VALUES (1,'Rajesh Retails', 'Delhi', '1234567890');
INSERT INTO supplier VALUES (2,'Appario Ltd', 'Mumbai', '2589631470');
INSERT INTO supplier VALUES (3,'Knome products', 'Banglore', '9785462315');
INSERT INTO supplier VALUES (4,'Bansal Retails ', 'Kochi', '8975463285');
INSERT INTO supplier VALUES (5,'Mittal Ltd.', 'Lucknow', '7898456532');

-- customer table
CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

-- INSERT VALUES IN customer table
insert into customer values (1,'AAKASH','9999999999','DELHI','M');
insert into customer values (2,'AMAN','9785463215','NOIDA','M');
insert into customer values (3,'NEHA','9999999999','MUMBAI','F');
insert into customer values (4,'MEGHA','9994562399','KOLKATA','F');
insert into customer values (5,'PULKIT','7895999999','LUCKNOW','M');

-- Table category
CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

-- Insert values to category table
INSERT INTO category VALUES (1, 'BOOKS');
INSERT INTO category VALUES (2, 'GAMES');
INSERT INTO category VALUES (3,'GROCERIES');
INSERT INTO category VALUES (4,'ELECTRONICS');
INSERT INTO category VALUES (5,'CLOTHES');

-- Table product
CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);
-- drop table product;
-- insert values in product table
INSERT INTO product VALUES (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT INTO product VALUES (2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
INSERT INTO product VALUES (3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
INSERT INTO product VALUES (4,'OATS','Highly Nutritious from Nestle',3);
INSERT INTO product VALUES (5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
INSERT INTO product VALUES (6,'MILK','1L Toned MIlk',3);
INSERT INTO product VALUES (7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
INSERT INTO product VALUES (8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
INSERT INTO product VALUES (9,'Project IGI','compatible with windows 7 and above',2);
INSERT INTO product VALUES (10,'Hoodie','Black GUCCI for 13 yrs and above',5);
INSERT INTO product VALUES (11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
INSERT INTO product VALUES (12,'Train Your Brain','By Shireen Stephen',1);

-- Table supplier_pricing
CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

-- Insert values into supplier_pricing
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

-- TABLE order
CREATE TABLE IF NOT EXISTS ecommerce.order (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

INSERT INTO ecommerce.order VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO ecommerce.order VALUES (102,1000,'2021-10-12' ,3,5);
INSERT INTO ecommerce.order VALUES (103,30000,'2021-09-16' ,5,2);
INSERT INTO ecommerce.order VALUES (104,1500,'2021-10-05' ,1,1);
INSERT INTO ecommerce.order VALUES (105,3000,'2021-08-16' ,4,3);
INSERT INTO ecommerce.order VALUES (106,1450,'2021-08-18' ,1,9);
INSERT INTO ecommerce.order VALUES (107,789,'2021-09-01' ,3,7);
INSERT INTO ecommerce.order VALUES (108,780,'2021-09-07' ,5,6);
INSERT INTO ecommerce.order VALUES (109,3000,'2021-00-10' ,5,3);
INSERT INTO ecommerce.order VALUES (110,2500,'2021-09-10' ,2,4);
INSERT INTO ecommerce.order VALUES (111,1000,'2021-09-15' ,4,5);
INSERT INTO ecommerce.order VALUES (112,789,'2021-09-16' ,4,7);
INSERT INTO ecommerce.order VALUES (113,31000,'2021-09-16',1 ,8);
INSERT INTO ecommerce.order VALUES (114,1000,'2021-09-16',3,5);
INSERT INTO ecommerce.order VALUES (115,3000,'2021-09-16',5,3);
INSERT INTO ecommerce.order VALUES (116,99,'2021-09-17',2, 14);

-- Table rating
CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID)
        REFERENCES ecommerce.order (ORD_ID)
);

-- INSERT VALUES IN rating table 
INSERT INTO rating VALUES (1,101,4);
INSERT INTO rating VALUES (2,102,3);
INSERT INTO rating VALUES (3,103,1);
INSERT INTO rating VALUES (4,104,2);
INSERT INTO rating VALUES (5,105,4);
INSERT INTO rating VALUES (6,106,3);
INSERT INTO rating VALUES (7,107,4);
INSERT INTO rating VALUES (8,108,4);
INSERT INTO rating VALUES (9,109,3);
INSERT INTO rating VALUES (10,110,5);
INSERT INTO rating VALUES (11,111,3);
INSERT INTO rating VALUES (12,112,4);
INSERT INTO rating VALUES (13,113,2);
INSERT INTO rating VALUES (14,114,1);
INSERT INTO rating VALUES (15,115,1);
INSERT INTO rating VALUES (16,116,0);

-- Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
SELECT 
    cus_gender, COUNT(cus_gender)
FROM
    ecommerce.customer
WHERE
    cus_id IN (SELECT 
            cus_id
        FROM
            ecommerce.order
        GROUP BY cus_id
        HAVING SUM(ORD_AMOUNT) >= 3000)
GROUP BY CUS_GENDER
ORDER BY CUS_GENDER;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT 
    ord_id,
    ord_amount,
    ord_date,
    o.cus_id,
    o.pricing_id,
    pro_name
FROM
    ecommerce.order o,
    ecommerce.customer c,
    ecommerce.supplier_pricing sp,
    ecommerce.product p
WHERE
    o.cus_id = c.CUS_ID
        AND o.PRICING_ID = sp.PRICING_ID
        AND sp.PRO_ID = p.PRO_ID
        AND c.CUS_ID = 2;

-- 5) Display the Supplier details who can supply more than one product
SELECT 
    *
FROM
    supplier
WHERE
    supp_id IN (SELECT 
            supp_id
        FROM
            supplier_pricing
        GROUP BY supp_id
        HAVING COUNT(supp_id) > 1);
        
-- 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT @@SESSION .sql_mode INTO @session_sql_mode;
set session sql_mode='';

SELECT 
    c.cat_id, cat_name, pro_name, min_price
FROM
    (SELECT 
        cat_id, p.pro_id, MIN(supp_price) AS min_price
    FROM
        supplier_pricing sp, product p
    WHERE
        sp.PRO_ID = p.PRO_ID
    GROUP BY p.CAT_ID) AS cat_min_price,
    category c,
    product p
WHERE
    c.cat_id = p.cat_id
        AND p.PRO_ID = cat_min_price.prod_id; 
        
set session sql_mode= @session_sql_mode;

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT 
    p.pro_id, pro_name
FROM
    product p,
    supplier_pricing sp,
    ecommerce.order o
WHERE
    p.pro_id = sp.pro_id
        AND sp.PRICING_ID = o.PRICING_ID
        AND o.ORD_DATE > '2021-10-05'
      
-- 8) Display customer name and gender whose names start or end with character 'A'.
Select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A';

-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
 -- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
 
 Delimiter &&
 Create procedure display_supplier_ratings()
 BEGIN
 
 Select s.supp_id, s.supp_name, avg(rat_ratstars),
 case when avg(rat_ratstars) = 5 then 'Excellent Service'
	  when avg(rat_ratstars) > 4 then 'Good Service'
      when avg(rat_ratstars) > 2 then 'Average Service'
      else 'POOR Service'
end as type_of_service
 from supplier s, ecommerce.order o, supplier_pricing sp, rating r 
 where s.SUPP_ID = sp.SUPP_ID
 and sp.PRICING_ID= o.PRICING_ID
 and o.ORD_ID=r.ORD_ID
 group by s.SUPP_ID order by s.SUPP_ID;
 end &&
 DELIMITER ;
 
call display_supplier_ratings();