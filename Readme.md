# dbops-project

Создание базы данных и пользователя для миграций и автотестов

```sql
CREATE ROLE store_user WITH LOGIN PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE store TO store_user;
CREATE DATABASE store WITH OWNER store_user; 
```

Запрос, который покажет, какое количество сосисок было продано за каждый день предыдущей недели

```sql
select o.date_created as order_date, sum(op.quantity) as total_sausages_quantity
from orders o
         join order_product op on o.id = op.order_id
where o.status = 'shipped'
  AND o.date_created > NOW() - INTERVAL '7 DAYS'
group by o.date_created
order by o.date_created asc;
```