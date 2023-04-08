
/*SQL HomeWork 2. Joins

Подключится к 
Host: 159.69.151.133
Port: 5056
DB: подключение к той таблице где делали DDL операции
User: подключение к тем пользователем каким делали DDL операции
Pass: 123

Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )
*/

 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
 
select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

insert into salary(monthly_salary) 
values (2800),
		(3200);
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select distinct salary.monthly_salary 
from salary inner join employee_salary
on salary.id not in (select salary_id from employee_salary);

--вариант №2 если мы понимаем что ЗП назначена на сотрудников которых нет 

select employees.employee_name , salary.monthly_salary 
from employee_salary left join salary 
on employee_salary.salary_id = salary.id 
left join employees
on employee_salary.employee_id  = employees.id
where employees.employee_name  is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

insert into salary(monthly_salary) 
values (800),
		(200);
 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select distinct salary.monthly_salary 
from salary inner join employee_salary
on salary.id not in (select salary_id from employee_salary)
where salary.monthly_salary < 2000;	

--5. Найти всех работников кому не начислена ЗП. !!!!!!!!!!!!!!!!!!!!!!!!!!!!

select distinct employees.employee_name
from employee_salary inner join employees
on employees.id not in (select employee_id from employee_salary);

	
select employee_name, monthly_salary
from salary inner join employee_salary 
on employee_salary.salary_id = salary.id
right join employees 
on employee_salary.employee_id = employees.id
	where monthly_salary is null;


--6. Вывести всех работников с названиями их должности.

select employees.employee_name, roles2.role_name  
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id 
inner join employees
on employees.id = roles_employee.employee_id;
	
--7. Вывести имена и должность только Java разработчиков.	
 
select employees.employee_name, roles2.role_name
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id
inner join employees
on employees.id = roles_employee.employee_id
where role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.

select employees.employee_name, roles2.role_name
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id
inner join employees
on employees.id = roles_employee.employee_id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.

select employees.employee_name, roles2.role_name
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id
inner join employees
on employees.id = roles_employee.employee_id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select employees.employee_name, roles2.role_name
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id
inner join employees
on employees.id = roles_employee.employee_id
where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA

select employees.employee_name, roles2.role_name
from roles_employee inner join roles2 
on roles2.id = roles_employee.role_id
inner join employees
on employees.id = roles_employee.employee_id
where role_name like '%Automation QA%';
 
--12. Вывести имена и зарплаты Junior специалистов
 
select employees.employee_name, roles2.role_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee 
on employees.id = roles_employee.employee_id 
inner join roles2
on roles2.id = roles_employee.role_id
where role_name like '%Junior%';


select employees.employee_name, roles2.role_name 
from employees
inner join roles_employee 
on employees.id = roles_employee.employee_id 
inner join roles2
on roles2.id = roles_employee.role_id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id = roles_employee.employee_id 
inner join roles2
on roles2.id = roles_employee.role_id  
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков

select salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
 
select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employees.employee_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select employees.employee_name, roles2.role_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Senior Java %';

--20. Вывести зарплаты Junior QA инженеров

select employees.employee_name, roles2.role_name, salary.monthly_salary 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Junior% %QA%';

 --21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Junior%';
 
--22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%QA%';

--25. Вывести количество QA инженеров

select count(employee_name) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.

select count(employee_name) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(employee_name) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary.monthly_salary) 
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
where role_name like '%developer%';
 
--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, salary.monthly_salary  
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id 
order by salary.monthly_salary;
 
--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, salary.monthly_salary  
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id
where salary.monthly_salary >= 1700 and salary.monthly_salary <= 2300 
order by salary.monthly_salary;
 
--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, salary.monthly_salary  
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id
where salary.monthly_salary < 2300 
order by salary.monthly_salary;
 
--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, salary.monthly_salary  
from employees inner join employee_salary
on employees.id = employee_salary.employee_id 
inner join salary
on salary.id = employee_salary.salary_id 
inner join roles_employee
on employees.id  = roles_employee.employee_id  
inner join roles2
on roles2.id = roles_employee.role_id
where salary.monthly_salary in (1100, 1500, 2000) 
order by salary.monthly_salary;