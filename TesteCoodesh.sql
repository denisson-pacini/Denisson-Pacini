create database Bike
go
use Bike
go
CREATE TABLE CUSTOMERS(
	customer_id int primary key identity,
	first_name	varchar(200),
	last_name	varchar(200),
	phone		varchar(15),
	email		varchar(100),
	street		varchar(200),
	city		varchar(100),
	state		varchar(100),
	zip_code	varchar(100)
)
go
insert into CUSTOMERS values ('Jose', 'mosteiro', '11998888888', 'josem@gmail.com', 'rua do padre', 'São Paulo', 'SP', '04444555')
insert into CUSTOMERS values ('Joares', 'monte', '11998888889', 'joares@gmail.com', 'rua Um', 'Belo Horizonte', 'MG', '04444555')
insert into CUSTOMERS values ('Janaina', 'priscila', '11998888858', 'janaina@gmail.com', 'rua Dois', 'Cuiaba', 'MT', '04444555')
insert into CUSTOMERS values ('Karina', 'Nascimento', '11998888288', 'karina@gmail.com', 'rua Tres', 'Rio de Janeiro', 'RJ', '04444555')
insert into CUSTOMERS values ('Michele', 'Caetano Fernandes', '11995888888', 'michele@gmail.com', 'Rua quatro', 'Curitiba', 'PR', '04444555')
insert into CUSTOMERS values ('Joana', 'Caetano Fernandes', '11995888888', 'michele@gmail.com', 'Rua quatro', 'Curitiba', 'PR', '04444555')
go
create table stores(
	store_id	int primary key identity,
	store_name	varchar(200),
	phone		varchar(15),
	email		varchar(100),
	street		varchar(200),
	city		varchar(100),
	state		varchar(100),
	zip_code	varchar(100)
)
go
insert into stores values ('mosteiro', '11998888888', 'josem@gmail.com', 'rua do padre', 'São Paulo', 'SP', '04444555')
insert into stores values ('monte', '11998888889', 'joares@gmail.com', 'rua Um', 'Belo Horizonte', 'MG', '04444555')
insert into stores values ('priscila', '11998888858', 'janaina@gmail.com', 'rua Dois', 'Cuiaba', 'MT', '04444555')
insert into stores values ('Nascimento', '11998888288', 'karina@gmail.com', 'rua Tres', 'Rio de Janeiro', 'RJ', '04444555')
insert into stores values ('Caetano Fernandes', '11995888888', 'michele@gmail.com', 'Rua quatro', 'Curitiba', 'PR', '04444555')
go
create table staffs(
	staff_id	int primary key identity,
	first_name	varchar(200),
	last_name	varchar(200),
	email		varchar(100),
	phone		varchar(15),
	active		char(1),
	store_id	int,
	mananger_id	int
)
alter table staffs add constraint fk_staff_store foreign key (store_id) references stores(store_id)
go
insert into staffs values ('Jose', 'mosteiro', 'josem@gmail.com', '11998888888',  1, 1, 1)
insert into staffs values ('Joares', 'monte', 'joares@gmail.com', '11998888889', 1, 2, 1)
insert into staffs values ('Janaina', 'priscila', 'janaina@gmail.com', '11998888858', 1, 3, 2)
insert into staffs values ('Karina', 'Nascimento', 'karina@gmail.com', '11998888288', 0, 4, 2)
insert into staffs values ('Michele', 'Caetano Fernandes', 'michele@gmail.com', '11995888888',0 , 5, 2)
insert into staffs values ('Maria', 'Caetano Fernandes', 'michele@gmail.com', '11995888888',0 , 5, 2)
insert into staffs values ('Marcela', 'Caetano Fernandes', 'michele@gmail.com', '11995888888',0 , 5, 2)
go
create table orders(
	order_id		int primary key identity,
	customer_id		int,
	order_status	bit,
	order_date		datetime,
	required_date	datetime,
	shiped_date		datetime,
	store_id		int,
	staff_id		int
)
alter table orders add constraint fk_orders_customer foreign key (customer_id) references CUSTOMERS(customer_id)
alter table orders add constraint fk_orders_stores foreign key (store_id) references stores(store_id)
alter table orders add constraint fk_orders_staffs foreign key (staff_id) references staffs(staff_id)
go
insert into orders values (1, 1, GETDATE(), GETDATE(), GETDATE(), 1, 1)
insert into orders values (2, 2, GETDATE(), GETDATE(), GETDATE(), 2, 2)
insert into orders values (3, 3, GETDATE(), GETDATE(), GETDATE(), 3, 3)
insert into orders values (4, 4, GETDATE(), GETDATE(), GETDATE(), 4, 4)
insert into orders values (5, 5, GETDATE(), GETDATE(), GETDATE(), 5, 5)
go
create table categories(
	category_id		int primary key identity,
	category_name	varchar(200)
)
go
insert into categories values ('Speed')
insert into categories values ('Mountain Bike')
go
create table brands(
	brand_id	int primary key identity,
	brand_name	varchar(200)
)
go
insert into brands values ('Coli')
insert into brands values ('Caloi')
insert into brands values ('Specialize')
go
create table product(
	product_id		int primary key identity,
	product_name	varchar(300),
	brand_id		int,
	category_id		int,
	model_year		varchar(4),
	list_price		decimal(10,2)
)
alter table product add constraint fk_product_brand foreign key (brand_id) references brands(brand_id)
alter table product add constraint fk_product_categories foreign key (category_id) references categories(category_id)
go
insert into product values ('Bike', 1, 1, '2025', 10000.25)
insert into product values ('Bike Dois', 2, 2, '2022', 11000.25)
insert into product values ('Bike Tres', 3, 1, '2025', 12000.25)
insert into product values ('Bike Quatro', 3, 2, '2025', 13000.25)
insert into product values ('Bike Cinco', 3, 2, '2025', 13000.25)
go
create table order_items(
	items_id		int primary key identity,
	order_id		int,
	product_id		int,
	quantity		int,
	list_price		decimal(10,2),
	discount		decimal(10,4)
)
alter table order_items add constraint fk_order_items_orders foreign key (order_id) references orders(order_id)
alter table order_items add constraint fk_order_items_product foreign key (product_id) references product(product_id)
go
insert into order_items values (1, 1, 2, 15000.50, 10)
insert into order_items values (1, 1, 5, 15000.50, 10)
insert into order_items values (2, 2, 3, 7000.50, 10)
insert into order_items values (2, 2, 2, 7000.50, 10)
insert into order_items values (3, 3, 5, 9000.50, 10)
insert into order_items values (3, 3, 5, 9000.50, 10)
insert into order_items values (4, 4, 6, 5000.50, 10)
insert into order_items values (4, 4, 10, 5000.50, 10)
go
create table stocks(
	store_id	int primary key identity,
	product_id	int,
	quantity	int
)
alter table stocks add constraint fk_stocks_product foreign key (product_id) references product(product_id)
go
insert into stocks values (1, 10)
insert into stocks values (2, 10)
insert into stocks values (3, 10)
insert into stocks values (4, 10)

--1 - Selecionar todos os clientes que não tem compras
select * from CUSTOMERS c where not exists (select top 1 1 from orders o where o.customer_id = c.customer_id)
-- 2 - Listar os Produtos que não tenham sido comprados
select * from product p where not exists (select top 1 1 from order_items it where it.product_id = p.product_id)
-- 3 - Listar os Produtos sem Estoque
select * from product p where not exists (select top 1 1 from stocks st where st.product_id = p.product_id)
-- 4 - Agrupar a quantidade de vendas que uma determinada Marca por Loja.
select sum(oi.quantity) quantidade_vendas 
	, b.brand_name
	, st.first_name
from staffs st
inner join orders os on os.staff_id = st.staff_id
inner join order_items oi on oi.order_id = os.order_id
inner join product p on p.product_id = oi.product_id
inner join brands b on b.brand_id = p.brand_id
group by st.first_name, b.brand_name
-- 5 - Listar os Funcionarios que não estejam relacionados a um Pedido.
select * from staffs st where not exists (select top 1 1 from orders od where od.staff_id = st.staff_id)



