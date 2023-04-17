--1)List all products.
SELECT * FROM product;

--2)List all printer makers. Result set: maker.
SELECT distinct maker FROM product where type = 'Printer';

--3)Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen FROM laptop WHERE price > 1000;

--4)Find all records from the Printer table containing data about color printers.
SELECT * FROM printer WHERE color = "y";

--5)Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd FROM pc where price < 600 and cd in ('12x', '24x');

--6)For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
SELECT p.maker, l.speed
FROM product p 
INNER JOIN laptop l ON p.model = l.model
where p.type = 'laptop' AND l.hd >= 10;

--7)Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
SELECT DISTINCT p.maker
FROM product p 
INNER JOIN pc  ON p.model = pc.model
where p.type = 'pc' AND pc.speed >= 450;

--8)Find the printer models having the highest price. Result set: model, price.
SELECT model, price FROM printer where price = (SELECT MAX(price) FROM printer);

--9)Find out the average speed of PCs.
SELECT avg(speed) FROM pc;

--10)Find out the average speed of the laptops priced over $1000.
SELECT avg(speed) FROM laptop where price > 1000;

--11)Find out the average speed of the PCs produced by maker A.
1)SELECT avg(speed) FROM pc WHERE model in (SELECT model FROM product WHERE  maker = 'A' and type = 'PC');
2)SELECT avg(speed) FROM PC 
INNER JOIN product pr ON pc.model = pr.model 
WHERE maker = 'A' 

--12)Get hard drive capacities that are identical for two or more PCs.
--Result set: hd.
--Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd FROM pc  group by hd HAVING(count(*) >= 2);

--13)Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
--Result set: model with the bigger number, model with the smaller number, speed, and RAM.
SELECT p1.model, p2.model, p1.speed, p1.ram FROM pc p1 
INNER JOIN pc p2 ON p1.speed = p2.speed and p1.ram = p2.ram
WHERE p1.model <> p2.model and p1.model > p2.model

--14)Get the laptop models that have a speed smaller than the speed of any PC.
--Result set: type, model, speed.
SELECT type, l.model, speed  FROM laptop l
INNER JOIN product p ON l.model = p.model
where speed < (SELECT min(speed) FROM pc);

--15)Find the makers of the cheapest color printers.
--Result set: maker, price
SELECT p.maker, pr.price FROM product p
INNER JOIN printer pr ON p.model = pr.model
WHERE color= 'y' AND price = (SELECT min(price) FROM printer where color = 'y');

--16)For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
--Result set: maker, average screen size.
SELECT maker, avg(screen) FROM product p
INNER JOIN laptop l ON p.model = l.model
WHERE type = 'laptop' 
GROUP BY maker;

--17)Find the makers producing at least three distinct models of PCs.
--Result set: maker, number of PC models.
SELECT maker, count(model) FROM product WHERE type = 'pc' 
GROUP BY maker
HAVING(count(model) >= 3)

--18)Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.
SELECT maker, max(price) FROM  product p 
INNER JOIN pc ON p.model = pc.model
WHERE type = 'pc' 
GROUP BY maker
ORDER BY maker; 


--19)For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
--Result set: speed, average price.
SELECT speed, AVG(price) FROM pc WHERE speed > 600
GROUP BY speed


--20)Find the printer makers also producing PCs 
--with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
--Result set: maker.
SELECT DISTINCT p1.maker FROM product p1 
INNER JOIN product p2 ON p1.maker = p2.maker AND p1.type = 'pc' AND p2.type = 'printer' 
INNER JOIN pc ON p1.model = pc.model 
WHERE pc.model = (SELECT model FROM pc WHERE ram = (SELECT min(ram) FROM pc) AND  speed = (SELECT max(speed) FROM pc))
