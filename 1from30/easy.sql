/*
select bazadan malumot olib keladi 
distinct takrorlanganlari chiqmaydi 
where filtr qilib beradi masalan faqat Uzbekistonlik oluvchilar kerak yoki faqat 18 yoshga tolganlar kerak 
order by asc desc si asc a dan z gacham tartiblab beradi desc z dan a gacha yoki teskarisi 
and ikkita shartni bir biriga boglaydi  va ikklasi ham true true berishi kerak agar bittasi false bittasi true bolsa logika ishlamaydi 
or da bitta true bitta false bolsa ishlaydi 

qoshimda savollar and va or da 
orda hato yizmman bittasi true bolsa ham bolar ekan true true natija true bitta true bitta false bolsa hham bolar ekan 


and da esa teskari bolarkan unda ikklasi ham true bolishi kerak ekan  ha demak agar false true bolsa natija chiqmaydi 


*/


-- MALUMOTLAR OZGARTIRISH 

/*
1)insert into  
insert into  bu tablega yangi qator qoshadi 
2)update -> bu tabledagi malumotlarni yangilaydi  
3)delete -> bu yerda malumotlarni ochiradi delete where ni ishlatsa boladi 
4)null -> null bosh qlgan katakchalar bilan ishlash 

*/

insert into  employees  values ('Abdulaziz', 19, 'Tashkent');

update from employees
set name = 'Abdulaziz'
where id =  1  -- bu xato ekan from qoyilmas ekan 

-- togri varianti 

update employees
set name = 'Abdulaziz'
where id =  1

delete employees
where id = 3 -- bu yerda malumot kerak ekan shuning uchun from ishlatilar ekan 


-- togri varianti 
delete from employees
where id = 3
-- bu togri variant 


/*
funksiylar  va qidiruv
Top(Limit) faqat birinchi 5 ta yoki 10 ta natijasini korish 
AGGREGATE FUNCTIONS 
MIN(), COUNT(), SUM(), AVG(), 
LIKE
in & between 
*/


select * from employees
Top(5) -- bu juda katta xato 
-- bu yerda top selectdan keyin yozilar ekan 

-- Togri version 

select top 5 * from employees

-- MASALAR 
-- 1) Misol 
select * from students 

-- 2) misol 

select name, age from employees

-- 3) misol 

select city from students
distinct city
-- xato 

select distinct city from students

select distinct name from students

select distinct country from students

select distinct model from electronics 


--4) misol 

select * from students
where age > 18 

--5 misol 

select * from students
where city = 'Tashkent'

--6 misol 

select * from students 
where age = 18 and city = 'Samarqand'

--7 misol 


select * from students
where city = 'Tashkent' or city = 'Buxoro'


--8 misol 

select * from students
where city <> 'Tashkent'

--9 misol 

select * from students
order by desc

-- 10 misol 

select * from students 
order by asc


--11 misol 

insert into students values ('Abdulaziz', 19, 'Tashkent');


--12 misol 

update students
set city = 'USA'
where id = 5


--13-misol 

delete  from students
where id = 10 
-- from sozi shart ekan 

--14 misol 

select * from students
where phones is null

--15-misol 

select max(salary) from employees


--16 -misol 

select MIN(price) from products


--18 misol 

select COUNT(*) from order

-- 19 misol 

select SUM() from payments -- bu yerda qavsni ichida qayerda nima yozishim kerakligini yozishim shart ekan 
select SUM(amount) from payments -- bu togri variant 


--20 misol 


select AVG(studen) from students


--21 misol 

select * from students
order by Limit 5 end  -- bu juda ham xato yozilgan quary 
-- togrisi 
SELECT * FROM students
ORDER BY id DESC LIMIT 5;
--  bu yerda nima boldi table tanlandi 
-- keyin esa order by saralandi keyin nimani saraladik oshaniyozdik masalan id keyin 
-- osish mi yoki kotarilishmi oshani yozdik esc yoki desc keyin esa limit berdim limit 5 ta 

--22 misol 


select * from students
where name like '%ali%'


--23 misol 

select * from students
where name like 'A%'

--24 misol 


select * from students
where email like '%.com'


--25 misol 

select * from students
where city in ('Tashkent', 'Buxoro', 'Andijon')


--26 misol 

select * from  students
where age 18 between age 25 -- bu xato ekan lekin ishlamaydi 
-- togri varianti 

select * from students
where age 18 between 25 




--27 misol 

select * from students
where price 100000 between price 300000

-- 28 misol 

select * from students
where age 18 between age 25 and city <> 'Tashkent'  -- bu yerda xatolik ham bor 


SELECT * FROM students
WHERE (age BETWEEN 18 AND 25) AND city <> 'Tashkent';


-- 29 misol 

select * from orders
where status  in ('new', 'paid')
order by created_at desc;
-- 29 savolni uncha chunmadim qanday u created at boyicha saralash 

--30 misol 
select top(1) from products
where name like '%pro%' and price max()




31. Har bir mahsulotning nomi va uning kategoriya nomini chiqaring (INNER JOIN).

select p.product_name, p.category
from products p
INNER JOIN secondCategory 
on product_id = secondCategory_id


--32. Kategoriyasi hali yo'q bo'lgan mahsulotlarni ham qo'shib chiqaring (LEFT JOIN).

select p.product_name, p.category
from products p
LEFT JOIN secondCategory
on product_id = secondCategory_id

--33. Har bir kategoriyada nechta mahsulot borligini sanang (GROUP BY).

select * from products
GROUP by pro_duct


select pro_duct, count(*) as cnt
from products
group by pro_duct;


select pro_duct from products
group by pro_duct


--34. Mahsulotlar soni 10 tadan ko'p bo'lgan kategoriyalarni toping (HAVING).


select SUM(amount) from products


select
  category,
  sum(price) as total_price
from products
group by category;


----------------------------




select name_product, sum(amount) as total_price
from pro_duct
group by category;

-----------------------------------


select * from customers c where exists ( 
    select 1 from orders o 
    where o.customer_id = c.id
)
--------------------------------------

select * from customers c 
where exists (
    select 1 
    from orders o 
    where o.customer_id = c.id 
    and o.status = 'paid'
)

-------------------------------------------

select * from students s 
where exists (
    select 1 from group g 
    where g.id = s.group_id
)


-------------------------------------------

select * from customers c 
where exists (
    select 1 from orders o 
    where o.customer_id = c.id
)

-----------------------------------------------


select * from customers c 
where exists ( 
    select 1 
    from orders o 
    where o.customer_id = c.id
    and o.status = 'paid'
);
-----------------------------------------------


select * from categories cat where exists ( select 1 from products p where p.secondCategory_id = cat.id)


---------------------------------------------



/*
hop 
exists nima 
nimaga where ikki marta ishlatilgan where existing having bilan ishlatsa boladimi chunki having ham filtrku 

*/


select * from categories cat
where exists ( 
    select 1 
    from products p 
    where p.secondCategory_id = cat.id
)

/*
exists nima ?
exists - ichki query (subquery) kamida 1 qator qaytarsa true boladi. Shunda tashqi querydagi qator mos keladi deb olinadi 

*/


select * from customers c 
where exists ( 
    select 1 from orders o 
    where o.customer_id = c.id
); 

/*
Nega where 'ikki marta' yozilgan ?

buikkita alohida joy: 
tashqi where: qaysi customerlarni chiqarishni hal qiladi 
ichki where exists ichida qidirayotganda qatorni aniqlaydi 
ya'ni where bolmasa  
*/
------------------

select * from customers c 
where exists (
    select 1
    from orders o 
    where c.id =  o.id 
)


