/*
Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.


Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
*/

select model, speed, hd
from PC
where price < 500

/*
Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: make
*/

Select distinct maker
from Product
where type = 'Printer'

/*
Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
*/

Select model, ram, screen
from Laptop
where price >1000

/*
Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров.
*/

Select *
from Printer
where color = 'y'

/*
Задание: 5 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
*/

select Product.model, PC.speed, PC.hd 
from Product inner join PC
on Product.model = PC.model
where cd in ('12x', '24x') and price < 600

/*
Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
*/

Select distinct Product.Maker, Laptop.speed 
from Product inner join Laptop
on Product.model = Laptop.model
where Laptop.hd >= 10 and type = 'Laptop';

SELECT DISTINCT Product.maker, Laptop.speed
FROM Product, Laptop 
WHERE Laptop.hd >= 10 AND 
 type IN (SELECT type FROM Product 
 WHERE type = 'laptop');
 

/*
Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
*/

Select Product.model, Laptop.price
from Product inner join Laptop
on Product.model = Laptop.model
where Product.maker = 'B'
Union
Select Product.model, PC.price
from Product inner join PC
on Product.model = PC.model
where Product.maker = 'B'
Union
Select Product.model, Printer.price
from Product inner join Printer
on Product.model = Printer.model
where Product.maker = 'B'

/*
Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
*/

Select distinct Product.maker 
from Product inner join PC
on Product.model = Pc.model
where Product.maker not in (select distinct Product.maker 
from Product inner join Laptop
on Product.model = Laptop.model);

/*
Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
*/

Select distinct maker from product
inner join pc
on product.model = pc.model
where speed >= 450

/*
Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
*/

select model, price from printer
where price = (select max(price) from printer)

/*
Задание: 11 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК.
*/

Select AVG(speed) from PC

/*
Задание: 12 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
*/

Select AVG(speed) as avg_speed from laptop
where price > 1000

/*
Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.
*/

select avg(speed) as Avg_speed from pc
where speed in (select speed from PC inner join product
on pc.model = product.model
where product.maker = 'A')

SELECT AVG(speed) AS avg_speed 
FROM PC
WHERE speed IN (SELECT speed 
                FROM PC, Product 
                WHERE product.model = PC.model AND 
                      maker='A')

/*
Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
*/

select ships.class, ships.name, classes.country  
from ships inner join classes
on ships.class = classes.class
where numguns >= 10

/*
Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
*/

Select hd from PC
group by hd
having count(hd) >=2

/*
Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/

Select distinct A.model as model, B.model as model, A.speed, A.ram  from pc as A, pc as B 
where A.speed = B.speed and A.ram = B.ram and A.model > B.model

/*
Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
*/

Select product.type, laptop.model, laptop.speed 
from laptop inner join product
on laptop.model = product.model
where laptop.speed < (select min(speed) from pc)


/*
Задание: 18 (Serge I: 2003-02-03)
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
*/

Select maker, price 
from printer inner join product
on printer.model = product.model
where price = (select min(price) from printer where color = 'y') and color = 'y' 
Group by maker, price

/*
Задание: 19 (Serge I: 2003-02-13)
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
*/

select maker, AVG(screen) from laptop
inner join product
on laptop.model = product.model
Group by maker

/*
Задание: 20 (Serge I: 2003-02-13)
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
*/

Select maker, count(model) from product
where type = 'pc'
group by maker
having count(model) >= 3

/*
Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
*/

select maker, max(price) from product
inner join pc
on product.model = pc.model
group by maker

/*
Задание: 22 (Serge I: 2003-02-13)
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
*/

Select speed, avg(price) from pc
group by speed
having speed > 600

/*
Задание: 23 (Serge I: 2003-02-14)
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
*/

Select maker from product inner join pc
on product.model = pc.model
where speed >= 750
intersect
Select maker from product inner join laptop
on product.model = laptop.model
where speed >= 750

/*
Задание: 24 (Serge I: 2003-02-03)
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
*/

Select model from (
select model, price from pc
union 
select model, price from laptop
union 
select model, price from printer) tab_1
where price =(select max(price) from (select price from pc
union
select price from laptop
union
select price from printer)tab_2)

/*
Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM 
и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
*/

select distinct maker from pc inner join product 
on pc.model = product.model 
where maker in (Select distinct maker from product
where product.type = 'printer') 
and speed = (select max(speed) from pc where ram = (select min(ram) from pc)) 
and ram = (select min(ram) from pc)















