
-- 1. Создать таблицу employees

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select  * from employees;

-- 2. Наполнить таблицу employee 70 строками.

insert into employees (employee_name) 
values ('Kioshi'),
('Nino_Cortese'),
('Keith_Kraft'),
('Perry_Dennison'),
('Titus'),
('Adjunct'),
('Garl_Rathbone'),
('Brian_Cruz'),
('Hiro_Okamura'),
('Annie_Bonelli'),
('Bazil'),
('Ethan_Edwards'),
('Dennap'),
('Archer_Bryce'),
('Jimaine_Szardos'),
('Maia'),
('Ashley_Kafka'),
('Hippolyta_Trevor'),
('Carlos'),
('Feuer'),
('Maria_Santiago'),
('Carl_Burbank'),
('Young_Frankenstein'),
('Fera'),
('Leland_Owlsley'),
('Dixie'),
('Brood'), 
('Anais'),
('Shade'), 
('Luis_Alvarez'), 
('Mama_Madame'),
('Bizarro'),
('Mary_Elizabeth_Kane'), 
('Max_Kelvin'),
('Derek_Freeman'), 
('Kelsey_Leigh'),
('Fernando_Suarez'), 
('Nathaniel_Adam'),
('Rama_Khan'), 
('Avir'),
('Peter_Parker'), 
('Kazimierz_Kazimierczak'), 
('Ban-Luck'), 
('Ellie'),
('Gitche_Manitou'),
('Sarah_Kinney'),
('Kyle_Morgan'), 
('Mortigan_Goth'), 
('Horace_Rosenthal'), 
('Roger_Richter'),
('Spacker_Dave'), 
('Rita_Wayword'),
('Martin_Oksner_Burns'),
('Tsunami_II'),
('Kim_Il_Sung'),
('Trouble'),
('Maw'),
('Sparkler'),
('Tareva'),
('Manslaughter_Marsdale'),
('Johanna_Constantine'),
('Jordan_Wylie'),
('Cindy_Adams'),
('Galactus'),
('Death_Tiger'),
('Marandi_Sjorokker'),
('Duc_No_Tranh'),
('Rac_Shade'),
('Ernst_Sablinova'),
('Miri_Riam');



-- 3. Создать таблицу salary

create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- 4. Наполнить таблицу salary 15 строками:

insert into salary(monthly_salary) 
values (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
		
select  * from salary;
	
	-- 5. Создать таблицу employee_salary

create table employee_salary (
	id serial primary key,
	employee_id int UNIQUE not NULL,
	salary_id int NOT NULL);
	--FOREIGN KEY (employee_id)
	--	REFERENCES employees (id),
	--FOREIGN KEY (salary_id)
	--	REFERENCES salary (id)


-- 6. Наполнить таблицу employee_salary 40 строками

insert into employee_salary (employee_id, salary_id) 
VALUES (1,2),
		(2,3),
		(3,4),
		(4,5),
		(5,6),
		(6,7),
		(7,8),
		(8,9),
		(9,10),
		(10,11),
		(11,12),
		(12,13),
		(13,14),
		(14,15),
		(15,16),
		(16,1),
		(17,2),
		(18,3),
		(19,4),
		(20,5),
		(21,6),
		(22,7),
		(23,8),
		(24,9),
		(25,10),
		(26,11),
		(27,12),
		(28,13),
		(29,14),
		(30,15),
		(80,2),
		(81,3),
		(82,4),
		(83,5),
		(84,5),
		(85,6),
		(86,7),
		(87,10),
		(88,5),
		(89,8);
	
select  * from employee_salary;
	

-- 7. Создать таблицу roles

create table roles2 (
	id serial primary key,
	role_name int not null unique
);
	
-- 8. Поменять тип столба role_name с int на varchar(30)

alter table roles2 alter column role_name type varchar(30);

-- 9. Наполнить таблицу roles 20 строками:

insert into roles2 (role_name) 
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('unior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
	
select  * from roles2;	

/* 10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/

create table roles_employee (
	id serial primary key,
	employee_id int UNIQUE not NULL,
	role_id int NOT NULL);
	FOREIGN KEY (employee_id)
		REFERENCES employees (id),
	FOREIGN KEY (role_id)
		REFERENCES roles2 (id)
		);
	

-- 11. Hаполнить таблицу roles_employee 40 строками:

insert into roles_employee (employee_id, role_id) 
values  (1,3),
		(4,4),
		(6,6),
		(8,7),
		(10,8),
		(12,7),
		(14,1),
		(16,2),
		(18,4),
		(20,11),
		(22,10),
		(24,11),
		(26,13),
		(28,9),
		(29,6),
		(31,8),
		(33,9),
		(35,11),
		(38,16),
		(40,15),
		(42,11),
		(44,3),
		(46,5),
		(48,13),
		(50,13),
		(52,5),
		(54,7),
		(56,14),
		(58,11),
		(60,2),
		(62,6),
		(64,7),
		(66,3),
		(68,8),
		(69,13),
		(13,16),
		(15,12),
		(17,11),
		(19,2),
		(21,8);

select  * from roles_employee;
